<!DOCTYPE html>
<html lang="cs">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/search.css">
    <link rel="stylesheet" href="css/queries.css">
    <link href="https://fonts.googleapis.com/css2?family=Bungee+Tint&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/88b85df50e.js" crossorigin="anonymous"></script>
    <link rel="shortcut icon" href="img/logo.png" type="image/x-icon">
    <title>Seach for programming tips</title>
</head>
<body>
    <header>
    <?php $heading = "Search for your needs" ?>
    <?php require "assets/header.php" ?>
    </header>
    

<main>
    <form action="individual-tip.php" method="GET">
        <div class="inputs">
        <input type="text" placeholder="Search..." name="title">
        <button name="search"><i class="fa-solid fa-magnifying-glass"></i></button>
        </div>
        
        <div class="keywords">
            <select id="selectKeywords" multiple>
                
            </select>
        </div>
    </form>

</main>

<footer>
<?php require "assets/footer.php" ?>
</footer>

<div class="animation-message">
    <h2>Become a better programmer than yesterday</h2>
</div>

<script src="js/hamburger-icon.js"></script>
<script src="js/search.js"></script>
</body>
</html>