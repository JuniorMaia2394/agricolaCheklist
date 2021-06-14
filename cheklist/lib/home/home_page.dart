import 'package:cheklist/core/app_text_styles.dart';
import 'package:cheklist/core/core.dart';
import 'package:flutter/material.dart';

import 'package:cheklist/home/Widgets/card/form_card.dart';
import 'package:cheklist/home/Widgets/input/form_input.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Nome do tratorista",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Identificação do trator',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
                child: Card(
                  shadowColor: AppColors.black.withOpacity(1),
                  child: Column(
                    children: <Widget>[
                      const ListTile(
                        title: Text(
                          '1 - Nível de óleo do motor',
                        ),
                      ),
                      Icon(
                        Icons.agriculture,
                        size: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {/* ... */},
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              child: const Text('DEFEITO'),
                              onPressed: () {/* ... */},
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
                child: Card(
                  shadowColor: AppColors.black.withOpacity(1),
                  child: Column(
                    children: <Widget>[
                      const ListTile(
                        title: Text(
                          '2 - Verificar nível de óleo hidráulico',
                          style: TextStyle(),
                        ),
                      ),
                      Icon(
                        Icons.agriculture,
                        size: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {/* ... */},
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              child: const Text('DEFEITO'),
                              onPressed: () {/* ... */},
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  /* ... */
                },
                label: const Text('CONFIRMAR'),
                icon: Icon(Icons.thumb_up),
              ),
              SizedBox(
                height: 8,
              )
            ],
          ),
        ),
      ),
    );
  }
}
