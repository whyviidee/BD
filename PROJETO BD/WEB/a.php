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
            if ($type == "Local") {
                $prep = $db->prepare("DELETE FROM Local WHERE moradaLocal = :moradaLocal;");
                $prep->bindParam(':moradaLocal', $_REQUEST['id']);
                $prep->execute();
            }
            if ($type == "EventoEmergencia") {
                $prep = $db->prepare("DELETE FROM EventoEmergencia WHERE numTelefone = :numTelefone AND instanteChamada = :instanteChamada;");
                $prep->bindParam(':numTelefone', $_REQUEST['id']);
                $prep->bindParam(':instanteChamada', $_REQUEST['id2']);
                $prep->execute();
            }
            if ($type == "ProcessoSocorro") {
                $prep = $db->prepare("DELETE FROM ProcessoSocorro WHERE numProcessoSocorro = :numProcessoSocorro ");
                $prep->bindParam(':numProcessoSocorro', $_REQUEST['id']);
                $prep->execute();
            }
            if ($type == "Meio") {
                $prep = $db->prepare("DELETE FROM Meio WHERE numMeio = :numMeio AND nomeEntidade = :nomeEntidade;");
                $prep->bindParam(':numMeio', $_REQUEST['id']);
                $prep->bindParam(':nomeEntidade', $_REQUEST['id2']);
                $prep->execute();
            }
            if ($type == "Entidade") {
                $prep = $db->prepare("DELETE FROM Entidade WHERE nomeEntidade = :nomeEntidade ");
                $prep->bindParam(':morada', $_REQUEST['id']);
                $prep->execute();
            }
        }
        if ($mode == "add") {
            if ($type == "Local") {
                $prep = $db->prepare("INSERT INTO Local VALUES(:moradaLocal);");
                $prep->bindParam(':moradaLocal', $_REQUEST['moradaLocal']);
                $prep->execute();
            }
            if ($type == "EventoEmergencia") {
                $prep = $db->prepare("INSERT INTO EventoEmergencia  (numTelefone, instanteChamada) VALUES(:numTelefone, :instanteChamada);");
                $prep->bindParam(':numTelefone', $_REQUEST['numTelefone']);
                $prep->bindParam(':instanteChamada', $_REQUEST['instanteChamada']);
                $prep->execute();
                
            }
            if ($type == "ProcessoSocorro") {
                $prep = $db->prepare("INSERT INTO ProcessoSocorro VALUES(:numProcessoSocorro);");
                $prep->bindParam(':numProcessoSocorro', $_REQUEST['numProcessoSocorro']);
                $prep->execute();

            }
            if ($type == "Meio") {
                $prep = $db->prepare("INSERT INTO Meio (numMeio,nomeEntidade) VALUES(:numMeio, :nomeEntidade);");
                $prep->bindParam(':numMeio', $_REQUEST['numMeio']);
                $prep->bindParam(':nomeEntidade', $_REQUEST['nomeEntidade']);
                $prep->execute();
            }
            if ($type == "Entidade") {
                $prep = $db->prepare("INSERT INTO Entidade VALUES(:nomeEntidade);");
                $prep->bindParam(':nomeEntidade', $_REQUEST['nomeEntidade']);
                $prep->execute();
            }
        }



        
        $prep = $db->prepare("SELECT moradaLocal FROM Local;");
        $prep->execute();
        $result = $prep->fetchAll();
    
        echo("<h3>Local</h3><table border=\"1\">\n");
        echo("<tr><td><b>moradaLocal</b></td><td></td></tr>\n");
        foreach($result as $row)
        {
            echo("<tr><td>");
            echo($row['moradaLocal']);
            echo("</td><td><a href=\"a.php?mode=delete&type=Local&id={$row['moradaLocal']}\">delete</a></td></tr>\n");
        }
        echo("</table>\n");




        
        $prep = $db->prepare("SELECT numTelefone, instanteChamada, nomePessoa, moradaLocal, numProcessoSocorro FROM EventoEmergencia NATURAL JOIN unique;");
        $prep->execute();
        $result = $prep->fetchAll();
    
        echo("<h3>EventoEmergencia</h3><table border=\"1\">\n");
        echo("<tr><td><b>numTelefone</b></td><td><b>instanteChamada</b></td><td><b>nomePessoa</b></td><td><b>moradaLocal</b></td><td><b>numProcessoSocorro</b></td></tr>\n");
        foreach($result as $row)
        {
            echo("<tr><td>");
            echo($row['numTelefone']);
            echo("</td><td>");
            echo($row['instanteChamada']);
            echo("</td><td>");
            echo($row['nomePessoa']);
            echo("</td><td>");
            echo($row['moradaLocal']);
            echo("</td><td>");
            echo($row['numProcessoSocorro']);
            echo("</td><td>");
            echo("</td><td><a href=\"a.php?mode=delete&type=EventoEmergencia&id={$row['numTelefone']}&id2={$row['instanteChamada']}\">delete</a></td></tr>\n");
        }
        echo("</table>\n");



        $prep = $db->prepare("SELECT numProcessoSocorro FROM ProcessoSocorro ;");
        $prep->execute();
        $result = $prep->fetchAll();

        echo("<h3>ProcessoSocorro</h3><table border=\"1\">\n");
        echo("<tr><td><b>numProcessoSocorro</b></td></tr>\n");
        foreach($result as $row)
        {
            echo("<tr><td>");
            echo($row['numProcessoSocorro']);
            echo("</td><td>");
            echo("</td><td><a href=\"a.php?mode=delete&type=ProcessoSocorro&id={$row['numProcessoSocorro']}\">delete</a></td></tr>\n");
        }
        echo("</table>\n");



        $prep = $db->prepare("SELECT numMeio, nomeMeio, nomeEntidade FROM Meio NATURAL JOIN Entidade ;");
        $prep->execute();
        $result = $prep->fetchAll();

        echo("<h3>Meio</h3><table border=\"1\">\n");
        echo("<tr><td><b>numMeio</b></td><td><b>nomeMeio</b></td><td><b>nomeEntidade</b></td></tr>\n");
        foreach($result as $row)
        {
            echo("<tr><td>");
            echo($row['numMeio']);
            echo("</td><td>");
            echo($row['nomeMeio']);
            echo("</td><td>");
            echo($row['nomeEntidade']);
            echo("</td><td>");
            echo("</td><td><a href=\"a.php?mode=delete&type=Meio&id={$row['numMeio']}&id2={$row['nomeEntidade']}\">delete</a></td></tr>\n");

        }
        echo("</table>\n");



        $prep = $db->prepare("SELECT nomeEntidade FROM Entidade ;");
        $prep->execute();
        $result = $prep->fetchAll();

        echo("<h3>Entidade</h3><table border=\"1\">\n");
        echo("<tr><td><b>nomeEntidade</b></td></tr>\n");
        foreach($result as $row)
        {
            echo("<tr><td>");
            echo($row['nomeEntidade']);
            echo("</td><td>");
            echo("</td><td><a href=\"a.php?mode=delete&type=Entidade&id={$row['nomeEntidade']}\">delete</a></td></tr>\n");

        }
        echo("</table>\n");
        
    
        $db = null;
        $prep = null;
    }








    catch (PDOException $e)
    {
        echo("<p>ERROR: {$e->getMessage()}</p><br><a href=\"a.php\">Back</a>");
    }
