<!doctype html>
<html lang="fr">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

    <title>genres</title>
  </head>
  <body>
    <!--INSERTION MENU ET CONNEXION BDD -->
    <?php
      require_once('db/findlay_dbconf.php');
      require_once('menu.php');
    ?>
      <h1>Les genres</h1>
    <?php
try {
      // instancie un objet $connexion à partir de la classe PDO
    $connexion = new PDO(DB_DRIVER . ":host=" . DB_HOST . ";dbname=" . DB_NAME . ";charset=" . DB_CHARSET, DB_LOGIN, DB_PASS, DB_OPTIONS);
    } catch (PDOException $e) {

    // en cas d'erreur, on récup et on affiche, grâce au try/catch
   
       exit("❌🙀💀 OOPS :\n" . $e->getMessage());
     }
    //REQUETE SELECTION DE LA TABLE "GENRES".

    $requeteSelectionTable = "SELECT * FROM `genres`";
    $prepare = $connexion->prepare($requeteSelectionTable);
    $prepare->execute();
    $resultat = $prepare->fetchAll();
  ?>
    <table class="table">
      <thead>
        <tr class="table-secondary">
        <th scope="col">Genre</th>
        </tr>
      </thead>
      <?php
      foreach ($resultat as $genre) {
      ?>
      <tbody>
        <tr>
          <td><?=(htmlentities($genre['genre_name']))?></td>
          <td><button type="submit" ><a class="btn btn-primary "href="genre.php?id=<?=$genre['genre_id']?>">Supprimer</a></button></td>
          <td><button type="submit" ><a class="btn btn-primary" href="genre.php?genre_id=<?=$genre['genre_id']?>">Modifier</a></button></td>
        </tr>
      </tbody>
      <?php
    } 
?>
    </table>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
  </body>
</html> 


<!-- STYLE -->
<!doctype html>
<html lang="fr">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

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
    //REQUETE SELECTION DE LA TABLE "styles".

    $requeteSelectionTable = "SELECT * FROM `styles`";
    $prepare = $connexion->prepare($requeteSelectionTable);
    $prepare->execute();
    $resultat = $prepare->fetchAll();
  ?>
    <table class="table">
      <thead>
        <tr class="table-secondary">
          <th scope="col">styles</th>
        </tr>
      </thead>
  <?php
    foreach ($resultat as $style) {
  ?>
    <tbody>
      <tr>
        <td><?=(htmlentities($style['style_name']))?></td>
      </tr>
    </tbody>
  <?php
    }
  ?> 
    </table> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
  </body>
</html> 
 <!-- INDEX -->
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
    <h1>Médiathèque Cameron Findlay</h1>
    <?php
try {
      // instancie un objet $connexion à partir de la classe PDO
    $connexion = new PDO(DB_DRIVER . ":host=" . DB_HOST . ";dbname=" . DB_NAME . ";charset=" . DB_CHARSET, DB_LOGIN, DB_PASS, DB_OPTIONS);
    
    //REQUETE SELECTION READ 'artists + styles + genres.

    $requeteSelectionTable = "SELECT  `artist_id`, `artist_name`, `style_id`, `style_name`, `genre_name`
    FROM assoc_artists_styles
    JOIN artists ON artist_id=assoc_artist_id
    JOIN styles ON style_id=assoc_style_id
    JOIN genres ON genre_id = style_genre_id";
    $prepare = $connexion->prepare($requeteSelectionTable);
    $prepare->execute();
    $resultat = $prepare->fetchAll();
  ?>
    <table class="table">
        <thead>
            <tr class="table-secondary">
                <th scope="col">Artistes</th>
                <th scope="col">Style / Genre</th>
            </tr>
        </thead>
        <?php      
foreach ($resultat as $artist) {
?>
        <tbody>
            <tr>
                <td><?=($artist['artist_name'])?></td>
                <td><?=($artist['style_name'] . ' / ' . $artist['genre_name'] )?></td>
            </tr>
        </tbody>
        <?php      
}
?>
    </table>
    <?php
     
  } catch (PDOException $e) {

    // en cas d'erreur, on récup et on affiche, grâce au try/catch
   
       exit("❌🙀💀 OOPS :\n" . $e->getMessage());
     }
?>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous">
    </script>
</body>

</html>


        

 