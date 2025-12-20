// import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';

// import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';

import 'package:flutter/material.dart';
import 'button.dart';

class StartGame extends StatefulWidget {
  const StartGame({super.key});
  @override
  State<StartGame> createState() => _StartGame();
}

class _StartGame extends State<StartGame> {
  String response = 'X';
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('X and O ')),
      body: Column(
        children: [
          SizedBox(height: 160),
          Wrap(
            children: List.generate(buttons.length, (index) {
              return SizedBox(
                width: screenSize.width / 3,
                height: screenSize.width / 3,
                child: buildButton(response, index, buttons),
              );
            }),
          ),
        ],
      ),
    );
    // return Container(child: Column(children: [Text("hello"), Text("there")]));
  }

  Widget buildButton(String buttonText, int index, List<String> buttons) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Material(
        clipBehavior: Clip.hardEdge,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 237, 231, 231),
            width: 1,
          ),
        ),
        child: InkWell(
          onTap: () {
            setState(() {
              checkValue(index, buttonText) {
                if (buttons[index].isEmpty && buttonText == '') {
                  response = 'X';
                  buttons[index] = 'X';
                  checkWinner(buttons);
                  print(buttonText);
                } else if (buttons[index].isEmpty && buttonText == 'X') {
                  response = 'O';
                  buttons[index] = 'O';
                  checkWinner(buttons);
                  return;
                } else if (buttons[index].isEmpty && response == 'O') {
                  response = 'X';
                  buttons[index] = 'X';
                  checkWinner(buttons);
                  return;
                }
              }

              checkValue(index, response);
            });
          },
          child: Center(
            child: Text(
              buttons[index],
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  ///get if the value is an x or o
  void checkWinner(List who) {
    // check rows
    for (int i = 0; i < 9; i += 3) {
      if (who[i] != '' && who[i] == who[i + 1] && who[i] == who[i + 2]) {
        showwinner('${who[i]} wins!', who);

        // print('${who[i]} wins!');
        return;
      }

      // check columns
      for (int i = 0; i < 3; i++) {
        if (who[i] != '' && who[i] == who[i + 3] && who[i] == who[i + 6]) {
          showwinner('${who[i]} wins!', who);

          // print('${who[i]} wins!');
          return;
        }
      }

      // check diagonals
      if (who[0] != '' && who[0] == who[4] && who[0] == who[8]) {
        showwinner('${who[2]} wins!', who);

        // print('${who[0]} wins!');
        return;
      }
      if (who[2] != '' && who[2] == who[4] && who[2] == who[6]) {
        showwinner('${who[2]} wins!', who);

        return;
      }
    }
  }

  void showwinner(String winnertext, List buttons) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Game Over"),
        content: Text("$winnertext is the winner!"),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                buttons.setAll(0, ['1', '2', '2', '', '', '', '', '', '']);
                print(buttons); // [a, bee, sea, d]
              });
            },
            child: Text("Play Again"),
          ),
        ],
      ),
    );
  }
}
