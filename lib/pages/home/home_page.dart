import 'package:calculator/models/operations_model.dart';
import 'package:calculator/widgets/buttom_widget.dart';
import 'package:calculator/widgets/visor_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String visorText = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      body: Column(
        children: [
          Consumer<OperationsModel>(builder: (context, data, child) {
            visorText = data.digits;
            return VisorWidget(
              value: data.digits.isEmpty ? '0' : data.digits,
              result: data.result.toString(),
            );
          }),
          Expanded(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              shrinkWrap: true,
              crossAxisCount: 4,
              children: [
                ButtomWidget(
                  label: 'AC',
                  value: 1,
                  onPressFunction: () {
                    Provider.of<OperationsModel>(context, listen: false).ac();
                  },
                  color: ButtonColor.normal,
                ),
                ButtomWidget(
                  label: '+/-',
                  value: 2,
                  onPressFunction: () {
                    visorText += '2';
                    setState(() {});
                  },
                  color: ButtonColor.normal,
                ),
                ButtomWidget(
                  label: '%',
                  value: 2,
                  onPressFunction: () {
                    visorText += '2';
                    setState(() {});
                  },
                  color: ButtonColor.normal,
                ),
                ButtomWidget(
                  label: '÷',
                  value: 2,
                  onPressFunction: () {
                    Provider.of<OperationsModel>(context, listen: false)
                        .add('÷');
                    Provider.of<OperationsModel>(context, listen: false)
                        .operation('÷');
                  },
                  color: ButtonColor.function,
                ),
                ButtomWidget(
                  label: '7',
                  value: 7,
                  onPressFunction: () {
                    Provider.of<OperationsModel>(context, listen: false)
                        .add('7');
                  },
                  color: ButtonColor.normal,
                ),
                ButtomWidget(
                  label: '8',
                  value: 8,
                  onPressFunction: () {
                    Provider.of<OperationsModel>(context, listen: false)
                        .add('8');
                  },
                  color: ButtonColor.normal,
                ),
                ButtomWidget(
                  label: '9',
                  value: 9,
                  onPressFunction: () {
                    Provider.of<OperationsModel>(context, listen: false)
                        .add('9');
                  },
                  color: ButtonColor.normal,
                ),
                ButtomWidget(
                  label: 'X',
                  value: 2,
                  onPressFunction: () {
                    Provider.of<OperationsModel>(context, listen: false)
                        .add('x');
                    Provider.of<OperationsModel>(context, listen: false)
                        .operation('x');
                  },
                  color: ButtonColor.function,
                ),
                ButtomWidget(
                  label: '4',
                  value: 4,
                  onPressFunction: () {
                    Provider.of<OperationsModel>(context, listen: false)
                        .add('4');
                  },
                  color: ButtonColor.normal,
                ),
                ButtomWidget(
                  label: '5',
                  value: 5,
                  onPressFunction: () {
                    Provider.of<OperationsModel>(context, listen: false)
                        .add('5');
                  },
                  color: ButtonColor.normal,
                ),
                ButtomWidget(
                  label: '6',
                  value: 6,
                  onPressFunction: () {
                    Provider.of<OperationsModel>(context, listen: false)
                        .add('6');
                  },
                  color: ButtonColor.normal,
                ),
                ButtomWidget(
                  label: '-',
                  value: 2,
                  onPressFunction: () {
                    Provider.of<OperationsModel>(context, listen: false)
                        .add('-');
                    Provider.of<OperationsModel>(context, listen: false)
                        .operation('-');
                  },
                  color: ButtonColor.function,
                ),
                ButtomWidget(
                  label: '1',
                  value: 1,
                  onPressFunction: () {
                    Provider.of<OperationsModel>(context, listen: false)
                        .add('1');
                  },
                  color: ButtonColor.normal,
                ),
                ButtomWidget(
                  label: '2',
                  value: 2,
                  onPressFunction: () {
                    Provider.of<OperationsModel>(context, listen: false)
                        .add('2');
                  },
                  color: ButtonColor.normal,
                ),
                ButtomWidget(
                  label: '3',
                  value: 3,
                  onPressFunction: () {
                    Provider.of<OperationsModel>(context, listen: false)
                        .add('3');
                  },
                  color: ButtonColor.normal,
                ),
                ButtomWidget(
                  label: '+',
                  value: 2,
                  onPressFunction: () {
                    Provider.of<OperationsModel>(context, listen: false)
                        .add('+');
                    Provider.of<OperationsModel>(context, listen: false)
                        .operation('+');
                  },
                  color: ButtonColor.function,
                ),
                ButtomWidget(
                  label: '?',
                  value: 1,
                  onPressFunction: () {
                    visorText += '?';
                    setState(() {});
                  },
                  color: ButtonColor.normal,
                ),
                ButtomWidget(
                  label: '0',
                  value: 0,
                  onPressFunction: () {
                    Provider.of<OperationsModel>(context, listen: false)
                        .add('0');
                  },
                  color: ButtonColor.normal,
                ),
                ButtomWidget(
                  label: '.',
                  value: 2,
                  onPressFunction: () {
                    if (visorText.substring(
                            visorText.length - 2, visorText.length) ==
                        '..') {
                      return;
                    } else {
                      Provider.of<OperationsModel>(context, listen: false)
                          .add('.');
                    }
                  },
                  color: ButtonColor.normal,
                ),
                ButtomWidget(
                  label: '=',
                  value: 2,
                  onPressFunction: () {
                    Provider.of<OperationsModel>(context, listen: false)
                        .operation('=');
                  },
                  color: ButtonColor.function,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
