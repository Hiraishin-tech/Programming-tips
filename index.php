<?php
require "./assets/db-connect.php";
require "assets/list-of-programming-languages.php";
$filterLanguage = null;

$query = $db->prepare("SELECT * FROM tips ORDER BY id DESC");
$result = $query->execute();
$result = $query->fetchAll();

// var_dump($result);


// Filter the programming languages
if (array_key_exists("filter", $_POST)) {
    $filterLanguage = $_POST["language"];

    $query = $db->prepare("SELECT * FROM tips WHERE language = ? ORDER BY id DESC");
    $result = $query->execute([$filterLanguage]);
    $result = $query->fetchAll();
    // var_dump($result);
}


?>

<!DOCTYPE html>
<html lang="cs">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/queries.css">
    <script src="https://kit.fontawesome.com/88b85df50e.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Bungee+Tint&display=swap" rel="stylesheet">
    <title>Home page - programming language tips</title>
</head>
<body>
<header>
<?php $heading = "Programming tips for coding enthusiasts" ?>
<?php require "assets/header.php" ?>

</header>

<main>
    <form action="" method="POST">
        <select name="language" id="">
            <?php foreach ($programmingLanguages as $language): ?>
            <option <?php if ($language === $filterLanguage) echo "selected" ?> ><?= $language ?></option>
            <?php endforeach ?>
        </select>
        <button name="filter">filter</button>
        <?php if (array_key_exists("filter", $_POST)) { ?>
            <form action="" class="reset-filter"><button>Reset filter</button></form>
        <?php } ?>
    </form>
    

    <div class="programming-info">
        <table>
        <tr>
            <th>Available tips</th>
            <th>Language</th>
            <th>Title</th>
            <th>Description</th>
            <th class="heading-more-info">More info</th>
        </tr>
        <?php foreach($result as $info): ?>
        <tr>
            <td class="number-post"><?= $info["id"] ?></td>
            <td class="language"><?= htmlspecialchars($info["language"]) ?></td>
            <td><?= htmlspecialchars($info["title"]) ?></td>
            <td><?= htmlspecialchars($info["description"]) ?></td>
            <td class="more-info"><a href="individual-tip.php?title=<?= urlencode($info["title"]) ?>"><i class="fa-solid fa-circle-info"></i></a></td>
        </tr>
        <?php endforeach ?>
        </table>
    </div>

    
</main>

<footer>
<?php require "assets/footer.php" ?>
</footer>

<script src="js/hamburger-icon.js"></script>
</body>
</html>