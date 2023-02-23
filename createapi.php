<?php

include 'config.php';


if(!isset($_GET['requests_limit'])){
    $status = "Failed: No Requests Quota Provided";
    $api_key = "Failed To Create API Key";
    $requests_limit = "No Limit Provided";

}else{
    $requests_limit = $_GET['requests_limit'];
    $requests_limit = (int)$requests_limit;
    function generateRandomString($length = 32) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[random_int(0, $charactersLength - 1)];
        }
        return $randomString;
    }

    $api_key = generateRandomString();

    $make_api_key = "INSERT INTO api (api_key, requests_left) VALUES ('$api_key', $requests_limit)";

    if ($connection->query($make_api_key) === TRUE){
        $status = "Success";
    }else{
        $status = "Failed";
    }

}


$output = array();
$output['status'] = $status;
$output['api_key'] = $api_key;
$output['requests_quota'] = $requests_limit;

header('Content-Type: application/json');
echo json_encode($output, JSON_PRETTY_PRINT);

?>