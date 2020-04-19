# README tournament-management-racket

## Preamble

I am a hobbyist programmer (in Python thus far) and this project is my first real outing into Racket. I've tried to get into Racket several times before, including using Realms of Racket and so on, but it hasn't taken. Instead, I want to try to use the approach which got me going in Python, which is to identify a project and keep bashing away at it until I get it to work, hopefully learning many new and interesting things in the process of breaking everything repeatedly. 

## Outline of project

What I would like to make is a suite of simple tournament management tools in Racket. First I would build them to run through DrRacket, then through the command line, and then (maybe) through a GUI. My operating assumptions are:

- that the tournament manager is embedded in a community of players who are interested in tournament-type play, so are happy to share their match information with the manager. Each competitor will be rated, using a simple implementation of the Elo system.
- the tournaments will be run using a variant of the Swiss system, which means that players will all get to play throughout the tournament, one of the most important benefits of the system. Secondly I'll be implementing Monrad pairing rather than Dutch pairing, because this does the best job of matching you to players of your own level, and therefore makes for the largest number of interesting games to take part in (and also to watch). 

I am not sure about what the ultimate shape of the tools will be; I have already made a script to evaluate Elo ratings changes, but it would be nice to have a script that could accept a batch of results and calculate the resulting Elo ratings for a whole group of players (say, tournament results). Assuming a group of regular players, it would also be nice to have a way of permanently storing all the results and the current Elo rating for each player. If this project were to get more complicated, maybe it would be nice to share these (either by emailing the updated result, or by having a website which players could access to see their ratings). One existing Monrad tool calculates the tournament structure in batches, so you effectively run the program each time a round is completed and it outputs the new results. This seems like a good

