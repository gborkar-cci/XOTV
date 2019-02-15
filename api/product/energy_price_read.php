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
    !empty($data->variation_type)
){
 
    // set product property values
    $price->provider_name = $data->provider_name;
    $price->product_name = $data->product_name;
    $price->variation_type = $data->variation_type;
    
    $stmt = $price->energy_price_read();
    $num = $stmt->rowCount();
    // check if more than 0 record found
    if($num>0){
     
        // products array
        $categories_arr=array();
        $categories_arr["records"]=array();
     
        // retrieve our table contents
        // fetch() is faster than fetchAll()
        // http://stackoverflow.com/questions/2770630/pdofetchall-vs-pdofetch-in-a-loop
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
            // extract row
            // this will make $row['name'] to
            // just $name only
            $res = $row;
        }
     
        // set response code - 200 OK
        http_response_code(200);
        
        // show categories data in json format
        echo json_encode($res['monthly_price']);
    }
    else{
     
        // set response code - 404 Not found
        http_response_code(404);
     
        // tell the user no categories found
        echo json_encode(
            array("message" => "No price found.")
        );
    }
}
 
// tell the user data is incomplete
else{
 
    // set response code - 400 bad request
    http_response_code(400);
 
    // tell the user
    echo json_encode(array("message" => "Unable to read price. Data is incomplete."));
}
?>