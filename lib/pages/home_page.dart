import 'package:app_calculadora/component/input_form_app.dart';
import 'package:app_calculadora/service/calculadora_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:select_form_field/select_form_field.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora'),
          centerTitle: true,
          backgroundColor: Colors.brown,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 50,
            ),
            child: Form(
              key: _formkey,
              child: Consumer<CalculadoraService>(
                builder: (_, calculadoraService, __) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: InputFormApp(
                              controller: calculadoraService.controllerValor1,
                              labelText: 'Valor 1',
                              hintText: 'Valor 1',
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Informe o valor 1';
                                }
                                return null;
                              },
                              onSaved: (value) => calculadoraService
                                  .calculoAtual.valor1 = double.parse(value!),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Flexible(
                            child: InputFormApp(
                              controller: calculadoraService.controllerValor2,
                              labelText: 'Valor 2',
                              hintText: 'Valor 2',
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Informe o valor 2';
                                }
                                return null;
                              },
                              onSaved: (value) => calculadoraService
                                  .calculoAtual.valor2 = double.parse(value!),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SelectFormField(
                              type: SelectFormFieldType.dropdown,
                              initialValue: 'somar',
                              labelText: 'Selecione a Operação',
                              items: const [
                                {'value': 'somar', 'label': 'Somar'},
                                {'value': 'subtrair', 'label': 'Subtrair'},
                                {
                                  'value': 'multiplicar',
                                  'label': 'Multiplicar'
                                },
                                {'value': 'dividir', 'label': 'Dividir'},
                              ],
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Informe a operação';
                                }
                                return null;
                              },
                              onSaved: (value) =>
                                  calculadoraService.calculoAtual.type = value!,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  _formkey.currentState!.save();

                                  //chamar o calculo
                                  calculadoraService.calcula();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.brown,
                                fixedSize: const Size(240, 70),
                              ),
                              child: const Text(
                                'Calcular',
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              )),
                        ],
                      ),

                      // LISTA DE CALCULOS
                      ListView.builder(
                        itemCount: calculadoraService.calculos.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(
                                calculadoraService
                                    .calculos[index].calculoRealizado,
                              ),
                              subtitle: Text(
                                calculadoraService.calculos[index].resultado!
                                    .toStringAsFixed(2),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ));
  }
}
