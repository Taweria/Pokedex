<?php
include 'connect.php';
global $bdd;
?>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" src="./assets/css/style.css">
        <title>Pokedex</title>
    </head>
    <body>
    <header>

    </header>
    <main class="app">
        <?php
        displayData();
        ?>
        ?>
    </main>
    <footer>

    </footer>
    </body>
    </html>

<?php

function displayData()
{
    global $bdd;
    $query = "SELECT * FROM pokedex.pokemon";
    $res = $bdd->query($query);
    print_r($res);
}

function listen()
{
    listenAdd();
    listenDelete();
}

function listenAdd()
{
    if (isset($_POST["ville"]) && isset($_POST["haut"]) && isset($_POST["bas"])) {
        $ville = $_POST["ville"];
        $haut = $_POST["haut"];
        $bas = $_POST["bas"];
        echo StoreData($ville, $haut, $bas);
    }
}
