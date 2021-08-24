<!doctype html>
<html lang="fr">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

    <title>Style</title>
</head>

<body>
    <!--INSERTION MENU ET CONNEXION BDD -->
    <?php
      require_once('db/findlay_dbconf.php');
      require_once('menu.php');
    ?>
    <h1>Les styles</h1>
    <?php
try {
      // instancie un objet $connexion à partir de la classe PDO
    $connexion = new PDO(DB_DRIVER . ":host=" . DB_HOST . ";dbname=" . DB_NAME . ";charset=" . DB_CHARSET, DB_LOGIN, DB_PASS, DB_OPTIONS);
    } catch (PDOException $e) {

    // en cas d'erreur, on récup et on affiche, grâce au try/catch
   
       exit("❌🙀💀 OOPS :\n" . $e->getMessage());
     }
    
//ajouter un style avec genre
     if (isset($_POST['ajouter'])) {
         $post_name = ucfirst( $_POST['style_name']);
         $post_genre_id = $_POST['choix'];
     
         $requete = "INSERT INTO `styles` (`style_name`, `style_genre_id`)
                         VALUES (:style_name, :style_genre_id);";
         $prepare = $connexion->prepare($requete);
         $prepare->execute(array(
             ':style_name' => $post_name,
             ':style_genre_id' => $post_genre_id,
         ));
     }
   
  //modifier un style
if (isset($_POST['modifier'])) {
  $style_id = $_POST['style_id'];
  $style_name = $_POST['style_name'];
  $style_genre_id = $_POST['style_genre_id'];

  $requete = "UPDATE `styles` SET `style_name` =:style_name, `style_genre_id` =:style_genre_id WHERE `style_id` =:style_id ;";
  $prepare = $connexion->prepare($requete);
  $prepare->execute(array(
      ':style_id' => $style_id,
      ':style_name' => $style_name,
      ':style_genre_id' => $style_genre_id,

  ));
}
//supprimer un style :
if (isset($_GET['supprimer'])) {
  $style_id = $_GET['supprimer'];
  $requete = "DELETE FROM `styles` WHERE `style_id` =:style_id;";
  $prepare = $connexion->prepare($requete);
  $prepare->execute(array(
      ':style_id' => $style_id,
  ));
}
    //REQUETE SELECTION DE LA TABLE "styles/genres".

    $requete = "SELECT * FROM `genres`";
    $prepare = $connexion->prepare($requete);
    $prepare->execute();
    $genre = $prepare->fetchAll();
    
    $requete = 'SELECT * FROM styles
                        JOIN genres ON style_genre_id = genre_id
                        ORDER BY styles.style_name ASC;';
    $prepare = $connexion->prepare($requete);
    $prepare->execute();
    $stylegenre = $prepare->fetchAll();
  ?>
    <h3>Ajouter un Style </h3>
    <form method="POST">
        <label>Nom du Style</label>
        <input type="text" name="style_name" required></td>
        <select name="choix" required>
            <option value=""> -- Choisissez un genre svp -- </option>
            <?php foreach ($genre as $value) {?>
            <option value="<?=(htmlentities($value['genre_id'], ENT_QUOTES))?>">
                <?=(htmlentities($value['genre_name'], ENT_QUOTES))?></option>
            <?php }?>
        </select>
        <button type="submit" name="ajouter" value="ajouter" class="btn btn-primary">Ajouter</button>
    </form>
    <?php
if (isset($_GET['style_id'])) {
         $requete = 'SELECT * FROM `styles` WHERE `style_id` =:style_id;';
         $prepare = $connexion->prepare($requete);
         $prepare->execute(array(
             ":style_id" => $_GET['style_id'],
         ));
         $resultat = $prepare->fetch();
?>
    <h3>Modifier un style</h3>
    <form action="style.php" method="post">
        <label>Nouveau nom du style</label>
        <input type="text" name="style_name" value="<?=(htmlentities($resultat['style_name'], ENT_QUOTES))?>">
        <input type="hidden" name="style_id" value="<?=(htmlentities($resultat['style_id'], ENT_QUOTES))?>">
        <input type="hidden" name="style_genre_id" value="<?=(htmlentities($resultat['style_genre_id'], ENT_QUOTES))?>">
        <button name="modifier">Enregistrer</button>
    </form>
    <?php
}
?>
    <table class="table">
        <thead>
            <tr class="table-secondary">
                <th scope="col">styles</th>
                <th scope="col">genre</th>
            </tr>
        </thead>
        <?php
      foreach ($stylegenre as $style) {
?>
        <tbody>
            <tr>
                <td><?=(htmlentities($style['style_name']))?></td>
                <td><?=(htmlentities($style['genre_name']))?></td>
                <td><button type="submit" onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce style ?');"><a
                            class="btn btn-primary "
                            href="style.php?supprimer=<?=$style['style_id']?>">Supprimer</a></button></td>
                <td><button type="submit"><a class="btn btn-primary"
                            href="style.php?style_id=<?=$style['style_id']?>">Modifier</a></button></td>


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