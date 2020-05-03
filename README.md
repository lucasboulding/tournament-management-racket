# README tournament-management-racket

## Preamble

I am a hobbyist programmer (in Python thus far) and this project is my first real outing into Racket. I've tried to get into Racket several times before, including using _Realms of Racket_ and so on, but it hasn't taken. Instead, I want to try to use the approach which got me going in Python, which is to identify a project and keep bashing away at it until I get it to work, hopefully learning many new and interesting things in the process of breaking everything repeatedly. 


What I would like to make is a suite of simple tournament management tools in Racket. First I would build them to run through DrRacket, then through the command line, and then (maybe) through a GUI. There are two tools I would like to focus on: an Elo ratings system, and a Swiss tournament manager (using Monrad pairing). I have decided to develop both simultaneously because the Swiss-Monrad system depends on ratings for sustained use. 


I could try to make the tools "game agnostic", but one of the aims of this exercise is to learn to make a tailored system that responds to the eccentrities of a given game. To that end, I will be picking traditional pub card game Cribbage for the purposes of this project (specifically [six card cribbage](https://www.pagat.com/adders/crib6.html) for two players). It's a low-stakes game, and as far as I am aware there isn't a dedicated tournament solution available.


I am not sure about what the ultimate shape of the tools will be; I have already made a script to evaluate Elo ratings changes, but it would be nice to have a script that could accept a batch of results and calculate the resulting Elo ratings for a whole group of players (say, tournament results). Assuming a group of regular players, it would also be nice to have a way of permanently storing all the results and the current Elo rating for each player. 


If this project were to get more complicated, maybe it would be nice to share these (either by emailing the updated result, or by having a website which players could access to see their ratings).


## Installation

Currently this is not setup for usage by third parties. It is a handful of racket files which can be run in DrRacket.

## Usage

These scripts assume that you have Racket installed, and they were developed on Ubuntu 16.04. They have not been tested in any other environments.

### elo-ratings.rkt 

This script includes functions that can be used to calculate the updated Elo rating of two players when supplied with their initial Elo ratings and the match outcome. 


If the script is run in DrRacket, the functions can be called with appropriate arguments in the interactions buffer. For instance, to update a player's rating, call the function `update-rating` as in the following example `(update-rating 800 0.5 1)` which describes a player with a rating of 800 playing an equally rated player and winning. This returns a rating of 816, what we would expect for the established *k*-factor of 32. If this player had instead lost, their updated rating would return 784.


This script also includes a second way of creating an Elo rating which considers two additional factors: margin of victory and the autocorrelation problem. These are described by Nate Silver [here](https://fivethirtyeight.com/features/introducing-nfl-elo-ratings/). It is possible that these additional factors may increase the accuracy of Elo ratings for six card cribbage players, but I have not attempted to check that. This is one direction that this project might take in the future.



### elo-rating-cli.rkt

This script outputs the updated Elo ratings for the winner and loser of a match when provided with the existing ratings both players; if no arguments are provided, it assumes each player is rated at 800 points.  These values can then be recorded and the new ratings supplied to the players. 


It runs through the command line. Open the folder containing the script in the command line, and run `racket elo-rating-cli.rkt`. This should return 

```
Winner's Elo: 816
Loser's Elo: 784 
``` 

which is the base case of two evenly matched beginners (with default ratings of 800 each) playing one another. 


To input the values of the players, supply a winner (flagged with `-w`) and loser argument (flagged with `-l`). As an example, running `racket elo-rating-cli.rkt -w 1500 -l 1400` returns:

```
Winner's Elo: 1512.0
Loser's Elo: 1388.0
``` 

To see the help summary for this script, you can use the help function by running the command `racket elo-rating-cli.rkt -h`.


## Contributing


## License

