# SimpleBetTest

This project solves the SimpleBet test requirements, in Flutter.

## Getting Started

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## How to run

I implemented the test using iPhone 11 Pro Max.

The first screen is a calendar, which allows you to choose a day which games could have
occured.

Once you choose a day, the next screen will give you a list of games that occured on that date.
Select a game and it will bring you to the third screen.

The third screen will show the summary, linescore and statistcs for the hitters that were at bat
for the team and pitchers who pitched in the game.

### Requirments
* Internet Connection
* Mac with Flutter installed.

### Extras

The bash shell `bin/process_icon_images.sh` will download the baseball 
logo's, make them all use the png format, resize and convert them to gray scale.
The teams that are available are based on the team names
and league names the MLB api lists using the `https://statsapi.mlb.com/api/v1/teams` endpoint.


