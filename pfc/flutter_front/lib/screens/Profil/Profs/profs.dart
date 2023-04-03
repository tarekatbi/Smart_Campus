import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class Profs extends StatefulWidget {
  @override
  _ProfsState createState() => _ProfsState();
}

class _ProfsState extends State<Profs> {
  final elements = [
    {'group': 'A', 'name': 'Atmani'},
    {'group': 'A', 'name': 'Amrane'},
    {'group': 'A', 'name': 'Adla'},
    {'group': 'A', 'name': 'Aribi'},
    {'group': 'B', 'name': 'Bengueddach'},
    {'group': 'B', 'name': 'Bousmaha'},
    {'group': 'B', 'name': 'Barigou'},
    {'group': 'B', 'name': 'Benamina'},
    {'group': 'H', 'name': 'Hadi'},
    {'group': 'H', 'name': 'Haffaf'},
    {'group': 'L', 'name': 'Larabi'},
    {'group': 'M', 'name': 'Mami'},
    {'group': 'M', 'name': 'Mechah'},
    {'group': 'M', 'name': 'Meziane'},
    {'group': 'M', 'name': 'Mokhtari'},
    {'group': 'N', 'name': 'Naoui'},
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Professeurs'),
          backgroundColor: Color(0xFF0353A4),
        ),
        body: GroupedListView<dynamic, String>(
          useStickyGroupSeparators: true,
          itemComparator: (item1, item2) =>
              item1['name'].compareTo(item2['name']),
          // groupComparator: (value1, value2) => value2.compareTo(value1),
          elements: elements,
          groupBy: (element) => element['group'],
          groupSeparatorBuilder: (value) => Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Color(0xFFC3C3C3),
            child: Text(value),
          ),
          itemBuilder: (context, element) => Card(
            elevation: 3,
            child: ListTile(
              contentPadding: const EdgeInsets.all(8),
              leading: const Icon(Icons.account_circle, size: 36),
              title: Text(element['name']),
            ),
          ),
        ),
      );
}
