<?php
require "assets/db-connect.php";
require "assets/list-of-programming-languages.php";     
// all the languages are in the variable $programmingLanguages 
require "assets/redirect.php";

$errors = [];
$title = null;
$description = null;
$codeExample = null;
$language = null;

if (array_key_exists("add", $_POST)) {
    $title = $_POST["title"];
    $description = $_POST["description"];
    $codeExample = $_POST["codeExample"];
    $language = $_POST["language"];

    if (mb_strlen($title) < 3 || mb_strlen($title) > 250) {
        $errors["title"] = "<h3 class='error'>Invalid, please enter relevant title</h3>";
    }
    if (mb_strlen($description) < 5) {
        $errors["description"] = "<h3 class='error'>Description isnt relevant. Please write down more characters</h3>";
    }
    // code Example isnt required

    if ($language == "") {
        $errors["language"] = "<h3 class='error language'>Please choose one of the presented languages</h3>";
    }

    if (empty($errors)) {
        $query = $db->prepare("INSERT INTO tips (title, description, code_example, language) VALUES(?, ?, ?, ?)");
        $query->execute([$title, $description, $codeExample, $language]);

        redirectURL("individual-tip.php?title=".urlencode($title));
    }
}


?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/add-tip.css">
    <link rel="stylesheet" href="css/queries.css">
    <script src="https://kit.fontawesome.com/88b85df50e.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Bungee+Tint&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="img/logo.png" type="image/x-icon">
    <title>Add new programming tip</title>
</head>
<body>
    <header>
    <?php $heading = "Add new programming tip" ?>
    <?php require "assets/header.php" ?>
    </header>
    

<main>

<div class="add-tip-form">
<form action="" method="post">
    <div class="title-add">
        <label for="title">Title</label>
        <input type="text" name="title" id="title" placeholder="Title..." value="<?php echo $title ?>">
        <?php if (array_key_exists("title", $errors)) echo $errors["title"] ?>
    </div>
    <div class="description-add">
        <label for="description">Description:</label>
        <textarea name="description" id="description" cols="40" rows="20"><?= $description ?></textarea>
        <?php if (array_key_exists("description", $errors)) echo $errors["description"] ?>
    </div>
    <div class="code-example-add">
        <label for="code-example">Code Example:</label>
        <textarea name="codeExample" id="code-example" cols="40" rows="20"><?= $codeExample ?></textarea>
    </div>
    <div class="programming-language-add">
        <label for="programming-language">Programming Language:</label>
        <select name="language" id="programming-language">
            <option value="">Choose</option>
            <?php foreach($programmingLanguages as $individualLanguage) { ?>
            <option value="<?= $individualLanguage ?>" <?php if ($language == $individualLanguage) echo "selected" ?>><?= $individualLanguage ?></option>
            <?php } ?>
        </select>
        <button name="add">Add</button>
        <?php if (array_key_exists("language", $errors)) echo $errors["language"] ?>
    </div>
        
</form>
</div>

</main>

<footer>
<?php require "assets/footer.php" ?>
</footer>

<script src="js/hamburger-icon.js"></script>
</body>
</html>