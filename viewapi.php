<?php

include ('config.php');

if(isset($_GET['url'])){
    $link = $_GET['url'];
    $find_link = "SELECT * FROM shorten_links WHERE urlshort = '$link'";
    $results = $connection->query($find_link);
    if($results->num_rows==1){
        while($row = $results->fetch_assoc()){
            $long_url = $row['urllong'];
        }
    ?><script>location.href = "<?=$long_url?>" </script><?php
    }
}

?>