?>
        <h3>Add new Local</h3>
        <form action='a.php' method='post'>
            <p><input type='hidden' name='mode' value='add'/></p>
            <p><input type='hidden' name='type' value='Local'/></p>
            <p>moradaLocal: <input type='text' name='moradaLocal'/></p>
            <p><input type='submit' value='Submit'/></p>
        </form>
        <h3>Add new EventoEmergencia</h3>
        <form action='a.php' method='post'>
            <p><input type='hidden' name='mode' value='add'/></p>
            <p><input type='hidden' name='type' value='EventoEmergencia'/></p>
            <p>numTelefone: <input type='text' name='numTelefone'/></p>
            <p>instanteChamada: <input type='text' name='instanteChamada'/></p>
            <p><input type='submit' value='Submit'/></p>
        </form>
        <h3>Add new ProcessoSocorro</h3>
        <form action='a.php' method='post'>
            <p><input type='hidden' name='mode' value='add'/></p>
            <p><input type='hidden' name='type' value='ProcessoSocorro'/></p>
            <p>numProcessoSocorro: <input type='text' name='numProcessoSocorro'/></p>
            <p><input type='submit' value='Submit'/></p>
        </form>
        <h3>Add new Meio</h3>
        <form action='a.php' method='post'>
            <p><input type='hidden' name='mode' value='add'/></p>
            <p><input type='hidden' name='type' value='Meio'/></p>
            <p>numMeio: <input type='text' name='numMeio'/></p>
            <p>nomeEntidade: <input type='text' name='nomeEntidade'/></p>
            <p><input type='submit' value='Submit'/></p>
        </form>
        <h3>Add new Entidade</h3>
        <form action='a.php' method='post'>
            <p><input type='hidden' name='mode' value='add'/></p>
            <p><input type='hidden' name='type' value='Entidade'/></p>
            <p>nomeEntidade: <input type='text' name='nomeEntidade'/></p>
            <p><input type='submit' value='Submit'/></p>
        </form>
    </body>
</html>
