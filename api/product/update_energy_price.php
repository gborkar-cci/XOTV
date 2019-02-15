<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// get database connection
include_once '../config/database.php';
 
// instantiate product object
include_once '../objects/price.php';
 
$database = new Database();
$db = $database->getConnection();

$price = new Price($db);
 
// get posted data
$data = json_decode(file_get_contents("php://input"));
// make sure data is not empty
if(
    !empty($data->provider_name) &&
    !empty($data->product_name) &&
    !empty($data->variation_type) &&
    !empty($data->monthly_price)
){
 
    // set product property values
    $price->provider_name = $data->provider_name;
    $price->product_name = $data->product_name;
    $price->variation_type = $data->variation_type;
    $price->monthly_price = $data->monthly_price;
 
    // create the product
    $priceid = $price->energy_price_update();
    if($priceid){
        // set response code - 201 created
        http_response_code(201);
 
        // tell the price
        echo json_encode(array("message" => "Energy was updated."));
    }
 
    // if unable to create the product, tell the user
    else{
 
        // set response code - 503 service unavailable
        http_response_code(503);
 
        // tell the user
        echo json_encode(array("message" => "Unable to update Energy."));
    }
}
 
// tell the user data is incomplete
else{
 
    // set response code - 400 bad request
    http_response_code(400);
 
    // tell the user
    echo json_encode(array("message" => "Unable to update Energy. Data is incomplete."));
}
?>