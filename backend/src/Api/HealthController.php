<?php

namespace App\Api;

class HealthController
{
    public function check()
    {
        http_response_code(200);
        echo json_encode([
            'status' => 'ok',
            'message' => 'YuFit API is running',
            'timestamp' => date('Y-m-d H:i:s')
        ]);
    }
}
