<?php
include 'connect.php';
global $bdd;
?>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="./assets/css/style.min.css">
        <title>Pokedex</title>
    </head>
    <body>
<!--    --><?php
//    require('./header.php')
//    ?>
    <main class="app">
        <?php
        displayPokemons();
        ?>
        ?>
    </main>
    <footer>

    </footer>
    </body>
    </html>

<?php

function displayPokemons()
{
    global $bdd;
    $query = "SELECT * FROM pokedex.pokemon";
    $res = $bdd->query($query);
    print_r($res);
}

