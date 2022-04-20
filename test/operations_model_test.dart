import 'package:calculator/models/operations_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  tearDownAll(
    () {
      print('finaliza suit testes');
    },
  );

  OperationsModel operationsModel = OperationsModel('0');
  test(
    'Nao deve acrescentar outro 0 se tem um 0 no comeco da string',
    () {
      operationsModel.add('0');
      expect(operationsModel.digits, '0');
    },
  );

  test(
    'Nao deve comecar a string com 0',
    () {
      operationsModel.add('1');
      expect(operationsModel.digits, '1');
    },
  );

  test(
    'Deve resetar a string para 0',
    () {
      operationsModel.add('190,00');
      operationsModel.ac();
      expect(operationsModel.digits, '0');
    },
  );

  test(
    'Deve somar 2 numeros',
    () {
      operationsModel.add('4');
      operationsModel.operation('+');
      operationsModel.add('4');
      operationsModel.operation('=');
      expect(operationsModel.result, 8);
    },
  );

  test(
    'Deve Multiplicar 2 numeros',
    () {
      operationsModel.ac();
      operationsModel.add('2');
      operationsModel.operation('x');
      operationsModel.add('8');
      operationsModel.operation('=');
      expect(operationsModel.result, 16.0);
    },
  );

  test(
    'Deve quebrar a string de digitos e fazer a operacao',
    () {
      operationsModel.add('1');
      operationsModel.operation('+');
      expect(operationsModel.firstDigit, 1.0);
    },
  );

  test(
    'Deve somar o primeiro resultado com o proximo digito',
    () {
      operationsModel.add('1');
      operationsModel.operation('+');
      operationsModel.add('1');
      operationsModel.operation('+');
      expect(operationsModel.result, 2.0);
    },
  );

  test(
    'Nao deve aceitar repetir operadores exemplo ++',
    () {
      operationsModel.add('1');
      operationsModel.operation('+');
      operationsModel.operation('+');
      expect(operationsModel.digitedOperator, true);
    },
  );
}
