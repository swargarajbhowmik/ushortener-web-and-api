<?php

include ('config.php');

if(!isset($_GET['api']) or !isset($_GET['url'])){
    $status = "Failed: No API Key or URL Provided";
    $long_url = "Failed To Create Long URL";
    $short_url = "Failed To Create Short URL";

    $output = array();
    $output['status'] = $status;
    $output['long_url'] = $long_url;
    $output['short_url'] = $short_url;

}else{
    $long_url = $_GET['url'];
    $api_key = $_GET['api'];

    $check_api_key = "SELECT * FROM api WHERE api_key = '$api_key'";
    $results = $connection->query($check_api_key);
    if($results->num_rows==1){

        while($row = $results->fetch_assoc()){
            $requests_left = $row['requests_left'];
        }

        if($requests_left==0){
            $output = array();
            $output['status'] = "API Requests Quota Finished";
            $output['long_url'] = "Failed To Create Long URL";
            $output['short_url'] = "Failed To Create Short URL";
        }else{

            function generateRandomString($length = 6) {
                $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
                $charactersLength = strlen($characters);
                $randomString = '';
                for ($i = 0; $i < $length; $i++) {
                    $randomString .= $characters[random_int(0, $charactersLength - 1)];
                }
                return $randomString;
            }

            $short_url_string = generateRandomString();

            $make_short_url = "INSERT INTO shorten_links (urllong, urlshort) VALUES ('$long_url', '$short_url_string')";

            if ($connection->query($make_short_url) === TRUE){
                $status = "Success";
                $make_short_url = "UPDATE api SET requests_left = requests_left - 1 WHERE api_key = '$api_key'";
                if ($connection->query($make_short_url) === TRUE){

                }
                else{
                    $status = "Failed";
                }





            }else{
                $status = "Failed";
            }
            $output = array();
            $output['status'] = $status;
            $output['long_url'] = $long_url;
            $output['short_url'] = "http://localhost/UShortnerAPI/viewapi.php?url=". $short_url_string;

        }
    } else{
        $output = array();
        $output['status'] = "Invalid API Key";
        $output['long_url'] = "Failed To Create Long URL";
        $output['short_url'] = "Failed To Create Short URL";
    }
}


header('Content-Type: application/json');
echo json_encode($output, JSON_PRETTY_PRINT);
// echo ;

?>