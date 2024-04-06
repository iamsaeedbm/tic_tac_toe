import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isTurnO = true;
  List<String> XOList = ['', '', '', '', '', '', '', '', ''];
  int filledBoxes = 0;
  bool gameHasResult = false;
  int scoreX = 0;
  int scoreO = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                clearGame();
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            getScoreBord(),
            SizedBox(height: 30),
            getGridView(),
            getTurn(),
          ],
        ),
      ),
    );
  }

  Widget getScoreBord() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              'Player O',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
              ),
            ),
            Text(
              '$scoreO',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              'Player X',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
              ),
            ),
            Text(
              '$scoreX',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget getGridView() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: 9,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              tapped(index);
            },
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Center(
                child: Text(
                  XOList[index],
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: XOList[index] == 'X' ? Colors.red : Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void tapped(int index) {
    setState(() {
      if (isTurnO && XOList[index] == '') {
        XOList[index] = 'O';
        isTurnO = false;
        filledBoxes = filledBoxes + 1;
      }
      if (!isTurnO && XOList[index] == '') {
        XOList[index] = 'X';
        isTurnO = true;
        filledBoxes = filledBoxes + 1;
      }
      checkWinner();
    });
  }

  void checkWinner() {
    if (XOList[0] == XOList[1] && XOList[0] == XOList[2] && XOList[0] != '') {
      serResult(XOList[0], 'winner is ' + XOList[0]);
      return;
    }
    if (XOList[3] == XOList[4] && XOList[3] == XOList[5] && XOList[3] != '') {
      serResult(XOList[3], 'winner is ' + XOList[3]);

      return;
    }
    if (XOList[6] == XOList[7] && XOList[6] == XOList[8] && XOList[6] != '') {
      serResult(XOList[6], 'winner is ' + XOList[6]);

      return;
    }
    if (XOList[0] == XOList[3] && XOList[0] == XOList[6] && XOList[0] != '') {
      serResult(XOList[0], 'winner is ' + XOList[0]);

      return;
    }
    if (XOList[1] == XOList[4] && XOList[1] == XOList[7] && XOList[1] != '') {
      serResult(XOList[1], 'winner is ' + XOList[1]);

      return;
    }
    if (XOList[2] == XOList[5] && XOList[2] == XOList[8] && XOList[2] != '') {
      serResult(XOList[2], 'winner is ' + XOList[2]);

      return;
    }
    if (XOList[0] == XOList[4] && XOList[0] == XOList[8] && XOList[0] != '') {
      serResult(XOList[0], 'winner is ' + XOList[0]);

      return;
    }
    if (XOList[2] == XOList[4] && XOList[2] == XOList[6] && XOList[2] != '') {
      serResult(XOList[2], 'winner is ' + XOList[2]);

      return;
    }
    if (filledBoxes == 9) {
      serResult('', 'Draw');
    }
  }

  Widget getTurn() {
    return Text(
      isTurnO ? 'Turn O' : 'Turn X',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  void clearGame() {
    setState(() {
      for (var i = 0; i < XOList.length; i++) {
        XOList[i] = '';
      }
    });
  }

  void serResult(String winner, String title) {
    setState(() {
      gameHasResult = true;
      if (winner == 'X') {
        scoreX = scoreX + 1;
      } else if (winner == 'O') {
        scoreO = scoreO + 1;
      }
    });
  }
}
