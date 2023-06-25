import 'dart:math';

import 'package:flutter/material.dart';

class CounterFunctionsScreenWidget extends StatefulWidget {
  const CounterFunctionsScreenWidget({super.key});

  @override
  State<CounterFunctionsScreenWidget> createState() =>
      _CounterFunctionsScreenWidgetState();
}

class _CounterFunctionsScreenWidgetState
    extends State<CounterFunctionsScreenWidget> {
  int clickCounter = 0;

  Color _getRandomColor() {
    return Color.fromARGB(
      255,
      Random().nextInt(256),
      Random().nextInt(256),
      Random().nextInt(256),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Counter Functions"),
          centerTitle: true,
          leading: const Icon(Icons.account_circle),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh_rounded),
              onPressed: () {
                setState(() {
                  clickCounter = 0;
                });
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$clickCounter",
                style: TextStyle(
                  fontSize: 160,
                  fontWeight: FontWeight.w100,
                  color: _getRandomColor(),
                ),
              ),
              Text(
                () {
                  return clickCounter == 1 ? "Click" : "Clicks";
                }(),
                style: const TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              icon: Icons.refresh_outlined,
              onPressed: () => {
                if (clickCounter != 0) {setState(() => clickCounter = 0)}
              },
            ),
            const SizedBox(height: 10),
            CustomButton(
              icon: Icons.plus_one,
              onPressed: () {
                setState(() {
                  clickCounter++;
                });
              },
            ),
            const SizedBox(height: 10),
            CustomButton(
              icon: Icons.exposure_minus_1,
              onPressed: () {
                if (clickCounter == 0) return;
                setState(() {
                  clickCounter--;
                });
              },
            ),
          ],
        ));
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      enableFeedback: true,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
