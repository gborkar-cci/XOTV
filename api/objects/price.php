<?php
class Price{
 
    // database connection and table name
    private $conn;
    private $table_name = "provider_product_mappings";
 
    // object properties
    public $id;
    public $product_name;
    public $provider_name;
    public $provider_type_id;
    public $provider_id;
    public $product_id;
    public $variation_id;
    public $monthly_price;
    public $variation_type;
 
    // constructor with $db as database connection
    public function __construct($db){
        $this->conn = $db;
    }
    
    //Read monthly price for Broadband
    public function broadband_price_read(){
        
        //select all data
        $query = "SELECT monthly_price FROM provider_product_mappings as ppm JOIN `providers` AS p ON ppm.provider_id = p.id JOIN `products` AS pd ON ppm.product_id = pd.id where pd.product_name =:product_name and p.provider_name =:provider_name";
        $stmt = $this->conn->prepare( $query );
        // sanitize
        $this->product_name=htmlspecialchars(strip_tags($this->product_name));
        $this->provider_name=htmlspecialchars(strip_tags($this->provider_name));

        // bind values
        $stmt->bindParam(":product_name", $this->product_name);
        $stmt->bindParam(":provider_name", $this->provider_name);
        $stmt->execute();
        return $stmt;
    }
    
    //Read energy price
    public function energy_price_read(){
        //select all data
        $query = "SELECT monthly_price FROM provider_product_mappings as ppm JOIN `providers` AS p ON ppm.provider_id = p.id JOIN `products` AS pd ON ppm.product_id = pd.id JOIN `variations` AS v ON ppm.variation_id = v.id where pd.product_name =:product_name and p.provider_name =:provider_name and v.variation_type =:variation_type";
        $stmt = $this->conn->prepare( $query );
        // sanitize
        $this->product_name=htmlspecialchars(strip_tags($this->product_name));
        $this->provider_name=htmlspecialchars(strip_tags($this->provider_name));
        $this->variation_type=htmlspecialchars(strip_tags($this->variation_type));

        // bind values
        $stmt->bindParam(":product_name", $this->product_name);
        $stmt->bindParam(":provider_name", $this->provider_name);
        $stmt->bindParam(":variation_type", $this->variation_type);
        $stmt->execute();
        return $stmt;
    }

    //Energy price create
    function energy_price_update() {
        
        // query to insert record
        $query = "UPDATE provider_product_mappings set monthly_price =:monthly_price WHERE provider_id in (select id from providers where provider_name=:provider_name) AND product_id in (select id from products where product_name=:product_name) AND variation_id in (select id from variations where variation_type=:variation_type)";
        // prepare query
        $stmt = $this->conn->prepare($query);

        // sanitize
        $this->provider_name=htmlspecialchars(strip_tags($this->provider_name));
        $this->product_name=htmlspecialchars(strip_tags($this->product_name));
        $this->variation_type=htmlspecialchars(strip_tags($this->variation_type));
        $this->monthly_price=htmlspecialchars(strip_tags($this->monthly_price));

        // // bind values
        $stmt->bindParam(":provider_name", $this->provider_name);
        $stmt->bindParam(":product_name", $this->product_name);
        $stmt->bindParam(":variation_type", $this->variation_type);
        $stmt->bindParam(":monthly_price", $this->monthly_price);

        // execute query
        if($stmt->execute()){
            return true;
        }

        return false;
    }

}
?>