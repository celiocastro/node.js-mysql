var mysql = require("mysql");
var inquirer = require("inquirer");

var connection = mysql.createConnection({
  host: "localhost",

  // Your port; if not 3306
  port: 3306,

  // Your username
  user: "root",

  // Your password
  password: "roots",
  database: "bamazon"
});

connection.connect();

var userInput = function () {
    connection.query('SELECT * FROM products', function (error, results) {
        if (error) throw error;
        var products = [];
        var quantities = {};
        results.forEach((result) => {
            var productName = result.product_name;
            var quantity = result.stock_quantity;
            products.push(productName);
            quantities[productName] = quantity;
        });
        inquirer.prompt([
            
            {
                name: "productName",
                message: "What product would you like to buy?:",
                type: "list",
                choices: products.map((product) => { return { name: product + " (" + quantities[product] + ")", value: product } })
            },
            {
                name: "quantity",
                message: function (answers) {
                    return "How many products would you like to buy? (" + quantities[answers.productName] + ")";
                },
                validate: function (input, answers) {
                    var quantity = parseInt(input);
                    if (isNaN(quantity) || quantity > quantities[answers.productName]) {
                        console.log("\nInsufficient quantity!");
                        return false;
                    }
                    return true;
                }
            }
            
        ]).then((answers) => {
            var product = answers.productName;
            var quantity = answers.quantity;
            console.log("\nYou've selected " + product + ".");
            console.log("You've ordered " + quantity + ".\n");
            connection.query('UPDATE products SET stock_quantity=stock_quantity-? WHERE product_name=?',
                [quantity, product], function (error) {
                    if (error) throw error;
                    userInput();
                });
        });
    });
};
userInput();
