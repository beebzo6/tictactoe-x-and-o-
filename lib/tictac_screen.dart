import 'package:flutter/material.dart';
import 'start_game.dart';

class TicTacScreen extends StatefulWidget {
  const TicTacScreen({super.key});
  @override
  State<TicTacScreen> createState() => _TicTacScreenState();
}

// class _startgame extends State<TicTacScreen> {
//   var startgame = 'start_game';
// }

class _TicTacScreenState extends State<TicTacScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text('Tic Tac Toe'))),
      body: Column(
        children: [
          Center(child: Text('Tic Tac Toe Game')),
          SizedBox(height: 60),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StartGame()),
              );
            },
            child: const Text('Start Game'),
          ),
        ],
      ),
    );
  }
}
