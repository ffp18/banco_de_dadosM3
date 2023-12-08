<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "empresa_eventos";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $action = $_POST['action'];

    switch ($action) {
        case 'create':
            $nome = $_POST['nome'];
            $endereco = $_POST['endereco'];
            $telefone = $_POST['telefone'];

            $sql = "INSERT INTO EmpresaDeEventos (Nome, Endereco, Telefone) VALUES ('$nome', '$endereco', '$telefone')";
            break;


        case 'read':
            $sql = "SELECT * FROM EmpresaDeEventos";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    echo "ID: " . $row["ID"] . " - Nome: " . $row["Nome"] . " - Endereço: " . $row["Endereco"] . " - Telefone: " . $row["Telefone"] . "<br>";
                }
            } else {
                echo "0 resultados encontrados";
            }

            $conn->close();
            exit;

        case 'update':
            $id = $_POST['id'];
            $nome = $_POST['nome'];
            $endereco = $_POST['endereco'];
            $telefone = $_POST['telefone'];

            $sql = "UPDATE EmpresaDeEventos SET Nome='$nome', Endereco='$endereco', Telefone='$telefone' WHERE ID=$id";
            break;

        case 'delete':
            $id = $_POST['id'];
            $sql = "DELETE FROM EmpresaDeEventos WHERE ID=$id";
            break;

        default:
            echo "Ação desconhecida";
            $conn->close();
            exit;
    }

    if ($conn->query($sql) === TRUE) {
        echo "Operação realizada com sucesso!";
    } else {
        echo "Erro na operação: " . $conn->error;
    }

    $conn->close();
}
