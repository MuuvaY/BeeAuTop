<?php

require './../bootstrap.php';

if (isGetMethod()) {
  echo head('beeautop', '/../assets/css');
  ?>

  <body>
    <section id="connecte">
      <h1>Connecte-toi!</h1>
      <div id="connection">
        <form action="beeautop_connection.php" method="post">
          <label for="">Utilisateur : Mpaulet</label>
          <label for="">Mot de passe : secret</label>

          <input name="pseudo" type="text" placeholder="Utilisateur" required autofocus>
          <input name="mdp" type="password" placeholder="Mot de passe">
          <button type="submit">Confirmer</button>
        </form>
      </div>
    </section>
  </body>

  </html>
<?php } else {


  // 1. lecture des paramètres à partir du tableau associatif $_POST
  $pseudo = $_POST['pseudo'];
  $mdp = md5($_POST['mdp']);

  // 2 rechercher dans la table
  $sql = 'SELECT idApiculteur, pseudo, mdp FROM apiculteur WHERE pseudo = :pseudo AND mdp = :mdp';
  $apiculteur = $dbh->prepare($sql);
  $apiculteur->execute([
    'pseudo' => $pseudo,
    'mdp' => $mdp,
  ]);
  $idApiculteur = $apiculteur->fetch();
  // 3. tester existance de l'api
  if ($idApiculteur != null) {
    header('Location: ./beeautop_ruches.php?idApiculteur=' . $idApiculteur['idApiculteur']);
  } else { ?>
    <script type="text/javascript">
      alert('Pseudo/Mot de passe erroné');
      document.location.href = './beeautop_connection.php';
    </script>
  <?php }

} ?>