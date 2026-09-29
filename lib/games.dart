
import 'dart:math';
import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

// ================= HOME PAGE =================

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF070B14),
      appBar: AppBar(
        title: const Text(
          'GAME arena',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF0D1220),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF070B14),
              Color(0xFF111827),
              Color(0xFF170D2B),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Icon(
                Icons.sports_esports_rounded,
                size: 55,
                color: Color(0xFF8B5CF6),
              ),
              const SizedBox(height: 12),
              const Text(
                'Welcome to Game Arena',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Choose your game',
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 30),

              // GAME 01 - TIC TAC TOE
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TicTacToe(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF1E1B4B),
                        Color(0xFF312E81),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: const Color(0xFF6366F1),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.indigo.withOpacity(0.25),
                        blurRadius: 12,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.grid_3x3,
                        color: Colors.amberAccent,
                        size: 35,
                      ),
                      const SizedBox(width: 18),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'GAME 01',
                              style: TextStyle(
                                color: Colors.amberAccent,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Tic Tac Toe',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Play against computer',
                              style: TextStyle(
                                color: Colors.white60,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.amberAccent,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // GAME 02 - ROCK PAPER SCISSORS
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RockPaperScissors(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF3B0764),
                        Color(0xFF6D28D9),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: const Color(0xFFA855F7),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.withOpacity(0.25),
                        blurRadius: 12,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.sports_esports_rounded,
                        color: Colors.pinkAccent,
                        size: 35,
                      ),
                      const SizedBox(width: 18),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'GAME 02',
                              style: TextStyle(
                                color: Colors.pinkAccent,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Rock Paper Scissors',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Choose your move',
                              style: TextStyle(
                                color: Colors.white60,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.pinkAccent,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // GAME 03 - GUESS THE NUMBER
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GuessNumber(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF064E3B),
                        Color(0xFF047857),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: const Color(0xFF2DD4BF),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.teal.withOpacity(0.25),
                        blurRadius: 12,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.question_mark_rounded,
                        color: Colors.tealAccent,
                        size: 35,
                      ),
                      const SizedBox(width: 18),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'GAME 03',
                              style: TextStyle(
                                color: Colors.tealAccent,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Guess the Number',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Find the secret number',
                              style: TextStyle(
                                color: Colors.white60,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.tealAccent,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),




              const SizedBox(height: 30),

              const Text(
                'Have fun playing!',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 13,
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// ================= TIC TAC TOE =================

class TicTacToe extends StatefulWidget {
  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {

  List<String> board = List.filled(9, '');
  String winner = '';

  void play(int index) {

    if (board[index] != '' || winner != '') return;

    setState(() {

      board[index] = 'X';
      checkWinner();

      if (winner == '') {

        List<int> empty = [];

        for (int i = 0; i < 9; i++) {
          if (board[i] == '') empty.add(i);
        }

        if (empty.isNotEmpty) {
          int move = empty[Random().nextInt(empty.length)];
          board[move] = 'O';
          checkWinner();
        }

        if (winner == '' && !board.contains('')) {
          winner = 'Draw';
        }
      }

    });
  }

  void checkWinner() {

    List<List<int>> lines = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6],
    ];

    for (var line in lines) {

      if (board[line[0]] != '' &&
          board[line[0]] == board[line[1]] &&
          board[line[1]] == board[line[2]]) {

        winner = board[line[0]];
      }
    }
  }

  void reset() {
    setState(() {
      board = List.filled(9, '');
      winner = '';
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.indigo[50],

      appBar: AppBar(
        title: Text('Tic Tac Toe'),
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
        foregroundColor: Colors.white,
      ),

      body: Container(
        width: double.infinity,

        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.indigo[50]!,
              Colors.purple[50]!,
            ],
          ),
        ),

        child: Center(

          child: SingleChildScrollView(

            padding: EdgeInsets.all(20),

            child: Container(

              width: 350,
              padding: EdgeInsets.all(18),

              decoration: BoxDecoration(
                color: Colors.indigo[900],
                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(

                mainAxisSize: MainAxisSize.min,

                children: [

                  Text(
                    'TIC TAC TOE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    winner == ''
                        ? 'Your Turn (X)'
                        : winner == 'Draw'
                        ? 'Draw!'
                        : '$winner Wins!',

                    style: TextStyle(
                      color: Colors.amber[200],
                      fontSize: 17,
                    ),
                  ),

                  SizedBox(height: 20),

                  GridView.builder(

                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 9,

                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),

                    itemBuilder: (context, index) {

                      return ElevatedButton(

                        onPressed: () {
                          play(index);
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown[50],
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),

                        child: Text(
                          board[index],
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: board[index] == 'X'
                                ? Colors.deepOrange
                                : Colors.indigo[900],
                          ),
                        ),

                      );
                    },
                  ),

                  SizedBox(height: 20),

                  Row(
                    children: [

                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    RockPaperScissors(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber[700],
                            foregroundColor: Colors.white,
                          ),
                          child: Text('Next Game'),
                        ),
                      ),

                      SizedBox(width: 10),

                      Expanded(
                        child: ElevatedButton(
                          onPressed: reset,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.indigo[900],
                          ),
                          child: Text('Reset'),
                        ),
                      ),

                    ],
                  ),

                  SizedBox(height: 12),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey[700],
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 45),
                    ),
                    child: Text('Home'),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ================= ROCK PAPER SCISSORS =================

class RockPaperScissors extends StatefulWidget {
  @override
  State<RockPaperScissors> createState() => _RockPaperScissorsState();
}

class _RockPaperScissorsState extends State<RockPaperScissors> {

  String player = '';
  String computer = '';
  String result = 'Choose your move';

  List<String> choices = ['Rock', 'Paper', 'Scissors'];

  void play(String choice) {

    String c = choices[Random().nextInt(3)];
    String r = '';

    if (choice == c) {
      r = 'Draw!';
    } else if (
    choice == 'Rock' && c == 'Scissors' ||
        choice == 'Paper' && c == 'Rock' ||
        choice == 'Scissors' && c == 'Paper') {
      r = 'You Win!';
    } else {
      r = 'Computer Wins!';
    }

    setState(() {
      player = choice;
      computer = c;
      result = r;
    });
  }

  void reset() {
    setState(() {
      player = '';
      computer = '';
      result = 'Choose your move';
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.purple[50],

      appBar: AppBar(
        title: Text('Rock Paper Scissors'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[700],
        foregroundColor: Colors.white,
      ),

      body: Container(

        width: double.infinity,

        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple[50]!,
              Colors.pink[50]!,
            ],
          ),
        ),

        child: Center(

          child: SingleChildScrollView(

            padding: EdgeInsets.all(20),

            child: Container(

              width: 350,
              padding: EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.deepPurple[700],
                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(

                mainAxisSize: MainAxisSize.min,

                children: [

                  Text(
                    'ROCK PAPER SCISSORS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 20),

                  Text(
                    'You: $player',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    'Computer: $computer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),

                  SizedBox(height: 18),

                  Text(
                    result,
                    style: TextStyle(
                      color: Colors.pink[100],
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 25),

                  ElevatedButton(
                    onPressed: () {
                      play('Rock');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 45),
                    ),
                    child: Text('Rock'),
                  ),

                  SizedBox(height: 12),

                  ElevatedButton(
                    onPressed: () {
                      play('Paper');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 45),
                    ),
                    child: Text('Paper'),
                  ),

                  SizedBox(height: 12),

                  ElevatedButton(
                    onPressed: () {
                      play('Scissors');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 45),
                    ),
                    child: Text('Scissors'),
                  ),

                  SizedBox(height: 22),

                  Row(
                    children: [

                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GuessNumber(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber[700],
                            foregroundColor: Colors.white,
                          ),
                          child: Text('Next Game'),
                        ),
                      ),

                      SizedBox(width: 10),

                      Expanded(
                        child: ElevatedButton(
                          onPressed: reset,
                          child: Text('Reset'),
                        ),
                      ),

                    ],
                  ),

                  SizedBox(height: 12),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple[900],
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 45),
                    ),
                    child: Text('Home'),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ================= GUESS THE NUMBER =================

class GuessNumber extends StatefulWidget {
  @override
  State<GuessNumber> createState() => _GuessNumberState();
}

class _GuessNumberState extends State<GuessNumber> {

  TextEditingController number = TextEditingController();

  int answer = Random().nextInt(10) + 1;

  String result = 'Guess a number from 1 to 10';

  void check() {

    int guess = int.tryParse(number.text) ?? 0;

    setState(() {

      if (guess < 1 || guess > 10) {
        result = 'Enter a number from 1 to 10';
      } else if (guess == answer) {
        result = 'Correct! You Win!';
      } else if (guess < answer) {
        result = 'Too Low!';
      } else {
        result = 'Too High!';
      }

    });
  }

  void reset() {

    setState(() {
      answer = Random().nextInt(10) + 1;
      number.clear();
      result = 'Guess a number from 1 to 10';
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.teal[50],

      appBar: AppBar(
        title: Text('Guess the Number'),
        centerTitle: true,
        backgroundColor: Colors.teal[800],
        foregroundColor: Colors.white,
      ),

      body: Container(

        width: double.infinity,

        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.teal[50]!,
              Colors.green[50]!,
            ],
          ),
        ),

        child: Center(

          child: SingleChildScrollView(

            padding: EdgeInsets.all(20),

            child: Container(

              width: 350,
              padding: EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.teal[800],
                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(

                mainAxisSize: MainAxisSize.min,

                children: [

                  Text(
                    'GUESS THE NUMBER',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 20),

                  Text(
                    'Enter a number from 1 to 10',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),

                  SizedBox(height: 18),

                  TextField(

                    controller: number,

                    keyboardType: TextInputType.number,

                    textAlign: TextAlign.center,

                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),

                  ),

                  SizedBox(height: 15),

                  ElevatedButton(
                    onPressed: check,
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 45),
                      backgroundColor: Colors.amber[700],
                      foregroundColor: Colors.white,
                    ),
                    child: Text('Guess'),
                  ),

                  SizedBox(height: 20),

                  Text(
                    result,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.tealAccent[100],
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 22),

                  ElevatedButton(
                    onPressed: reset,
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 45),
                    ),
                    child: Text('Reset'),
                  ),

                  SizedBox(height: 12),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[900],
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 45),
                    ),
                    child: Text('Home'),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

