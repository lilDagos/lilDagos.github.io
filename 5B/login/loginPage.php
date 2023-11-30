<?php

// Connessione al database
$conn = mysqli_connect("localhost", "dagostino", "dagostino", "dagostino_registrazione");

if (!$conn) {
    die("Connessione al database fallita: " . mysqli_connect_error());
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Dati inviati dal modulo HTML
    $userId = $_POST["userId"];
    $password = $_POST["password"];

    $checkUserQuery = "SELECT * FROM utenti WHERE userid='$userId'";
    $result = mysqli_query($conn, $checkUserQuery);

    if (!$result) {
        die("Errore nella query: " . mysqli_error($conn));
    }

    if (mysqli_num_rows($result) > 0) {
        echo "<script type='text/javascript'>alert('accesso consentito con $userId');</script>";
    }else echo "<script type='text/javascript'>alert('questo utente non esiste');</script>";
}

mysqli_close($conn);
?>