<!doctype html>
<html lang="fr">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

    <title>genres</title>
</head>

<body>
    <!--INSERTION MENU ET CONNEXION BDD -->
    <?php
require_once 'db/findlay_dbconf.php';
require_once 'menu.php';
?>
    <div>
        <h1>Les genres</h1>
        <a class="btn btn-primary" href="createGenre.php" role="button">Ajouter</a>
    </div>
    <?php
try {
    // instancie un objet $connexion à partir de la classe PDO
    $connexion = new PDO(DB_DRIVER . ":host=" . DB_HOST . ";dbname=" . DB_NAME . ";charset=" . DB_CHARSET, DB_LOGIN, DB_PASS, DB_OPTIONS);
} catch (PDOException $e) {

    // en cas d'erreur, on récup et on affiche, grâce au try/catch
    exit("❌🙀💀 OOPS :\n" . $e->getMessage());
}

//AJOUTER UN GENRE
if (isset($_POST['ajouter'])) {
    $genre_name = ucfirst($_POST['genre_name']);

    $requete = "INSERT INTO `genres` (`genre_name`)
              VALUES (:genre_name);";
    $prepare = $connexion->prepare($requete);
    $prepare->execute(array(
        ':genre_name' => $genre_name,

    ));
}

//MODIFIER UN GENRE
if (isset($_POST['modifier'])) {
    $genre_id = $_POST['genre_id'];
    $genre_name = $_POST['genre_name'];

    $requete = "UPDATE `genres` SET `genre_name` =:genre_name WHERE `genre_id` =:genre_id;";
    $prepare = $connexion->prepare($requete);
    $prepare->execute(array(
        ':genre_id' => $genre_id,
        ':genre_name' => $genre_name,
    ));
}
//SUPPRIMER UN GENRE
if (isset($_GET['id'])) {
    $genre_id = $_GET['id'];
    $requete = "DELETE FROM `genres` WHERE `genre_id`=:genre_id;";
    $prepare = $connexion->prepare($requete);
    $prepare->execute(array(
        ':genre_id' => $genre_id,
    ));
}

// SELECTION DE LA TABLE "genres"
$requeteSelectionTable = "SELECT * FROM `genres`";
$prepare = $connexion->prepare($requeteSelectionTable);
$prepare->execute();
$resultat = $prepare->fetchAll();
?>
    <h3>Ajouter un Genre</h3>
    <form method="post">
        <label>Nom du Genre</label>
        <input type="text" name="genre_name" required>
        <button type="submit" name="ajouter" value="ajouter">Ajouter</button>
    </form>
    <?php
if (isset($_GET['genre_id'])) {
    $requete = 'SELECT * FROM `genres` WHERE `genre_id` =:genre_id;';
    $prepare = $connexion->prepare($requete);
    $prepare->execute(array(
        ":genre_id" => $_GET['genre_id'],
    ));
    $result = $prepare->fetch();
    ?>
    <h3>Modifier un genre</h3>
    <form action="genre.php" method="post">
        <label>Nom de genre</label>
        <input type="text" name="genre_name" value="<?=(htmlentities($result['genre_name'], ENT_QUOTES))?>">
        <input type="hidden" name="genre_id" value="<?=(htmlentities($result['genre_id'], ENT_QUOTES))?>">
        <button name="modifier">Enregistrer</button>
    </form>
    <?php
}
?>
    <table class="table">
        <thead>
            <tr class="table-secondary">
                <th scope="col">Genres</th>
            </tr>
        </thead>
        <?php foreach ($resultat as $genre) {?>
        <tbody>
            <tr>
                <td><?=(htmlentities($genre['genre_name']))?></td>
                <td><button type="submit" onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce genre ?');"><a
                            class="btn btn-primary " href="genre.php?id=<?=$genre['genre_id']?>">Supprimer</a></button>
                </td>
                <td><button type="submit"><a class="btn btn-primary"
                            href="genre.php?genre_id=<?=$genre['genre_id']?>">Modifier</a></button></td>
            </tr>
        </tbody>
        <?php
}
?>
    </table>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous">
    </script>
</body>

</html>