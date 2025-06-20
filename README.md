# queen-mutya

Tabulation System for Arriba Plaza Queen & Mutyang Pangkalawakan (Iriga City)

---
## Development Setup
Here are the steps to set up the development environment for this project:

1. Download and install
   [XAMPP](https://www.apachefriends.org/download.html)
   and [NodeJS](https://nodejs.org/en/),
   if you haven't already.

2. Start Apache and MySQL through XAMPP if not already running.

3. Clone or download this repository to your XAMPP **htdocs** folder.
   The final path should be `path_to/xampp/htdocs/queen-mutya`.

4. Copy [**`app/config/database.example.php`**](app/config/database.example.php)
   to **`app/config/database.php`**, then modify the database connection settings in the new file.

5. Inside [phpMyAdmin](http://localhost/phpmyadmin),
   create a MySQL database named `queen-mutya` and import [queen-mutya.sql](queen-mutya.sql) into it.

6. Open the terminal and navigate to the project directory **queen-mutya**.

7. Execute the following commands to install the required dependencies:
   ```sh
   npm install
   ```

8. Compile and run the development server with hot reloading:
   ```sh
   npm run dev
   ```

9. Open your web browser and access <http://localhost:5181/queen-mutya/> to view the application.


---
## Backend Testing
This guide will walk you through the process of testing the backend models.

### Prerequisites
Before getting started, ensure that you have [**Composer**](https://getcomposer.org/download/) installed.

### Setup
1. Copy [**`tests/backend/config/test-database.example.php`**](tests/backend/config/test-database.example.php)
   to **`tests/backend/config/test-database.php`**, then modify the database connection settings in the new file.

2. Inside [phpMyAdmin](http://localhost/phpmyadmin),
   create a MySQL database named `test-queen-mutya` and import [queen-mutya.sql](queen-mutya.sql) into it.

3. Run the following command to install the required dependencies.
   ```shell
   composer install
   ```
   If this command does not work, try running `composer update` instead.

### Writing Tests
To write your tests, simply add your **Unit Tests** to the
[tests/backend/**unit**](tests/backend/unit) directory
and your ***Feature Tests*** to the
[tests/backend/**feature**](tests/backend/feature) directory.

### Running Tests
1. Open a terminal window and navigate to the root directory of the project.
2. Run the following command to execute your tests:

   - *all tests*
   ```shell
   phpunit
   ```
   - *unit tests only*
   ```shell
   phpunit --testsuite unit
   ```
   - *feature tests only*
   ```shell
   phpunit --testsuite feature
   ```
   
   If `phpunit` command does not work, try running `vendor\bin\phpunit` instead.


---
## Production Deployment
Here's how to compile the project for production deployment:

1. Generate the public folder by running the following command:
   ```sh
   npm run build
   ```

2. Access the application by visiting `http://[host_name]/queen-mutya`,
   where `host_name` is the **IP address** or **host name** of the server in the network.
   For example:
     - <http://localhost/queen-mutya>
     - <http://192.168.1.99/queen-mutya>


#### Admin Dashboard
Access the **admin dashboard** at <http://localhost/queen-mutya/app>.
The default ***username*** and ***password*** is `admin`.

#### Printing Results
For **printing results**, click the print button in your browser or press `CTRL + P`,
then properly set up the page for printing.

---
## Bullet Train Dashboard
A blazing-fast dashboard inspired by bullet trains *gikan sa Japan!*

### Installation
1. Download and run [github.com/aclc-iriga/tabulation-ws](https://github.com/aclc-iriga/tabulation-ws).
2. Copy [**`app/config/websocket.example.php`**](app/config/websocket.example.php) to `app/config/websocket.php`. Then update the WebSocket server URL in the new config file.
3. Access [localhost/queen-mutya/app/dashboard](http://localhost/queen-mutya/app/dashboard)