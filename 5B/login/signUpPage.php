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
        echo "<script type='text/javascript'>alert('già esiste');</script>";
    } else {
        $registerQuery = "INSERT INTO utenti (userid, password) VALUES ('$userId', '$password')";
        
        if (mysqli_query($conn, $registerQuery)) {
            echo "Utente registrato con successo!";
        } else {
            echo "Errore durante la registrazione: " . mysqli_error($conn);
        }
    }
}

mysqli_close($conn);
?>