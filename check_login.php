<?php
require_once('./connect.php');

//démarrer la session
session_start();

// if (isset($_POST['username']) && isset($_POST['password'])) {


//     //récupérer les données du form
//     $username = $_POST['username'];
//     //utiliser la fonction de hachage sha1 pour sécuriser le mot de passe
//     $password = sha1($_POST['password']);


//     //prépaer la requête sql pour récupérer un utilisateur avce username et le password
//     $req = $bdd->prepare('SELECT * FROM users WHERE username = :username AND password = :password');
//     //exécuter la requête en fournissant les valeurs des paramètres
//     $req->execute(array(
//         'username' => $username,
//         'password' => $password
//     ));
//     //récupérer les résultats de la requête
//     $data = $req->fetch();
//     //si données on été récupérées (= si le user existe dans la db)
//     if ($data) {
//         //stocker le username dans la session
//         $_SESSION['username'] = $username;
//         //rediriger vers la page d'acceuil 
//         header('Location: index.php');
//         //arreter l'exécuter du script
//         exit();
//     }
// }
// //si aucune donnée n'est récupérée (= user n'existe pas dans la db)    
// //rediriger vares la page login
// header('Location: login.php');
// exit();



// //possibilité avec methode password_verify?
// //vérifier si le form de login a été soumis
if (isset($_POST['username']) && isset($_POST['password'])) {

    //appeler la fonction connectDB pour accéder à la db
    global $bdd;
    //récupérer les données du form
    $username = $_POST['username'];
    $password = $_POST['password'];


    //préparer la requête sql pour récupérer un utilisateur avec le nom fourni
    $req = $bdd->prepare('SELECT * FROM users WHERE username = :username');
    //exécuter la requête en fournissant la valeur du paramètre
    $req->execute(array('username' => $username));
    //récupérer des résultats de la requête
    $user = $req->fetch();

    //vérifier si le user existe et si le mot de passe correspond
    if ($user && password_verify($password, $user['password'])) {
        $_SESSION['username'] = $username;
        //si ca match, rediriger vers la page index
        header('Location: index.php');
        //arreter l'exécution du script
        exit();
    } else {
        echo '<script type="text/javascript">';
        echo 'alert("Review your answer");';
        echo 'window.location.href = "login.php";';
        echo '</script>';
    }
}
