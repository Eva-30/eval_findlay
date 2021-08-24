<!doctype html>
<html lang="fr">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

    <title>Accueil</title>
</head>

<body>
    <!--INSERTION MENU ET CONNEXION BDD -->
    <?php
      require_once('db/findlay_dbconf.php');
      require_once('menu.php');
    ?>
    <h1>Médiathèque Camerone Findlay</h1>
    <a class="btn btn-primary" href="artiste.php" role="button">Ajouter</a>

    <?php
try {
      // instancie un objet $connexion à partir de la classe PDO
    $connexion = new PDO(DB_DRIVER . ":host=" . DB_HOST . ";dbname=" . DB_NAME . ";charset=" . DB_CHARSET, DB_LOGIN, DB_PASS, DB_OPTIONS);
    
    //modifier un Artiste
if (isset($_POST['modifier'])) {
  $artiste_id = $_POST['artiste_id'];
  $artiste_name = $_POST['artiste_name'];

  $requete = "UPDATE `artists` SET `artist_name` =:artist_name WHERE `artist_id` =:artist_id;";
  $prepare = $connexion->prepare($requete);
  $prepare->execute(array(
      ':artist_id' => $artiste_id,
      ':artist_name' => $artiste_name,
  ));
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
    //REQUETE SELECTION READ 'artists + styles + genres.

    $requeteSelectionTable = "SELECT artist_id, `artist_name`, `style_id`, `style_name`, genre_name
    FROM assoc_artists_styles
    JOIN artists ON artist_id=assoc_artist_id
    JOIN styles ON style_id=assoc_style_id
    JOIN genres ON genre_id = style_genre_id";
    $prepare = $connexion->prepare($requeteSelectionTable);
    $prepare->execute();
    $resultat = $prepare->fetchAll();
    

if (isset($_GET['artiste_id'])) {
    $requete = 'SELECT * FROM `artists`
                WHERE `artist_id` =:artist_id;';
    $prepare = $connexion->prepare($requete);
    $prepare->execute(array(
        ":artist_id" => $_GET['artiste_id'],
    ));
    $result = $prepare->fetch();
    ?>
    </br>
    <h3>Modifier un Artiste</h3>
    <form action="index.php" method="post">
        <label>Nouveau nom de l'artiste</label>
        <input type="text" name="artiste_name" value="<?=(htmlentities($result['artist_name'], ENT_QUOTES))?> ">
        <input type="hidden" name="artiste_id" value="<?=(htmlentities($result['artist_id'], ENT_QUOTES))?>">
        <button name="modifier">Enregistrer</button>

    </form>
    <?php
}
?>
    <table class="table">
        <thead>
            <tr class="table-secondary">
                <th scope="col">Artistes</th>
                <th scope="col">Infos</th>
            </tr>
        </thead>
        <?php foreach ($resultat as $artist) { ?>
        <tbody>
            <tr>
                <td><?=($artist['artist_name'])?></td>
                <td><?=($artist['genre_name']).' '.($artist['style_name'])?></td>
                <td><button type="submit"
                        onclick="return confirm('Êtes-vous sûr de vouloir supprimer cet artiste ?');"><a
                            class="btn btn-primary "
                            href="index.php?id=<?=$artist['artist_id']?>">Supprimer</a></button>
                </td>
                <td><button type="submit"><a class="btn btn-primary"
                            href="index.php?artiste_id=<?=$artist['artist_id']?>">Modifier</a></button></td>
            </tr>
        </tbody>
        <?php } ?>
    </table>
    <?php
    } catch (PDOException $e) {

    // en cas d'erreur, on récup et on affiche, grâce au try/catch
   
       exit("❌🙀💀 OOPS :\n" . $e->getMessage());
     }
?>
    <!-- <a class="btn btn-primary" href="updateArtist.php" role="button">Modifier</a>
    <a class="btn btn-primary" href="deleteArtist.php" role="button">Supprimer</a> -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous">
    </script>
</body>

</html>