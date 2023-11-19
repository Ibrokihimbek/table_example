import 'package:flutter/material.dart';

class CustomDataTable extends StatelessWidget {
  const CustomDataTable({
    super.key,
    required this.columns,
    required this.rows,
    required this.spaceBetweenColumns,
    required this.columnsHeight,
    required this.dataTextStyle,
    required this.color,
  });

  final List<DataColumn> columns;
  final List<DataRow> rows;
  final double spaceBetweenColumns;
  final double columnsHeight;
  final TextStyle dataTextStyle;
  final MaterialStateProperty<Color> color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: DataTable(
            dataRowHeight: 50,
            headingTextStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            columnSpacing: spaceBetweenColumns,
            dataTextStyle: dataTextStyle,
            headingRowColor: color,
            border: TableBorder.lerp(
              const TableBorder(
                top: BorderSide.none,
                right: BorderSide.none,
                bottom: BorderSide.none,
                left: BorderSide.none,
                horizontalInside: BorderSide.none,
                verticalInside: BorderSide.none,
              ),
              const TableBorder(
                top: BorderSide.none,
                right: BorderSide.none,
                bottom: BorderSide.none,
                left: BorderSide.none,
                horizontalInside: BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
                verticalInside: BorderSide.none,
              ),
              1,
            ),
            columns: columns,
            rows: rows,
          ),
        ),
      ),
    );
  }
}
