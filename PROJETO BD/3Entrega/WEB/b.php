<html>
    <body>
<?php
    try
    {
        include 'config.php';

        $mode = isset($_REQUEST['mode']) ? $_REQUEST['mode'] : '';
        $type = isset($_REQUEST['type']) ? $_REQUEST['type'] : '';
        $id = isset($_REQUEST['id']) ? $_REQUEST['id'] : '';
        $id2 = isset($_REQUEST['id2']) ? $_REQUEST['id2'] : '';

        if ($mode == "delete") {
            if ($type == "MeioCombate") {
                $prep = $db->prepare("DELETE FROM MeioCombate WHERE numMeio = :numMeio AND nomeEntidade = :nomeEntidade;");
                $prep->bindParam(':numMeio', $_REQUEST['id']);
                $prep->bindParam(':nomeEntidade', $_REQUEST['id2']);
                $prep->execute();
            }
            if ($type == "MeioApoio") {
                $prep = $db->prepare("DELETE FROM MeioApoio WHERE numMeio = :numMeio AND nomeEntidade = :nomeEntidade;");
                $prep->bindParam(':numMeio', $_REQUEST['id']);
                $prep->bindParam(':nomeEntidade', $_REQUEST['id2']);
                $prep->execute();
            }
            if ($type == "MeioSocorro") {
                $prep = $db->prepare("DELETE FROM MeioSocorro WHERE numMeio = :numMeio AND nomeEntidade = :nomeEntidade;");
                $prep->bindParam(':numMeio', $_REQUEST['id']);
                $prep->bindParam(':nomeEntidade', $_REQUEST['id2']);
                $prep->execute();
            }
        }
        if ($mode == "edit") {
           if ($type == "MeioCombate") {
             $prep = $db->prepare("UPDATE MeioCombate SET numMeio = :numMeioC, nomeEntidade = :nomeEntidadeC WHERE numMeio = :numMeio AND nomeEntidade = :nomeEntidade;");
             $prep->bindParam(':numMeio', $_REQUEST['id']);
             $prep->bindParam(':nomeEntidade', $_REQUEST['id2']);
             $prep->execute();
            }

            if ($type == "MeioApoio") {

            }

            if ($type == "MeioSocorro") {

            }


        }

        if ($mode == "add") {
            if ($type == "MeioCombate") {
                $prep = $db->prepare("INSERT INTO MeioCombate VALUES(:numMeio, :nomeEntidade);");
                $prep->bindParam(':numMeio', $_REQUEST['numMeio']);
                $prep->bindParam(':nomeEntidade', $_REQUEST['nomeEntidade']);
                $prep->execute();
            }
            if ($type == "MeioApoio") {
                $prep = $db->prepare("INSERT INTO MeioApoio VALUES(:numMeio, :nomeEntidade);");
                $prep->bindParam(':numMeio', $_REQUEST['numMeio']);
                $prep->bindParam(':nomeEntidade', $_REQUEST['nomeEntidade']);
                $prep->execute();
            }
            if ($type == "MeioSocorro") {
                $prep = $db->prepare("INSERT INTO MeioSocorro VALUES(:numMeio, :nomeEntidade);");
                $prep->bindParam(':numMeio', $_REQUEST['numMeio']);
                $prep->bindParam(':nomeEntidade', $_REQUEST['nomeEntidade']);
                $prep->execute();
            }
        }

        $prep = $db->prepare("SELECT numMeio, nomeEntidade FROM MeioCombate;");
        $prep->execute();
        $result = $prep->fetchAll();

        echo("<h3>MeioCombate</h3><table border=\"1\">\n");
        echo("<tr><td><b>numMeio</b></td><td><b>nomeEntidade</b></td></tr>\n");
        foreach($result as $row)
        {
            echo("<tr><td>");
            echo($row['nummeio']);
            echo("</td><td>");
            echo($row['nomeentidade']);
            echo("</td><td>");
            echo("</td><td><a href=\"b.php?mode=delete&type=MeioCombate&id={$row['nummeio']}&id2={$row['nomeentidade']}\">delete</a></td></tr>\n");
        }
        echo("</table>\n");


        $prep = $db->prepare("SELECT numMeio, nomeEntidade FROM MeioApoio;");
        $prep->execute();
        $result = $prep->fetchAll();

        echo("<h3>MeioApoio</h3><table border=\"1\">\n");
        echo("<tr><td><b>numMeio</b></td><td><b>nomeEntidade</b></td></tr>\n");
        foreach($result as $row)
        {
            echo("<tr><td>");
            echo($row['nummeio']);
            echo("</td><td>");
            echo($row['nomeentidade']);
            echo("</td><td>");
            echo("</td><td><a href=\"b.php?mode=delete&type=MeioApoio&id={$row['nummeio']}&id2={$row['nomeentidade']}\">delete</a></td></tr>\n");

        }
        echo("</table>\n");



        $prep = $db->prepare("SELECT numMeio, nomeEntidade FROM MeioSocorro;");
        $prep->execute();
        $result = $prep->fetchAll();

        echo("<h3>MeioSocorro</h3><table border=\"1\">\n");
        echo("<tr><td><b>numMeio</b></td><td><b>nomeEntidade</b></td></tr>\n");
        foreach($result as $row)
        {
            echo("<tr><td>");
            echo($row['nummeio']);
            echo("</td><td>");
            echo($row['nomeentidade']);
            echo("</td><td>");
            echo("</td><td><a href=\"b.php?mode=delete&type=MeioSocorro&id={$row['nummeio']}&id2={$row['nomeentidade']}\">delete</a></td></tr>\n");

        }
        echo("</table>\n");

        $db = null;
        $prep = null;
    }







    catch (PDOException $e)
    {
        echo("<p>ERROR: {$e->getMessage()}</p><br><a href=\"b.php\">Back</a>");
    }
?>
        <h3>Add new MeioCombate</h3>
        <form action='b.php' method='post'>
            <p><input type='hidden' name='mode' value='add'/></p>
            <p><input type='hidden' name='type' value='MeioCombate'/></p>
            <p>numMeio: <input type='text' name='numMeio'/></p>
            <p>nomeEntidade: <input type='text' name='nomeEntidade'/></p>
            <p><input type='submit' value='Submit'/></p>
        </form>
        <h3>Add new MeioApoio</h3>
        <form action='b.php' method='post'>
            <p><input type='hidden' name='mode' value='add'/></p>
            <p><input type='hidden' name='type' value='MeioApoio'/></p>
            <p>numMeio: <input type='text' name='numMeio'/></p>
            <p>nomeEntidade: <input type='text' name='nomeEntidade'/></p>
            <p><input type='submit' value='Submit'/></p>
        </form>
        <h3>Add new MeioSocorro</h3>
        <form action='b.php' method='post'>
            <p><input type='hidden' name='mode' value='add'/></p>
            <p><input type='hidden' name='type' value='MeioSocorro'/></p>
            <p>numMeio: <input type='text' name='numMeio'/></p>
            <p>nomeEntidade: <input type='text' name='nomeEntidade'/></p>
            <p><input type='submit' value='Submit'/></p>
        </form>
    </body>
</html>
