<?php

namespace App\Api;

class MaterialController
{
    private $materials = [
        [
            'id' => 1,
            'title' => 'Гайд по питанию',
            'type' => 'pdf',
            'size' => '2.5 MB',
            'category_id' => 3,
            'price' => 99,
            'pages' => 42,
            'rating' => 4.6
        ],
        [
            'id' => 2,
            'title' => 'Видео: Техника выполнения',
            'type' => 'video',
            'duration' => '45 минут',
            'category_id' => 1,
            'price' => 199,
            'rating' => 4.8
        ],
        [
            'id' => 3,
            'title' => 'Чек-лист восстановления',
            'type' => 'pdf',
            'size' => '0.8 MB',
            'category_id' => 4,
            'price' => 49,
            'pages' => 8,
            'rating' => 4.7
        ]
    ];

    public function index()
    {
        $category_id = $_GET['category_id'] ?? null;
        
        $filtered = $this->materials;
        if ($category_id) {
            $filtered = array_filter($this->materials, function($m) use ($category_id) {
                return $m['category_id'] == $category_id;
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
        // TODO: Implement material creation
        http_response_code(201);
        echo json_encode(['success' => true, 'message' => 'Material created']);
    }
}
