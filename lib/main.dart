
// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_print, sized_box_for_whitespace, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

void main() {
  runApp(basketball_points_counter());
}

// ignore: use_key_in_widget_constructors
class basketball_points_counter extends StatefulWidget {
  @override
  State<basketball_points_counter> createState() =>
      _basketball_points_counterState();
}

class _basketball_points_counterState extends State<basketball_points_counter> {
  int TeamA = 0;
  int TeamB = 0;
  final List<Map<String, int>> scoreHistory = [];

  void _addToScoreHistory(int receive_score, String team) {
    print('Adding score: teamA=$TeamA, teamB=$TeamB');
    scoreHistory.add({team: receive_score});
    print('Score history: $scoreHistory');
  }

  void _undo() {
    print('Undoing last score');
    print('score history : $scoreHistory');
    if (scoreHistory.isNotEmpty) {
      final previousScores = scoreHistory.last;
      print(previousScores.keys);
      if (previousScores.keys.first == 'teamA') {
        setState(() {
          TeamA = TeamA - previousScores['teamA']!;
        });
      } else {
        setState(() {
          TeamB = TeamB - previousScores['teamB']!;
        });
      }
      scoreHistory.removeLast();
      print('New score: TeamA=$TeamA, TeamB=$TeamB');
      print('Score history: $scoreHistory');
    } else {
      print('No score to undo');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text('Basketball Score'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Team A',
                        style: TextStyle(fontSize: 40),
                      ),
                      Text(
                        '$TeamA',
                        style: TextStyle(fontSize: 120),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            TeamA++;
                          });
                          _addToScoreHistory(1, 'teamA');
                        },
                        child: const Text(
                          '+1 Throw',
                          style: TextStyle(fontSize: 17),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.black,
                            minimumSize: Size(130, 40)),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            TeamA += 2;
                          });
                          _addToScoreHistory(2, 'teamA');
                        },
                        child: const Text(
                          '+2 Throw',
                          style: TextStyle(fontSize: 17),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.black,
                            minimumSize: Size(130, 40)),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            TeamA += 3;
                          });
                          _addToScoreHistory(3, 'teamA');
                        },
                        child: const Text(
                          '+3 Throw',
                          style: TextStyle(fontSize: 17),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.black,
                            minimumSize: Size(130, 40)),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 500,
                  child: VerticalDivider(
                    thickness: 1,
                    indent: 10,
                    endIndent: 5,
                  ),
                ),
                Container(
                  height: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Team B',
                        style: TextStyle(fontSize: 40),
                      ),
                      Text(
                        '$TeamB',
                        style: TextStyle(fontSize: 120),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            TeamB++;
                          });
                          _addToScoreHistory(1, 'teamB');
                        },
                        child: const Text(
                          '+1 Throw',
                          style: TextStyle(fontSize: 17),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.black,
                            minimumSize: Size(130, 40)),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            TeamB += 2;
                          });
                          _addToScoreHistory(2, 'teamB');
                        },
                        child: const Text(
                          '+2 Throw',
                          style: TextStyle(fontSize: 17),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.black,
                            minimumSize: Size(130, 40)),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            TeamB += 3;
                          });
                          _addToScoreHistory(3, 'teamB');
                        },
                        child: const Text(
                          '+3 Throw',
                          style: TextStyle(fontSize: 17),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.black,
                            minimumSize: Size(130, 40)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                _addToScoreHistory(0, 'teamA');
                _addToScoreHistory(0, 'teamB');
                setState(() {
                  TeamA = 0;
                  TeamB = 0;
                });
              },
              child: const Text(
                'Reset',
                style: TextStyle(fontSize: 17),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.black,
                  minimumSize: Size(110, 40)),
            ),
            ElevatedButton(
              onPressed: _undo,
              child: const Text(
                'undo',
                style: TextStyle(fontSize: 17),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.black,
                  minimumSize: Size(110, 40)),
            ),
          ],
        ),
      ),
    );
  }
}
