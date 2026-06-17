<?php

namespace App\Api;

class CategoryController
{
    private $categories = [
        [
            'id' => 1,
            'name' => 'Мужчинам',
            'icon' => '👨',
            'description' => 'Тренировки специально для мужчин',
            'color' => '#0066FF'
        ],
        [
            'id' => 2,
            'name' => 'Девушкам',
            'icon' => '👩',
            'description' => 'Тренировки специально для девушек',
            'color' => '#FF0099'
        ],
        [
            'id' => 3,
            'name' => 'Новичкам',
            'icon' => '🌱',
            'description' => 'Для тех, кто только начинает',
            'color' => '#00CC66'
        ],
        [
            'id' => 4,
            'name' => 'Опытным',
            'icon' => '💪',
            'description' => 'Для опытных спортсменов',
            'color' => '#FF6600'
        ],
        [
            'id' => 5,
            'name' => 'Продвинутым',
            'icon' => '🔥',
            'description' => 'Профессиональный уровень',
            'color' => '#FF0000'
        ]
    ];

    public function index()
    {
        http_response_code(200);
        echo json_encode([
            'success' => true,
            'data' => $this->categories
        ]);
    }
}
