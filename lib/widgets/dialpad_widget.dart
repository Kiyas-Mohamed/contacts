import 'package:flutter/material.dart';

class DialpadWidget extends StatelessWidget {
  final Function(String) onNumberPressed;
  final VoidCallback onCallPressed;

  const DialpadWidget({
    Key? key,
    required this.onNumberPressed,
    required this.onCallPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DialpadButton(number: '1', onPressed: onNumberPressed),
              DialpadButton(number: '2', onPressed: onNumberPressed),
              DialpadButton(number: '3', onPressed: onNumberPressed),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DialpadButton(number: '4', onPressed: onNumberPressed),
              DialpadButton(number: '5', onPressed: onNumberPressed),
              DialpadButton(number: '6', onPressed: onNumberPressed),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DialpadButton(number: '7', onPressed: onNumberPressed),
              DialpadButton(number: '8', onPressed: onNumberPressed),
              DialpadButton(number: '9', onPressed: onNumberPressed),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DialpadButton(number: '*', onPressed: onNumberPressed),
              DialpadButton(number: '0', onPressed: onNumberPressed),
              DialpadButton(number: '#', onPressed: onNumberPressed),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.call),
                onPressed: onCallPressed,
                color: Colors.green,
              ),
              DialpadButton(number: '⌫', onPressed: onNumberPressed),
            ],
          ),
        ],
      ),
    );
  }
}

class DialpadButton extends StatelessWidget {
  final String number;
  final Function(String) onPressed;

  const DialpadButton({
    Key? key,
    required this.number,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(number),
      child: Container(
        width: 62.0,
        height: 62.0,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            number,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
