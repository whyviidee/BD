<html>
    <body>
<?php
    try
    {
        include 'config.php';
        
        $mode = isset($_REQUEST['mode']) ? $_REQUEST['mode'] : '';
        $type = isset($_REQUEST['type']) ? $_REQUEST['type'] : '';
        
        if ($mode == "add") {
            if ($type == "paga") {
                $db->beginTransaction();
                $prep = $db->prepare("INSERT INTO paga VALUES(:numero, :data, :metodo);");
                $prep->bindParam(':numero', $_REQUEST['numero']);
                $prep->bindParam(':data', $_REQUEST['data']);
                $prep->bindParam(':metodo', $_REQUEST['metodo']);
                $prep->execute();
                
                $prep = $db->prepare("INSERT INTO estado (numero, estado) VALUES(:numero, 'pago');");
                $prep->bindParam(':numero', $_REQUEST['numero']);
                $prep->execute();
                $db->commit();
            }
        }
        
        
        $prep = $db->prepare("SELECT morada, codigo, data_inicio, nif, numero FROM aluga;");
        $prep->execute();
        $result = $prep->fetchAll();
    
        echo("<h3>aluga</h3><table border=\"1\">\n");
        echo("<tr><td><b>morada</b></td><td><b>codigo</b></td><td><b>data_inicio</b></td><td><b>nif</b></td><td><b>numero</b></td></tr>\n");
        foreach($result as $row)
        {
            echo("<tr><td>");
            echo($row['morada']);
            echo("</td><td>");
            echo($row['codigo']);
            echo("</td><td>");
            echo($row['data_inicio']);
            echo("</td><td>");
            echo($row['nif']);
            echo("</td><td>");
            echo($row['numero']);
            echo("</td></tr>\n");
        }
        echo("</table>\n");
        
        $prep = $db->prepare("SELECT numero, data, metodo FROM paga;");
        $prep->execute();
        $result = $prep->fetchAll();
    
        echo("<h3>aluga</h3><table border=\"1\">\n");
        echo("<tr><td><b>numero</b></td><td><b>data</b></td><td><b>metodo</b></td></tr>\n");
        foreach($result as $row)
        {
            echo("<tr><td>");
            echo($row['numero']);
            echo("</td><td>");
            echo($row['data']);
            echo("</td><td>");
            echo($row['metodo']);
            echo("</td></tr>\n");
        }
        echo("</table>\n");
    
        $db = null;
        $prep = null;
    }
    catch (PDOException $e)
    {
        echo("<p>ERROR: {$e->getMessage()}</p><br><a href=\"d.php\">Back</a>");
    }
?>
        <h3>Add new paga</h3>
        <form action='d.php' method='post'>
            <p><input type='hidden' name='mode' value='add'/></p>
            <p><input type='hidden' name='type' value='paga'/></p>
            <p>numero: <input type='text' name='numero'/></p>
            <p>data: <input type='date' name='data'/></p>
            <p>metodo: <input type='text' name='metodo'/></p>
            <p><input type='submit' value='Submit'/></p>
        </form>
    </body>
</html>
