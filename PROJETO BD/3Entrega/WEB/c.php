<html>
    <body>
<?php
    try
    {
        include 'config.php';
        $prep = $db->prepare("SELECT numProcessoSocorro FROM ProcessoSocorro ;");
        $prep->execute();
        $result = $prep->fetchAll();

        echo("<h3>ProcessoSocorro</h3><table border=\"1\">\n");
        echo("<tr><td><b>numProcessoSocorro</b></td></tr>\n");
        foreach($result as $row)
        {
            echo("<tr><td>");
            echo($row['numprocessosocorro']);
            echo("</td><tr>");
        }
        echo("</table>\n");

        $prep = $db->prepare("SELECT numMeio, nomeMeio, nomeEntidade FROM Meio;");
        $prep->execute();
        $result = $prep->fetchAll();

        echo("<h3>Meio</h3><table border=\"1\">\n");
        echo("<tr><td><b>numMeio</b></td><td><b>nomeMeio</b></td><td><b>nomeEntidade</b></td></tr>\n");
        foreach($result as $row)
        {
            echo("<tr><td>");
            echo($row['nummeio']);
            echo("</td><td>");
            echo($row['nomemeio']);
            echo("</td><td>");
            echo($row['nomeentidade']);
            echo("</td><tr>");

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
