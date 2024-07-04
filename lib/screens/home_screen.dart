import 'package:fitnesssupporter/models/fitness_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String getToday() {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String strToday = formatter.format(now);
    return strToday;
  }

  List<FitnessModel> listFitness = [
    FitnessModel(
        name: '렛풀다운', part: '등', discpription: '설명', category: 'weight'),
    FitnessModel(
        name: '스쿼트', part: '하체', discpription: '설명', category: 'weight'),
    FitnessModel(
        name: '달리기', part: '유산소', discpription: '설명', category: 'cardio'),
    FitnessModel(
        name: '벤치프레스', part: '가슴', discpription: '설명', category: 'weight'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  getToday(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios)),
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            child: ReorderableListView(
              onReorder: (int oldIndex, int newIndex) {
                setState(() {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final FitnessModel item = listFitness.removeAt(oldIndex);
                  listFitness.insert(newIndex, item);
                });
              },
              children: [
                for (var fitness in listFitness)
                  ListTile(
                    key: Key(fitness.name),
                    title: Text(fitness.name),
                    subtitle: Text(fitness.part),
                    leading: fitness.getIcon(),
                    trailing: const Icon(Icons.drag_handle),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
