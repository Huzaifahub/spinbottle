#  Flutter Truth or Dare Game
## 🎯 Overview
Welcome to the Flutter Truth or Dare Game! This interactive application brings the classic party game to your fingertips, perfect for gatherings with friends and family. Spin the virtual bottle to randomly select players and challenge them with fun truth questions or daring tasks. With a sleek and user-friendly interface, this app guarantees hours of entertainment!

## ✨ Features
## Player Selection: 
Add player names and build a player pool dynamically.
## Interactive Gameplay:
Tap to spin the bottle, which randomly selects a player.
## Truth or Dare Challenges: 
Players receive random truth or dare prompts, with diverse and fun challenges to keep the game interesting.
## Visuals and Animations: 
Smooth animations for the bottle spinning, with dynamic player selection based on the bottle's rotation.
## Customizable:
Add new truth questions or dare challenges by easily modifying the code.
## 📸 Screenshots
<img width="781" alt="spin3" src="https://github.com/user-attachments/assets/760c43a3-5b5e-490d-a4d9-7e72993da54f">

<img width="782" alt="spin4" src="https://github.com/user-attachments/assets/f7ffda39-98fd-47ad-8834-5a0cc66cdea9">

<img width="780" alt="spin1" src="https://github.com/user-attachments/assets/2bda7f45-ab31-4ab8-aef7-0baa68857bb0">

<img width="780" alt="spin2" src="https://github.com/user-attachments/assets/22542c81-18a9-4c2e-8ef3-a8aa3a37d87c">


## 🕹️ How to Play
# Add Players: 
Start by entering the names of the participants. After each name, click the "+" button to add them to the list. Repeat this step for each player.
# Start the Game:
Once you've added at least two players, press the "Start Game" button to proceed.
# Spin the Bottle:
On the game screen, tap the bottle to spin it. The bottle will randomly stop and select one player from the group.
# Receive a Truth or Dare:
After the bottle selects a player, a dialog will pop up with a random truth or dare for the selected player to complete.
# Continue Playing: 
Once the player finishes their challenge, spin the bottle again to select the next player.
## 📚 Code Overview
# main.dart:
The entry point of the application that sets up the app and navigation.
# PlayerSelectionPage: 
A stateful widget that handles player name input and displays the list of selected players.
# Homepage:
A stateful widget that manages the game logic, including spinning the bottle and displaying truth or dare prompts.
# Animation:
Utilizes Flutter's animation framework to create a smooth spinning effect for the bottle.

# Important Classes and Methods:
# PlayerSelectionPage:

addPlayer(): 
Adds a new player to the list and ensures uniqueness.
build(): 
Constructs the UI for the player selection screen, including text fields and buttons.
# Homepage:

spinTheBottle(): 
Triggers the bottle spinning animation.
selectPlayerBasedOnAngle():
Determines the player based on the final angle of the bottle.
showTruthOrDareDialog():
Displays a dialog with the selected player’s truth or dare prompt.

# 🖼️ Assets
# Bottle Image: 
Ensure your bottle.png image is located in the assets directory.
# Background Image: 
Add a background image floor.jpg in the assets directory for a visually appealing interface.
assets:
  - assets/bottle.png
  - assets/floor.jpg

# 🤝 Contributing
Contributions are highly encouraged! Whether you’d like to improve the gameplay, add new features, or simply fix a bug, please feel free to submit a pull request. Before contributing, make sure to follow these steps:

Fork the repository.
Create a new branch
(git checkout -b feature-branch).
Commit your changes
(git commit -m 'Add new feature').
Push to the branch
(git push origin feature-branch).
Open a pull request.

# 🌟 Thank you for checking out this project! 
If you found this helpful or fun, please give it a ⭐ on GitHub. Feel free to share your own improvements or ideas.
