import 'package:flutter/material.dart';

import '../tools/calculator.dart';

class ValueNotify extends StatefulWidget {
  const ValueNotify({Key? key}) : super(key: key);

  @override
  _ValueNotifyState createState() => _ValueNotifyState();
}

class _ValueNotifyState extends State<ValueNotify> {
  TextEditingController peso = TextEditingController();
  TextEditingController altura = TextEditingController();

  ValueNotifier<double> _imc = ValueNotifier(0);

  calcular() {
    if (altura.text.isNotEmpty && peso.text.isNotEmpty) {
      double value = Calculator()
          .calculator(double.parse(altura.text), double.parse(peso.text));
      _imc.value = value;
    }
  }

  mudandoPeso() {
    peso.addListener(() {
      calcular();
    });
  }

  mudandoAltura() {
    altura.addListener(() {
      calcular();
    });
  }

  @override
  Widget build(BuildContext context) {
    mudandoPeso();
    mudandoAltura();
    return Scaffold(
      appBar: AppBar(
        title: Text('IMC'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('IMC'),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    hintText: 'Digite seu altura (cm)',
                  ),
                  controller: altura,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    hintText: 'Digite seu peso (Kg)',
                  ),
                  controller: peso,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    double value = Calculator().calculator(
                        double.parse(altura.text), double.parse(peso.text));
                    _imc.value = value;
                  },
                  child: Container(
                    color: Colors.blue[700],
                    width: 68,
                    height: 34,
                    alignment: Alignment.center,
                    child: const Text(
                      'Calcular',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              ValueListenableBuilder(
                valueListenable: _imc,
                builder: (BuildContext context, value, Widget? child) {
                  return value > 1
                      ? Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Text(
                            'Valor do IMC: ${_imc.value.toStringAsPrecision(4)}',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.blue,
                            ),
                          ),
                        )
                      : const Padding(padding: EdgeInsets.all(8.0));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
