// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:bmi_calculator/Controller/fuctions.dart';
import 'package:bmi_calculator/Models/bmi.dart';
import 'package:bmi_calculator/Controller/provider_class.dart';
import 'package:bmi_calculator/Controller/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class ResultTile extends StatelessWidget {
  final PersonBmi? personBmi;
  final int index;
  const ResultTile({super.key, required this.personBmi, required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (context, value, child) => Container(
        margin: EdgeInsets.all(3),
        child: Slidable(
          closeOnScroll: true,
          endActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) => deleteBmiInfo(index, context),
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: Card(
            margin: EdgeInsets.only(top: 0, bottom: 0),
            color: inContainerColor,
            child: ListTile(
              title: Text('${personBmi?.name} (${personBmi?.gender})'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${personBmi?.weight} kg  ${personBmi?.height} cm'),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                          '${personBmi?.time.year}-${personBmi?.time.month}-${personBmi?.time.day}'),
                      SizedBox(width: 10),
                      Text('${personBmi?.time.hour}:${personBmi?.time.minute}'),
                    ],
                  ),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${personBmi!.bmi.toStringAsFixed(2)}(${value.status(personBmi!.bmi)['text']})',
                    style: TextStyle(
                      color: value.status(personBmi!.bmi)['color'],
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    value.status(personBmi!.bmi)['text'] == 'Normal'
                        ? "it's your Ideal Weight!"
                        : 'Try to be ${personBmi!.idealWeight} kg',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: value.status(personBmi!.bmi)['text'] == 'Normal'
                            ? Colors.green
                            : Colors.white),
                  ),
                ],
              ),
              isThreeLine: true,
            ),
          ),
        ),
      ),
    );
  }
}
