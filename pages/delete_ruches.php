<?php
if (isset($_GET['idRuches'])) {
    $id = (int) $_GET['idRuches'];
    // construire le SQL de la requête préparée d'effacement
    // syntaxe : https://sql.sh/cours/delete
    $sql = 'DELETE FROM ruche WHERE idRuches = :idRuches';
    // exécuter
    $stmt = $dbh->prepare($sql);
    $stmt->execute([
        ':idRuches' => $id,
    ]);  ?>
    <script type="text/javascript">
        alert('Voulez-vous supprimer la ruche ?');
        document.location.href = './beeautop_ruches.php';
    </script>
<?php  }
// redirection vers la page de listing
// header('Location: index.php');
    header('beeautop_ruches.php')

?>