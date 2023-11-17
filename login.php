<?php
require_once("connect.php");
global $bdd;
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/style.min.css">
    <title>Login</title>
</head>
<body>
<?php
require_once('header.php');
?>
<main>
    <form action="login.php" method="post">
        <h1>My Account</h1>
        <div>
            <label for="email">Email*</label>
            <input type="email" name="email" id="email">
        </div>
        <div>
            <label for="password">Password*</label>
            <input type="password" name="password" id="password">
        </div>
        <button type="submit">Connexion</button>
    </form>
</main>
</body>
<?php $bdd = null ?>
</html>