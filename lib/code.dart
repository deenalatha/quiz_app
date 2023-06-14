// import 'dart:async';

// import 'package:flutter/cupertino.dart';
import 'dart:async';

import 'package:flutter/material.dart';

import 'xlevel.dart';
// import 'xscore.dart';

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuizHomePage(),
    );
  }
}

class QuizHomePage extends StatefulWidget {
  const QuizHomePage({super.key});

  @override
  _QuizHomePageState createState() => _QuizHomePageState();
}

class _QuizHomePageState extends State<QuizHomePage> {
  int currentLevel = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Quiz App - Level $currentLevel'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Start Level $currentLevel'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QuizLevelPage(
                  level: currentLevel,
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.list),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LevelsScreen()),
          );
        },
      ),
    );
  }
}

class QuizLevelPage extends StatefulWidget {
  final int level;

  QuizLevelPage({required this.level});

  @override
  _QuizLevelPageState createState() => _QuizLevelPageState();
}

class _QuizLevelPageState extends State<QuizLevelPage> {
  int currentQuestion = 0;
  int secondsLeft = 10;
  int selectedOptionIndex = -1;
  late Timer timer;
  int score = 0;
  int total = 0;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (secondsLeft > 0) {
          secondsLeft--;
        } else {
          timer.cancel();

          goToNextQuestion();
        }
      });
    });
  }

  List<List<Map<String, dynamic>>> levels = [
    [
      {
        'question': 'Who created Flutter?',
        'options': ['Facebook', 'Adobe', 'Google', 'Microsoft'],
        'correctindex': 2,
      },
      {
        'question': 'What is Flutter?',
        'options': [
          'Android Development Kit',
          'iOS Development Kit',
          'Web Development Kit',
          'SDK to build beautiful iOS, Android, Web & Desktop Native Apps'
        ],
        'correctindex': 2,
      },
      {
        'question': 'Which programming language is used by Flutter?',
        'options': ['Ruby', 'Dart', 'C++', 'Kotlin'],
        'correctindex': 2,
      },
      {
        'question': 'Who created the Dart programming language?',
        'options': [
          'Lars Bak and Kasper Lund',
          'Brendan Eich',
          'Bjarne Stroustrup',
          'Jeremy Ashkenas'
        ],
        'correctindex': 2,
      },
      {
        'question':
            'Is Flutter for Web and Desktop available in a stable version?',
        'options': ['Yes', 'No'],
        'correctindex': 1,
      },
    ],
    // Level 2
    [
      {
        'question': 'What is the widget tree in Flutter?',
        'options': [
          'a) A data structure to store widgets',
          'b) A hierarchical representation of widgets',
          'c) A state management technique',
          'd) A layout algorithm',
        ],
        'correctindex': 2,
      },
      {
        'question': 'What is the hot reload feature in Flutter?',
        'options': [
          'a) A tool to reload the app without restarting it',
          'b) A way to update the UI without changing the code',
          'c) A mechanism to optimize app performance',
          'd) A debugging tool for finding errors',
        ],
        'correctindex': 2,
      },
      {
        'question': 'What is the purpose of the setState() method in Flutter?',
        'options': [
          'a) To rebuild the widget tree',
          'b) To update the app\'s state',
          'c) To handle user input',
          'd) To perform network requests',
        ],
        'correctindex': 2,
      },
      {
        'question': 'What is the default orientation of Flutter apps?',
        'options': [
          'a) Portrait',
          'b) Landscape',
          'c) Both portrait and landscape',
          'd) Depends on the device',
        ],
        'correctindex': 2,
      },
      {
        'question':
            'What is the purpose of the async and await keywords in Dart?',
        'options': [
          'a) To handle asynchronous operations',
          'b) To define class methods',
          'c) To handle exceptions',
          'd) To declare variables',
        ],
        'correctindex': 2,
      },
    ],
    // Level 3
    [
      {
        'question': 'How can you navigate to a new screen in Flutter?',
        'options': [
          'a) Using the navigateTo() method',
          'b) Using the push() method',
          'c) Using the goTo() function',
          'd) Using the open() function',
        ],
        'correctindex': 2,
      },
      {
        'question': 'What is a Flutter package?',
        'options': [
          'a) A collection of Dart files',
          'b) A pre-built user interface component',
          'c) A set of third-party libraries',
          'd) A folder containing assets',
        ],
        'correctindex': 2,
      },
      {
        'question': 'What is the purpose of the BuildContext class in Flutter?',
        'options': [
          'a) To define the layout of widgets',
          'b) To access inherited properties',
          'c) To handle user interactions',
          'd) To manage app state',
        ],
        'correctindex': 2,
      },
      {
        'question': 'How can you add interactivity to a Flutter widget?',
        'options': [
          'a) By using the setState() method',
          'b) By wrapping it with a GestureDetector',
          'c) By implementing the OnClick interface',
          'd) By using the interact() function',
        ],
        'correctindex': 2,
      },
      {
        'question': 'What is the purpose of the Scaffold widget in Flutter?',
        'options': [
          'a) To provide a basic app structure',
          'b) To define the app\'s color scheme',
          'c) To handle user input',
          'd) To perform network requests',
        ],
        'correctindex': 2,
      },
      // Add more questions for Level 3...
    ],
    // Level 4
    [
      {
        'question': 'What is the purpose of the flutter run command?',
        'options': [
          'a) To build the Flutter app',
          'b) To start the Flutter development server',
          'c) To run the Flutter app on a connected device or emulator',
          'd) To generate documentation for the Flutter project',
        ],
        'correctindex': 2,
      },
      {
        'question': 'What is the purpose of the ListView widget in Flutter?',
        'options': [
          'a) To display a list of items with scrolling',
          'b) To handle user input',
          'c) To create a grid layout',
          'd) To navigate between screens',
        ],
        'correctindex': 2,
      },
      {
        'question': 'What is the main function in a Flutter app?',
        'options': [
          'a) The entry point of the app',
          'b) The function that initializes the app\'s state',
          'c) The function that handles user interactions',
          'd) The function that defines the app\'s layout',
        ],
        'correctindex': 2,
      },
      {
        'question':
            'What is the purpose of the FutureBuilder widget in Flutter?',
        'options': [
          'a) To handle asynchronous operations',
          'b) To display loading and error states',
          'c) To create custom animations',
          'd) To manage app navigation',
        ],
        'correctindex': 2,
      },
      {
        'question': 'What is the purpose of the Expanded widget in Flutter?',
        'options': [
          'a) To make a widget fill the available space',
          'b) To control the layout of child widgets',
          'c) To handle user input',
          'd) To define animations',
        ],
        'correctindex': 2,
      },
      // Add more questions for Level 4...
    ],
    // Level 5
    [
      {
        'question': 'What is the purpose of the flutter doctor command?',
        'options': [
          'a) To check the health of Flutter installation',
          'b) To generate code documentation',
          'c) To format the Flutter codebase',
          'd) To create a new Flutter project',
        ],
        'correctindex': 2,
      },

      {
        'question':
            ' What is the difference between StatelessWidget and StatefulWidget in Flutter?',
        'options': [
          'a) StatelessWidget is used for static UI components, while StatefulWidget is used for dynamic UI components.',
          'b) StatelessWidget can be updated, while StatefulWidget is immutable.',
          'c) StatelessWidget has a state object, while StatefulWidget doesn\'t.',
          'd) There is no difference; both can be used interchangeably.',
        ],
        'correctindex': 2,
      },
      {
        'question':
            ' What is the purpose of the async and await keywords in asynchronous programming with Flutter?',
        'options': [
          'a) They define asynchronous methods in Flutter.',
          'b) They handle exceptions in Flutter.',
          'c) They control the flow of asynchronous operations in Flutter.',
          'd) They manage multi-threading in Flutter.',
        ],
        'correctindex': 2,
      },
      {
        'question': 'Q24. What is a Hero widget in Flutter used for?',
        'options': [
          'a) To create animations between screens or widgets.',
          'b) To handle touch events and gestures.',
          'c) To manage app navigation and routing.',
          'd) To display images and media files.',
        ],
        'correctindex': 2,
      },
      {
        'question': ' How can you persist data in a Flutter app?',
        'options': [
          'a) By using the SharedPreferences package.',
          'b) By storing data in a local database using SQLite.',
          'c) By using state management solutions like Provider or Bloc.',
          'd) All of the above.',
        ],
        'correctindex': 2,
      },
      // Add more questions for Level 5...
    ],
  ];

  int _calculateScore() {
    // print('correctOptionIndex ${correctOptionIndex}');
    print('score ${score}');
    int correctOptionIndex =
        levels[widget.level - 1][currentQuestion]['correctindex'];

    if (selectedOptionIndex == correctOptionIndex) {
      score = score + 10;
    }
    total = total + score;

    return score;
  }

  void goToNextQuestion() {
    total = _calculateScore();
    int score = total;

    if (currentQuestion < 4) {
      setState(() {
        currentQuestion++;
        secondsLeft = 10;
        selectedOptionIndex = -1;
      });
      startTimer();
    } else {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Level ${widget.level} Completed!'),
            content: Text('Your score for Level ${widget.level}: $score'),
            actions: [
              ElevatedButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  if (widget.level < 4) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizLevelPage(
                          level: widget.level + 1,
                        ),
                      ),
                    );
                  } else {
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          );
        },
      );
    }
  }

  void goToPreviousQuestion() {
    setState(() {
      currentQuestion--;
      secondsLeft = 10;
      selectedOptionIndex = -1;
    });
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    List<String> currentOptions =
        levels[widget.level - 1][currentQuestion]['options'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Level ${widget.level}'),
        actions: [
          Container(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: Image.asset(
                  'assets/logo.png',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Question ${currentQuestion + 1}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              levels[widget.level - 1][currentQuestion]['question'],
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              itemCount: currentOptions.length,
              itemBuilder: (context, index) {
                String option = currentOptions[index];
                return ListTile(
                  title: Text(option),
                  tileColor: selectedOptionIndex == index
                      ? Colors.black54
                      : Colors.white,
                  onTap: () {
                    print('index ${index}');
                    setState(() {
                      selectedOptionIndex = index;
                    });
                  },
                );
              },
            ),
            SizedBox(height: 20),
            Text(
              'Time left: $secondsLeft seconds',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text('Previous'),
                  onPressed: currentQuestion > 0 ? goToPreviousQuestion : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 1, 1, 1),
                  ),
                ),
                ElevatedButton(
                  child: Text('Next'),
                  onPressed:
                      selectedOptionIndex != -1 ? goToNextQuestion : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 1, 1, 1),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Quiz App',
    home: QuizLevelPage(level: 1),
  ));
}
