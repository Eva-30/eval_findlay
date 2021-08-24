<!doctype html>
<html lang="fr">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

    <title>artiste</title>
</head>

<body>
    <!--INSERTION MENU ET CONNEXION BDD -->
    <?php
require_once 'db/findlay_dbconf.php';
require_once 'menu.php';
try {
    // instancie un objet $connexion à partir de la classe PDO
    $connexion = new PDO(DB_DRIVER . ":host=" . DB_HOST . ";dbname=" . DB_NAME . ";charset=" . DB_CHARSET, DB_LOGIN, DB_PASS, DB_OPTIONS);
} catch (PDOException $e) {
    // en cas d'erreur, on récup et on affiche, grâce à notre try/catch
    exit("❌🙀💀 OOPS :\n" . $e->getMessage());

}
//supprimer un Artiste :
if (isset($_GET['id'])) {
    $artiste_id = $_GET['id'];
    $requete = "DELETE FROM `artists` WHERE `artist_id`=:artist_id;";
    $prepare = $connexion->prepare($requete);
    $prepare->execute(array(
        ':artist_id' => $artiste_id,
    ));
  }
//requetes de selection
$requete = "SELECT * FROM `artists`";
$prepare = $connexion->prepare($requete);
$prepare->execute();
$artiste = $prepare->fetchAll();

$requete = "SELECT * FROM `styles`";
$prepare = $connexion->prepare($requete);
$prepare->execute();
$assostyles = $prepare->fetchAll();

//Ajouter un nouvel artiste
if (isset($_POST['ajouter'])) {
    $artist_name = ucfirst(strtolower($_POST['artist_name']));

    $requete = "INSERT INTO `artists` (`artist_name`)
                VALUES (:artist_name);";
    $prepare = $connexion->prepare($requete);
    $prepare->execute(array(
        ':artist_name' => $artist_name,
    ));
    $res = $prepare->rowCount();
        if ($res == 1) {
            header('location:artiste.php');
}
}
//ajouter un style à l'artiste
if (isset($_POST['associer'])) {
    $post_style_id = $_POST['assoc_style_id'];
    $post_artiste_id = $_POST['assoc_artiste_id'];

    $requete = "INSERT INTO `assoc_artists_styles` (`assoc_style_id`, `assoc_artist_id`)
                VALUES (:assoc_style_id, :assoc_artist_id);";
    $prepare = $connexion->prepare($requete);
    $prepare->execute(array(
        ':assoc_style_id' => $post_style_id,
        ':assoc_artist_id' => $post_artiste_id,

    ));
    $res = $prepare->rowCount();
        if ($res == 1) {
            header('location:index.php');
}
}

?>

    <h3>Ajouter un artiste</h3>
    <form method="post">
        <label>Nom de l'artiste</label>
        <input type="text" name="artist_name" required>
        <button type="submit" name="ajouter" value="ajouter" class="btn btn-primary">Ajouter</button>
    </form>

    <h3>Rajouter ou modifier un style à un artiste</h3>
    <form method="post">
        <select name="assoc_artiste_id" required>
            <option value=""> -- Choisissez un artiste svp -- </option>
            <?php foreach ($artiste as $artist) {?>
            <option value=<?=(htmlentities($artist['artist_id'], ENT_QUOTES))?>>
                <?=$artist['artist_name']?></option>
            <?php }?>
        </select>
        <!-- liste des styles  -->
        <select name="assoc_style_id" required>
            <option value=""> -- Choisissez un style svp -- </option>
            <?php foreach ($assostyles as $listestyle) {?>
            <option value=<?=(htmlentities($listestyle['style_id'], ENT_QUOTES))?>>
                <?=$listestyle['style_name']?></option>
            <?php }?>
        </select>
        <button type="submit" name="associer" value="associer" class="btn btn-primary">Associer</button>

    </form>
    <table class="table">
        <thead>
            <tr class="table-secondary">
                <th scope="col">Genres</th>
            </tr>
        </thead>
        <?php foreach ($artiste as $artist) {?>
        <tbody>
            <tr>
                <td><?=(htmlentities($artist['artist_name']))?></td>
                <td><button type="submit"
                        onclick="return confirm('Êtes-vous sûr de vouloir supprimer cet artiste ?');"><a
                            class="btn btn-primary "
                            href="artiste.php?id=<?=$artist['artist_id']?>">Supprimer</a></button>
                </td>

            </tr>
        </tbody>
        <?php
}
?>
    </table>
</body>

</html>