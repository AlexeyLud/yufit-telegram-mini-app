<?php

namespace App\Api;

class TrainingController
{
    private $trainings = [
        [
            'id' => 1,
            'title' => 'Полный курс для начинающих',
            'category_id' => 3,
            'price' => 299,
            'duration' => '4 недели',
            'difficulty' => 'Легко',
            'image' => 'https://via.placeholder.com/300x200?text=Training+1',
            'description' => 'Идеальный старт для новичков',
            'lessons' => 12,
            'rating' => 4.8
        ],
        [
            'id' => 2,
            'title' => 'Продвинутая программа',
            'category_id' => 5,
            'price' => 699,
            'duration' => '8 недель',
            'difficulty' => 'Сложно',
            'image' => 'https://via.placeholder.com/300x200?text=Training+2',
            'description' => 'Для профессионалов',
            'lessons' => 32,
            'rating' => 4.9
        ],
        [
            'id' => 3,
            'title' => 'Тренировка для девушек',
            'category_id' => 2,
            'price' => 399,
            'duration' => '6 недель',
            'difficulty' => 'Средне',
            'image' => 'https://via.placeholder.com/300x200?text=Training+3',
            'description' => 'Специальная программа',
            'lessons' => 18,
            'rating' => 4.7
        ]
    ];

    public function index()
    {
        $category_id = $_GET['category_id'] ?? null;
        
        $filtered = $this->trainings;
        if ($category_id) {
            $filtered = array_filter($this->trainings, function($t) use ($category_id) {
                return $t['category_id'] == $category_id;
            });
        }

        http_response_code(200);
        echo json_encode([
            'success' => true,
            'data' => array_values($filtered)
        ]);
    }

    public function store()
    {
        // TODO: Implement training creation
        http_response_code(201);
        echo json_encode(['success' => true, 'message' => 'Training created']);
    }
}
