import 'package:flutter/material.dart';
import 'package:table_example/widgets/custom_data_table.dart';

class TableExamplePage extends StatefulWidget {
  const TableExamplePage({super.key});

  @override
  State<TableExamplePage> createState() => _TableExamplePageState();
}

class _TableExamplePageState extends State<TableExamplePage> {
  int currentIdex = -1;
  late List<String> selected;

  @override
  void initState() {
    super.initState();
    initializeLists();
  }

  void initializeLists() {
    final answersLength = row.length;
    selected = List.generate(
      answersLength,
      (_) => '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Table Example'),
      ),
      body: Row(
        children: [
          Expanded(
            child: Image.network(
              'https://miro.medium.com/v2/resize:fit:1358/0*3IqlBLCbC_uLjzSh.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hello',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 27,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  'World',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 28),
                SizedBox(
                  width: double.maxFinite,
                  child: CustomDataTable(
                    color: MaterialStateProperty.all(
                      const Color(0xff1AC19D),
                    ),
                    columns: List.generate(
                      column.length + 1,
                      (columnIndex) {
                        if (columnIndex == 0) {
                          return const DataColumn(
                            label: Text(
                              '',
                            ),
                          );
                        }
                        return DataColumn(
                          label: Text(
                            column[columnIndex - 1],
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                    dataTextStyle: const TextStyle(color: Colors.black),
                    rows: List.generate(
                      row.length,
                      (rowIndex) => DataRow(
                        color:
                            const MaterialStatePropertyAll(Color(0xffEEF0F2)),
                        cells: List.generate(
                          column.length + 1,
                          (index) {
                            if (index == 0) {
                              return DataCell(
                                Text(
                                  row[rowIndex],
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              );
                            }
                            return DataCell(
                              Radio(
                                value: column[index - 1],
                                groupValue: selected[rowIndex],
                                onChanged: (value) {
                                  setState(() {
                                    selected[rowIndex] = value.toString();
                                  });
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    columnsHeight: 0,
                    spaceBetweenColumns: 40,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  MaterialStateProperty<Color?> getTableRowColor(int index) =>
      MaterialStateProperty.all((index + 1).isOdd
          ? Colors.grey.withOpacity(0.3)
          : Colors.transparent);
}

List<String> column = [
  'Junior',
  'Middle',
  'Senior',
  'Lead',
  'Architect',
];

List<String> row = [
  'Sunnatilo',
  'Mirsaid',
  'Begzod',
];
