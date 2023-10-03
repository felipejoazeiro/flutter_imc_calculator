import 'package:flutter/material.dart';
import 'package:imc_calculator/react/imcCalculator.dart';

class listenChange extends StatelessWidget {
  listenChange({Key? key}) : super(key: key);

  TextEditingController peso = TextEditingController();

  TextEditingController altura = TextEditingController();

  final _imc = ProviderImcCalculator.imcCalculator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC2'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                    _imc.calculo(
                        double.parse(altura.text), double.parse(peso.text));
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
              ListenableBuilder(
                listenable: _imc,
                builder: (BuildContext context, Widget? child) {
                  return _imc.imc > 1
                      ? Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Text(
                            'Valor do IMC: ${_imc.imc.toStringAsPrecision(4)}',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.blue,
                            ),
                          ),
                        )
                      : const Padding(padding: EdgeInsets.all(8.0));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
