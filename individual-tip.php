<?php
require "assets/db-connect.php";

if (!isset($_GET["title"])) {
    die("Are you trying to hack me? <br><br> <form action='index.php'><button>Back to homepage</button></form>");

} else {
    $title = $_GET["title"];

    $query = $db->prepare("SELECT * FROM tips WHERE title = ?");
    $result = $query->execute([$title]);
    $result = $query->fetch();
    if ($result === false) {
        die("Wrong URL or search keyword <br><br> <form action='index.php'><button>Back to homepage</button></form>");
    }
    // var_dump($result);
}


?>

<!DOCTYPE html>
<html lang="cs">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/individual-tip.css">
    <link rel="stylesheet" href="css/queries.css">
    <script src="https://kit.fontawesome.com/88b85df50e.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Bungee+Tint&display=swap" rel="stylesheet">
    <title>Specific programming tip</title>
</head>
<body>
    <header>
    <?php $heading = "Specific programming tip" ?>
    <?php require "assets/header.php" ?>
    </header>


<main>
    <table border="1">
        <tr>
            <th>Post:</th>
            <td><?= "The ".htmlspecialchars($result["id"]).". post" ?></td>
        </tr>
        <tr>
            <th>Title:</th>
            <td><?= htmlspecialchars($result["title"]) ?></td>
        </tr>
        <tr>
            <th>Language:</th>
            <td><?= htmlspecialchars($result["language"]) ?></td>
        </tr>
        <tr>
            <th>Description:</th>
            <td class="description"><textarea name="" id="description" cols="60" rows="20" readonly><?= htmlspecialchars($result["description"]) ?></textarea></td>
        </tr>
        <tr>
            <th>Code Example:</th>
            <td><textarea name="" id="code-example" cols="60" rows="20" readonly><?= htmlspecialchars($result["code_example"]) ?></textarea></td>
        </tr>
    </table>
</main>

<footer>
    <?php require "assets/footer.php" ?>
</footer>

<script src="js/hamburger-icon.js"></script>
</body>
</html>