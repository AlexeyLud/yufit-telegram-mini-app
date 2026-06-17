import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/training_model.dart';
import '../../providers/training_provider.dart';
import '../../theme/app_theme.dart';

class TrainingsTab extends StatefulWidget {
  const TrainingsTab({Key? key}) : super(key: key);

  @override
  State<TrainingsTab> createState() => _TrainingsTabState();
}

class _TrainingsTabState extends State<TrainingsTab> {
  int? _selectedCategory;

  final List<Map<String, dynamic>> _categories = [
    {'id': 1, 'name': 'Мужчинам', 'color': Color(0xFF0066FF)},
    {'id': 2, 'name': 'Девушкам', 'color': Color(0xFFFF0099)},
    {'id': 3, 'name': 'Новичкам', 'color': Color(0xFF00CC66)},
    {'id': 4, 'name': 'Опытным', 'color': Color(0xFFFF6600)},
    {'id': 5, 'name': 'Продвинутым', 'color': Color(0xFFFF0000)},
  ];

  @override
  void initState() {
    super.initState();
    context.read<TrainingProvider>().fetchTrainings();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '👋 Добро пожаловать!',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  'Выберите программу тренировок',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: _categories
                  .map((cat) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: FilterChip(
                          label: Text(cat['name']),
                          selected: _selectedCategory == cat['id'],
                          onSelected: (selected) {
                            setState(() {
                              _selectedCategory =
                                  selected ? cat['id'] : null;
                            });
                            context
                                .read<TrainingProvider>()
                                .fetchTrainings(
                                    categoryId: _selectedCategory);
                          },
                          backgroundColor: AppTheme.surfaceColor,
                          selectedColor: cat['color'],
                        ),
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(height: 24),
          Consumer<TrainingProvider>(
            builder: (context, provider, _) {
              if (provider.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppTheme.primaryColor,
                  ),
                );
              }

              if (provider.trainings.isEmpty) {
                return Center(
                  child: Text(
                    'Тренировки не найдены',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                );
              }

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: provider.trainings.length,
                itemBuilder: (context, index) {
                  final training = provider.trainings[index];
                  return TrainingCard(training: training);
                },
              );
            },
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class TrainingCard extends StatelessWidget {
  final TrainingModel training;

  const TrainingCard({
    Key? key,
    required this.training,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              training.image,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        training.title,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '⭐ ${training.rating}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  training.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.schedule,
                            size: 16, color: AppTheme.secondaryTextColor),
                        const SizedBox(width: 4),
                        Text(
                          training.duration,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(width: 16),
                        const Icon(Icons.school,
                            size: 16, color: AppTheme.secondaryTextColor),
                        const SizedBox(width: 4),
                        Text(
                          '${training.lessons} уроков',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('${training.price} ₽'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
