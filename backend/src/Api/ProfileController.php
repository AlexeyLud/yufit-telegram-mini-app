<?php

namespace App\Api;

class ProfileController
{
    public function show()
    {
        // TODO: Get actual user data from database
        http_response_code(200);
        echo json_encode([
            'success' => true,
            'data' => [
                'id' => 123456,
                'first_name' => 'Иван',
                'last_name' => 'Петров',
                'username' => 'ivan_petrov',
                'avatar' => 'https://via.placeholder.com/100x100?text=Avatar',
                'is_premium' => true,
                'joined_date' => '2024-01-15',
                'stats' => [
                    'completed_trainings' => 5,
                    'total_hours' => 42,
                    'materials_purchased' => 8,
                    'current_streak' => 7
                ],
                'purchased_items' => [
                    ['id' => 1, 'title' => 'Полный курс', 'purchased_at' => '2024-02-01'],
                    ['id' => 2, 'title' => 'Гайд по питанию', 'purchased_at' => '2024-02-05']
                ]
            ]
        ]);
    }
}
