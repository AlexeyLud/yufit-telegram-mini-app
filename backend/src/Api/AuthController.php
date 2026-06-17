<?php

namespace App\Api;

class AuthController
{
    public function verify()
    {
        $data = json_decode(file_get_contents('php://input'), true);
        
        // Verify Telegram Web App data
        if (!isset($data['initData'])) {
            http_response_code(400);
            echo json_encode(['error' => 'Missing initData']);
            return;
        }

        // Parse and validate Telegram data
        parse_str($data['initData'], $telegram_data);
        
        if (!isset($telegram_data['user'])) {
            http_response_code(401);
            echo json_encode(['error' => 'Invalid user data']);
            return;
        }

        $user = json_decode($telegram_data['user'], true);

        http_response_code(200);
        echo json_encode([
            'success' => true,
            'user' => [
                'id' => $user['id'],
                'first_name' => $user['first_name'],
                'last_name' => $user['last_name'] ?? '',
                'username' => $user['username'] ?? '',
                'is_premium' => $user['is_premium'] ?? false
            ],
            'token' => bin2hex(random_bytes(32))
        ]);
    }
}
