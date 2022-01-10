import 'package:flutter/material.dart';
import 'package:number_system_converter/option_checker.dart';
import 'conversion.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final number_controller = TextEditingController();
  String? valuechoose_one;
  String? valuechoose_two;
  String? result = '0';
  List listItem = ['Binary', 'Decimal', 'Octal', 'HexaDecimal'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Number System Converter'),
            elevation: 5,
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: 'Enter Number',
                        hintStyle: TextStyle(fontSize: 19),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2)),
                        labelStyle: TextStyle(),
                        border: OutlineInputBorder(),
                      ),
                      controller: number_controller,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15.0, top: 20, right: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 150,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey, width: 1)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              value: valuechoose_one,
                              hint: Text('Select'),
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 36,
                              isExpanded: true,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.black,overflow: TextOverflow.ellipsis),
                              items: listItem.map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(valueItem),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  valuechoose_one = value.toString();
                                });
                              },
                            ),
                          ),
                        ),
                        Container(
                          child: const Icon(
                            Icons.arrow_forward,
                            size: 40,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          width: 150,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey, width: 1)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              value: valuechoose_two,
                              hint: Text('Select'),
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 36,
                              isExpanded: true,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                              items: listItem.map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(valueItem),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  valuechoose_two = value.toString();
                                });
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(350, 50),
                      ),
                      onPressed: () {
                        setState(() {
                          result = option_checker(valuechoose_one,
                              valuechoose_two, number_controller.text);
                        });
                      },
                      child: const Text(
                        'CONVERT',
                        style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.bold),
                      )),
                  Container(
                    height: 350,
                    width: 350,
                    alignment: Alignment.center,
                    child: Text(
                      result.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          fontFamily: 'Ubuntu'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
