<html>
    <body>
<?php
    try
    {
        include 'config.php';
        
        $mode = isset($_REQUEST['mode']) ? $_REQUEST['mode'] : '';
        $id = isset($_REQUEST['id']) ? $_REQUEST['id'] : '';
        
        if ($mode == "get") {
            $prep = $db->prepare("SELECT  morada, codigo, SUM(pago) total_pago
                                    FROM (SELECT morada, codigo_espaco as codigo, data_inicio, data_fim, tarifa * (data_fim - data_inicio + 1) pago 
                                          FROM aluga
                                          NATURAL JOIN oferta
                                          NATURAL JOIN paga
                                          NATURAL JOIN posto

                                          UNION   ALL
                                          
                                          SELECT morada, codigo, data_inicio, data_fim, tarifa * (data_fim - data_inicio + 1) pago
                                          FROM aluga
                                          NATURAL JOIN oferta
                                          NATURAL JOIN paga
                                          NATURAL JOIN espaco) result
                                    GROUP BY codigo, morada
                                    HAVING morada = :morada
                                    ORDER BY codigo;");
            $prep->bindParam(':morada', $_REQUEST['id']);
            $prep->execute();
            $result = $prep->fetchAll();

            echo("<h3>Result</h3><table border=\"1\">\n");
            echo("<tr><td><b>morada</b></td><td><b>codigo</b></td><td><b>total_pago</b></td></tr>\n");
            foreach($result as $row)
            {
                echo("<tr><td>");
                echo($row['morada']);
                echo("</td><td>");
                echo($row['codigo']);
                echo("</td><td>");
                echo($row['total_pago']);
                echo("</td></tr>\n");
            }
            echo("</table>\n");
        }
        
        
        $prep = $db->prepare("SELECT morada FROM edificio;");
        $prep->execute();
        $result = $prep->fetchAll();
    
        echo("<h3>edificio</h3><table border=\"1\">\n");
        echo("<tr><td><b>morada</b></td><td></td></tr>\n");
        foreach($result as $row)
        {
            echo("<tr><td>");
            echo($row['morada']);
            echo("</td><td><a href=\"e.php?mode=get&id={$row['morada']}\">Get Ammount</a></td></tr>\n");
        }
        echo("</table>\n");
    
        $db = null;
        $prep = null;
    }
    catch (PDOException $e)
    {
        echo("<p>ERROR: {$e->getMessage()}</p><br><a href=\"e.php\">Back</a>");
    }
?>
    </body>
</html>
