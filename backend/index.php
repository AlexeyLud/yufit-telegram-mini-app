<?php
/**
 * YuFit Telegram Mini App Backend
 * Main entry point
 */

require_once __DIR__ . '/vendor/autoload.php';

use Dotenv\Dotenv;

// Load environment variables
$dotenv = Dotenv::createImmutable(__DIR__);
$dotenv->load();

// Set headers
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Authorization');

// Handle preflight requests
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

// API Router
$request_uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$request_method = $_SERVER['REQUEST_METHOD'];

// Remove base path if exists
$request_uri = str_replace('/api', '', $request_uri);

// Route handling
$routes = [
    'GET' => [
        '/health' => 'Api\\HealthController@check',
        '/categories' => 'Api\\CategoryController@index',
        '/trainings' => 'Api\\TrainingController@index',
        '/materials' => 'Api\\MaterialController@index',
        '/profile' => 'Api\\ProfileController@show',
    ],
    'POST' => [
        '/auth/verify' => 'Api\\AuthController@verify',
        '/trainings' => 'Api\\TrainingController@store',
        '/materials' => 'Api\\MaterialController@store',
    ],
];

// Match route
$route_found = false;
if (isset($routes[$request_method])) {
    foreach ($routes[$request_method] as $pattern => $controller) {
        if ($request_uri === $pattern || preg_match('^' . $pattern . '$', $request_uri)) {
            $route_found = true;
            list($controller_name, $method) = explode('@', $controller);
            
            // Dynamically load and call controller
            try {
                $class = 'App\\' . $controller_name;
                $controller_instance = new $class();
                $controller_instance->$method();
            } catch (Exception $e) {
                http_response_code(500);
                echo json_encode(['error' => $e->getMessage()]);
            }
            break;
        }
    }
}

// 404 Not Found
if (!$route_found) {
    http_response_code(404);
    echo json_encode(['error' => 'Route not found']);
}
