<html>
    <body>
<?php
    try
    {
        include 'config.php';
        
        $mode = isset($_REQUEST['mode']) ? $_REQUEST['mode'] : '';
        $type = isset($_REQUEST['type']) ? $_REQUEST['type'] : '';
        
        if ($mode == "add") {
            if ($type == "aluga") {
                $prep = $db->prepare("INSERT INTO Reserva VALUES();");
                $prep->execute();
                $last_id = $db->lastInsertId();
                
                $db->beginTransaction();
                $prep = $db->prepare("INSERT INTO aluga VALUES(:morada, :codigo, :data_inicio, :nif, :numero);");
                $prep->bindParam(':morada', $_REQUEST['morada']);
                $prep->bindParam(':codigo', $_REQUEST['codigo']);
                $prep->bindParam(':data_inicio', $_REQUEST['data_inicio']);
                $prep->bindParam(':nif', $_REQUEST['nif']);
                $prep->bindParam(':numero', $last_id);
                $prep->execute();
                
                $prep = $db->prepare("INSERT INTO estado (numero, estado) VALUES(:numero, 'nao aceite');");
                $prep->bindParam(':numero', $last_id);
                $prep->execute();
                $db->commit();
            }
        }
        
        
        $prep = $db->prepare("SELECT morada, codigo, data_inicio, data_fim, tarifa FROM oferta;");
        $prep->execute();
        $result = $prep->fetchAll();
    
        echo("<h3>oferta</h3><table border=\"1\">\n");
        echo("<tr><td><b>morada</b></td><td><b>codigo</b></td><td><b>data_inicio</b></td><td><b>data_fim</b></td><td><b>tarifa</b></td></tr>\n");
        foreach($result as $row)
        {
            echo("<tr><td>");
            echo($row['morada']);
            echo("</td><td>");
            echo($row['codigo']);
            echo("</td><td>");
            echo($row['data_inicio']);
            echo("</td><td>");
            echo($row['data_fim']);
            echo("</td><td>");
            echo($row['tarifa']);
            echo("</td></tr>\n");
        }
        echo("</table>\n");
        
        $prep = $db->prepare("SELECT nif, nome, telefone FROM user;");
        $prep->execute();
        $result = $prep->fetchAll();
    
        echo("<h3>user</h3><table border=\"1\">\n");
        echo("<tr><td><b>nif</b></td><td><b>nome</b></td><td><b>telefone</b></td></tr>\n");
        foreach($result as $row)
        {
            echo("<tr><td>");
            echo($row['nif']);
            echo("</td><td>");
            echo($row['nome']);
            echo("</td><td>");
            echo($row['telefone']);
            echo("</td></tr>\n");
        }
        echo("</table>\n");
        
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
    
        $db = null;
        $prep = null;
    }
    catch (PDOException $e)
    {
        echo("<p>ERROR: {$e->getMessage()}</p><br><a href=\"c.php\">Back</a>");
    }
?>
        <h3>Add new aluga</h3>
        <form action='c.php' method='post'>
            <p><input type='hidden' name='mode' value='add'/></p>
            <p><input type='hidden' name='type' value='aluga'/></p>
            <p>morada: <input type='text' name='morada'/></p>
            <p>codigo: <input type='number' name='codigo'/></p>
            <p>data_inicio: <input type='date' name='data_inicio'/></p>
            <p>nif: <input type='number' name='nif'/></p>
            <p><input type='submit' value='Submit'/></p>
        </form>
    </body>
</html>
