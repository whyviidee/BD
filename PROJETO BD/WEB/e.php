<html>
    <body>
<?php
    try
    {
        include 'config.php';

        $prep = $db->prepare("SELECT * FROM Meio NATURAL JOIN ProcessoSocorro WHERE numProcessoSocorro = :numProcessoSocorro;");
        $prep->bindParam(':numProcessoSocorro', $_REQUEST['numProcessoSocorro']);
        $prep->execute();
        $result = $prep->fetchAll();

        echo("<h3>Meios por Processo de Socorro</h3><table border=\"1\">\n");
        echo("<tr><td><b>numProcessoSocorro</b></td><td><b>numMeio</b></td><td><b>nomeMeio</b></td><td><b>nomeEntidade</b></td></tr>\n");
        foreach($result as $row)
        {
            echo("<tr><td>");
            echo($row['numprocessosocorro']);
            echo("</td><td>");
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
        echo("<p>ERROR: {$e->getMessage()}</p><br><a href=\"e.php\">Back</a>");
    }
?>
      <h3>Numero de Processo de Soccoro</h3>
      <form action='e.php' method='post'>
          <p>Processo: <input type='text' name='numProcessoSocorro'/></p>
          <p><input type='submit' value='Submit'/></p>
      </form>
    </body>
</html>
