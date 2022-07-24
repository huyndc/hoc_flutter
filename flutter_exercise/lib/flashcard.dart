import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

List shuffle(List array) {
  var currentIndex = array.length, tempIndex, randomIndex;
  while (0 != currentIndex) {
    randomIndex = (Random().nextDouble() * currentIndex).round();
    currentIndex -= 1;
    tempIndex = array[currentIndex];
    array[currentIndex] = array[randomIndex];
    array[randomIndex] = tempIndex;
  }
  return array;
}

bool _start = false;
bool _flip = false;
bool _wait = false;
int _previousIndex = -1;

class item {
  final String code;
  final String photo;
  bool isFlip = true;

  item({required this.code, required this.photo});
}

List items = [];

class _MyHomePageState extends State<MyHomePage> {
  // late FlipCardController _controller;
  void restart() {
    setState(() {
      _start = true;
    });
  }

  @override
  void initState() {
    items.addAll([
      item(code: 'facebook', photo: 'assets/facebook.png'),
      item(code: 'google', photo: 'assets/google.png'),
      item(code: 'apple', photo: 'assets/apple.png'),
      item(code: 'facebook', photo: 'assets/fb.jpg'),
      item(code: 'apple', photo: 'assets/ap.jpg'),
      item(code: 'google', photo: 'assets/chrome.jpg'),
    ]);
    shuffle(items);
    // _controller = FlipCardController();
    super.initState();
    restart();
  }

  final List<bool> _cardFlips = [];
  final List<GlobalKey<FlipCardState>> _cardStateKeys = [];

  Widget buildGridView() {
    return Column(
      children: [
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
          ),
          itemBuilder: (context, index) {
            _cardFlips.add(items[index].isFlip);
            _cardStateKeys.add(GlobalKey<FlipCardState>());
            return _start
                ? FlipCard(
                    flipOnTouch: _wait ? false : _cardFlips[index],
                    key: _cardStateKeys[index],
                    // controller: _controller,
                    speed: 1000,
                    onFlip: () {
                      if (!_flip) {
                        _flip = true;
                        _previousIndex = index;
                      } else {
                        _flip = false;
                        if (_previousIndex != index) {
                          if (items[_previousIndex].code != items[index].code) {
                            _wait = true;

                            Future.delayed(const Duration(milliseconds: 1500),
                                () {
                              _cardStateKeys[_previousIndex]
                                  .currentState
                                  ?.toggleCard();
                              _previousIndex = index;
                              _cardStateKeys[_previousIndex]
                                  .currentState
                                  ?.toggleCard();

                              Future.delayed(const Duration(milliseconds: 160),
                                  () {
                                setState(() {
                                  _wait = false;
                                });
                              });
                            });
                          } else {
                            _cardFlips[_previousIndex] = false;
                            _cardFlips[index] = false;
                            // print(_cardFlips);

                          }
                        }
                      }
                      setState(() {});
                    },
                    direction: FlipDirection.HORIZONTAL,
                    front: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromRGBO(101, 187, 237, 1),
                      ),
                      alignment: Alignment.center,
                      child: const Text('?', style: TextStyle(fontSize: 25)),
                    ),
                    back: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(items[index].photo),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      alignment: Alignment.center,
                    ))
                : Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(items[index].photo),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    alignment: Alignment.center,
                  );
          },
          itemCount: 6,
          shrinkWrap: true,
        ),
        const Expanded(
          child: SizedBox(),
        ),
        Container(
          height: 30,
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: const Color.fromRGBO(101, 187, 237, 1)),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration.zero,
                  pageBuilder: (_, __, ___) => MyHomePage(),
                ),
              );
            },
            child: const Text(
              'Reset',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        alignment: Alignment.topCenter,
        child: buildGridView(),
      ),
    );
  }
}
