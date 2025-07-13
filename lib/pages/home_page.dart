import 'dart:async';

import 'package:anti_ux_quest/controller/home_controller.dart';
import 'package:anti_ux_quest/extension/int_extension.dart';
import 'package:anti_ux_quest/extension/list_extension.dart';
import 'package:flutter/material.dart';

import '../class/keyboard_class.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController store = HomeController();

  @override
  void initState() {
    super.initState();
    store.addKeyboardList();
    store.timer = Timer.periodic(const Duration(seconds: 5), (_) {
      final novaLista = List<KeyboardClass>.from(store.keyboardsLabels.value);
      novaLista.shuffle();
      store.keyboardsLabels.value = novaLista;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Anti UX Quest')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: store.keyboardTextController,
              autofocus: false,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Insira seu nome',
                border: OutlineInputBorder(),
              ),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  useSafeArea: true,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  builder: (context) {
                    ValueNotifier<String> textNotifier = ValueNotifier("");
                    return Container(
                      padding: const EdgeInsets.all(8.0),
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: double.maxFinite,
                      child: Column(
                        spacing: 8.0,
                        children: [
                          SizedBox(
                            width: double.maxFinite,
                            child: ValueListenableBuilder(
                              valueListenable: textNotifier,
                              builder: (context, value, child) {
                                return Text(value, textAlign: TextAlign.center);
                              },
                            ),
                          ),
                          Expanded(
                            child: ValueListenableBuilder(
                              valueListenable: store.keyboardsLabels,
                              builder: (context, value, child) {
                                return GridView.builder(
                                  physics: store.keyboardPhysics,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 60.widthDivisor,
                                        mainAxisSpacing: 4.0,
                                        crossAxisSpacing: 4.0,
                                      ),
                                  itemCount: store.keyboardsLabels.value.length,
                                  itemBuilder: (context, index) {
                                    final KeyboardClass keyboard =
                                        store.keyboardsLabels.value[index];
                                    final MaterialColor co =
                                        store.keyboardColors.pickRandom;
                                    return ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: co,
                                      ),
                                      onPressed: () {
                                        textNotifier.value += keyboard.value;
                                      },
                                      child: Text(
                                        keyboard.value,
                                        style: TextStyle(color: co.shade900),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                splashRadius: 20,
                                onPressed: () {
                                  store.keyboardTextController.text = '';
                                  textNotifier.value = '';
                                },
                                icon: const Icon(Icons.backspace),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  int selectedNumber = [0, 1].pickRandom;
                                  if (selectedNumber == 0) {
                                    store.keyboardTextController.text =
                                        textNotifier.value;
                                    Navigator.pop(context);
                                  } else {
                                    textNotifier.value = '';
                                  }
                                },
                                child: const Text('Enviar? (50%)'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              onChanged: (texto) {
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
