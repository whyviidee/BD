<html>
    <body>
<?php
    try
    {
        include 'config.php';
        
        $mode = isset($_REQUEST['mode']) ? $_REQUEST['mode'] : '';
        $type = isset($_REQUEST['type']) ? $_REQUEST['type'] : '';
        $id = isset($_REQUEST['id']) ? $_REQUEST['id'] : '';
        
        if ($mode == "List") {
            if ($type == "ProcessoSocorro") {
                $prep = $db->prepare("SELECT numProcessoSocorro FROM ProcessoSocorro;");
                $prep->bindParam(':numProcessoSocorro', $_REQUEST['id']);
                $prep->execute();             
            }
            if ($type == "Meios") {
                $prep = $db->prepare("SELECT numMeio FROM Meio;");
                $prep->bindParam(':numMeio', $_REQUEST['id']);
                $prep->execute();             
            }
        }
        
        $result = $prep->fetchAll();
    
        echo("<h3>ProcessoSocorro</h3><table border=\"1\">\n");
        echo("<tr><td><b>numProcessoSocorro</b></td></tr>\n");
        foreach($result as $row)
        {
            echo("<tr><td>");
            echo($row['numProcessoSocorro']);
            echo("</td><td>\n");
           
        }
        echo("</table>\n");
        
        $prep = $db->prepare("SELECT numMeio FROM Meio;");
        $prep->execute();
        $result = $prep->fetchAll();
    
        echo("<h3>Meio</h3><table border=\"1\">\n");
        echo("<tr><td><b>numMeio</b></td></tr>\n");
        foreach($result as $row)
        {
            echo("<tr><td>");
            echo($row['numMeio']);
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
?></body>
</html>
