import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp1());
}

class MyApp1 extends StatelessWidget {
  const MyApp1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PlayerSelectionPage(),
    );
  }
}

// Player selection screen
class PlayerSelectionPage extends StatefulWidget {
  const PlayerSelectionPage({super.key});

  @override
  State<PlayerSelectionPage> createState() => _PlayerSelectionPageState();
}

class _PlayerSelectionPageState extends State<PlayerSelectionPage> {
  final List<String> selectedPlayers = [];
  final TextEditingController playerNameController = TextEditingController();

  @override
  void dispose() {
    playerNameController.dispose();
    super.dispose();
  }

  void addPlayer() {
    String newPlayer = playerNameController.text.trim();
    if (newPlayer.isNotEmpty && !selectedPlayers.contains(newPlayer)) {
      setState(() {
        selectedPlayers.add(newPlayer);
      });
    }
    playerNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Players"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: playerNameController,
                    decoration: const InputDecoration(
                      labelText: "Enter Player Name",
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: addPlayer,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: selectedPlayers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(selectedPlayers[index]),
                  trailing: Checkbox(
                    value: true,
                    onChanged: null,
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: selectedPlayers.length >= 2
                ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Homepage(players: selectedPlayers),
                ),
              );
            }
                : null,
            child: const Text("Start Game"),
          ),
        ],
      ),
    );
  }
}

class Homepage extends StatefulWidget {
  final List<String> players;

  const Homepage({super.key, required this.players});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  var lastPosition = 0.0;
  var random = Random();
  late AnimationController animationController;

  final List<String> truthSentences = [
    "What is your biggest fear?",
    "Who is your secret crush?",
    "Have you ever lied to your best friend?",
    "What's the most embarrassing thing you've done?"
  ];

  final List<String> dareSentences = [
    "Do 20 pushups.",
    "Dance without music for 2 minutes.",
    "Let someone draw on your face.",
    "Do a silly walk across the room."
  ];

  int selectedPlayerIndex = -1;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        selectPlayerBasedOnAngle();
        showTruthOrDareDialog();
      }
    });
  }

  void spinTheBottle() {
    setState(() {
      if (animationController.isCompleted) {
        animationController.reset();
      }
      animationController.forward();
    });
  }

  void selectPlayerBasedOnAngle() {
    double finalRotation = (lastPosition % (2 * pi)); // Get the final angle
    double sliceAngle = (2 * pi) / widget.players.length; // Angle per player

    // Determine which player corresponds to the final rotation angle
    setState(() {
      selectedPlayerIndex = ((finalRotation + sliceAngle / 2) ~/ sliceAngle) % widget.players.length;
    });
  }

  void showTruthOrDareDialog() {
    bool isTruth = random.nextBool();
    String selectedSentence = isTruth
        ? truthSentences[random.nextInt(truthSentences.length)]
        : dareSentences[random.nextInt(dareSentences.length)];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("${widget.players[selectedPlayerIndex]}'s Turn - ${isTruth ? "Truth" : "Dare"}"),
          content: Text(selectedSentence),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildPlayerCircle() {
    return Stack(
      children: List.generate(widget.players.length, (index) {
        double angle = 2 * pi * index / widget.players.length;
        double radius = 150.0;

        return Positioned(
          left: MediaQuery.of(context).size.width / 2 + radius * cos(angle) - 40,
          top: MediaQuery.of(context).size.height / 2 + radius * sin(angle) - 40,
          child: Text(
            widget.players[index],
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: selectedPlayerIndex == index ? Colors.red : Colors.black,
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              "asset/floor.jpg",
              fit: BoxFit.fill,
            ),
          ),
          buildPlayerCircle(),
          Center(
            child: RotationTransition(
              turns: Tween(begin: lastPosition, end: getRandomNumber()).animate(
                CurvedAnimation(
                  parent: animationController,
                  curve: Curves.linear,
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  spinTheBottle();
                },
                child: Image.asset(
                  "asset/bottle.png",
                  width: 250,
                  height: 250,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  double getRandomNumber() {
    lastPosition += random.nextDouble() * 10 + 10;
    return lastPosition;
  }
}
