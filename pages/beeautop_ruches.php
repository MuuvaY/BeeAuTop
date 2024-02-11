<?php

require './../bootstrap.php';
echo head('beeautop', '/../assets/css');
$idA = $_GET['idApiculteur'];
$sql = 'SELECT * FROM ruche INNER JOIN apiculteur ON ruche.idApiculteur = apiculteur.idApiculteur WHERE ruche.idApiculteur = :idA';
$ruches = $dbh->prepare($sql);
$ruches->execute([
    'idA' => $idA,
]);
$infoRuches = $ruches -> fetch();
?>

<body class="beeautop_ruches">
    <section id="ruchesd">
        <div id="navbar">
            <h1><?php echo $infoRuches['pseudo']?></h1>
            <a href="logout.php" class="btn-logout">
                <i class="fa-solid fa-power-off"></i>
            </a>
        </div>
        <h1>Vos Ruches</h1>
        <div class="bee_ruches">
            <div id="map">
                <script>
                    const bounds =
                        [[-5, 42],
                        [8.5, 51]];   //lattitude*/
                    mapboxgl.accessToken = 'pk.eyJ1IjoiemVwdHRpeCIsImEiOiJjbGh5eGs5a3kxODY3M2Vxd3R6N24ycTJwIn0.s7zGGxjmjH0pYlfasA7Yfw';
                    const map = new mapboxgl.Map({
                        container: 'map', // container ID
                        style: 'mapbox://styles/zepttix/clhyycnjv026f01r0hq7id7sd', // style URL
                        center: [4.433247, 46], // starting position [lng, lat]2.209667
                        zoom: 3.5, // starting zoom
                        maxBounds: bounds,
                    });

                // 2 rechercher dans la table
                    /*click sur le markeur*/
                    /*marker.addEventListener('click', function{
                        
                    })*/
                </script>
                <?php
                $localRuches = $ruches->fetchAll();
                foreach ($localRuches as $ruche) { ?>
                    <script>
                        var latitude = <?php echo $ruche['latitude']; ?>;
                        var longitude = <?php echo $ruche['longitude']; ?>;
                        var marqueur = new mapboxgl.Marker({ color: 'orange' }).setLngLat([longitude, latitude]).addTo(map);

                        marqueur.getElement().addEventListener('click', function () {
                            var myID = <?php echo $ruche['idRuche']; ?>;
                            var latRuche = <?php echo $ruche['latitude']; ?>;
                            var longRuche = <?php echo $ruche['longitude']; ?>;
                            map.flyTo({
                                center: [longRuche, latRuche],
                                zoom: 10
                            });
                        });
                    </script>

                <?php }
                ?>
            </div>
        </div>
        <div id="bottom">
            <div>
                <a href="##">Date d'installation</a>
            </div>
            <div>
                <a href="edit.php?id=<?php echo $ruche['idRuches'] ?>" class="btn-edit">Modifier</a>
                <a href="delete_ruches.php?id=<?php echo $ruche['idRuches'] ?>" class="btn-delete">Supprimer</a>
            </div>
        </div>
    </section>