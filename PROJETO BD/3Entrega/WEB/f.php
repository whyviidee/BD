<html>
    <body>
<?php
    try
    {
        include 'config.php';
        $prep = $db->prepare("SELECT * FROM MeioSocorro NATURAL JOIN Acciona NATURAL JOIN EventoEmergencia WHERE moradaLocal = :moradaLocal;");
        $prep->bindParam(':moradaLocal', $_REQUEST['moradaLocal']);
        $prep->execute();
        $result = $prep->fetchAll();

        echo("<h3>Meios de Socorro accionados por morada</h3><table border=\"1\">\n");
        echo("<tr><td><b>numProcessoSocorro</b></td><td><b>numMeio</b></td><td><b>nomeEntidade</b></td><td><b>moradaLocal</b></td></tr>\n");
        foreach($result as $row)
        {
            echo("<tr><td>");
            echo($row['numprocessosocorro']);
            echo("</td><td>");
            echo($row['nummeio']);
            echo("</td><td>");
            echo($row['nomeentidade']);
            echo("</td><td>");
            echo($row['moradalocal']);
            echo("</td><tr>");

        }
        echo("</table>\n");


        $db = null;
        $prep = null;
    }
    catch (PDOException $e)
    {
        echo("<p>ERROR: {$e->getMessage()}</p><br><a href=\"f.php\">Back</a>");
    }
?>
      <h3>Local de Incendio</h3>
      <form action='f.php' method='post'>
          <p>Local: <input type='text' name='moradaLocal'/></p>
          <p><input type='submit' value='Submit'/></p>
      </form>
    </body>
</html>
