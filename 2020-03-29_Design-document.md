---
author: Lucas Boulding
title: Swiss Tournament Manager
---


# Preamble

This project has come about because I suddenly became interested in how tournaments decide who the most skilled player is. I have always assumed that this is what tournaments are for — to show who the best player is — but in a knockout tournament this isn't necessarily what we get. What we get from such tournaments is a player who beat everyone they came up against, which isn't necessarily the same thing as the most skilled. Maybe the schedule paired two sets of really strong teams against each other in the first round, knocking out the strongest player in an upset match.


This is all by the by. What I want to try to do here is to create a piece of software that I could use to create a tournament with the following ambitions or constraints: 

- **Fair to all participants**: this means that they play the opponents closest to them in skill
- **Fun for all participants**: this means that players get exciting games in which either could win
- **As many games for each player as possible**: rather than eliminate players, all players should get to continue to play until the tournament ends
- **Variety of games**: each participant should play each other participant no more than once. 
- **Evaluate a winner**: the tournament should result in a winner, and a ranking of all other players

This, it seems to me, is what constitutes the definition of a friendly tournament, one where the majority of participants get to play the game they like, get good matches in, improve through practice, and determine where they fall within the group. In this tournament, everyone stands to gain by playing.  


To this end, I want to implement a Swiss tournament management tool in Python and simultaneously in Racket as a learning exercise. First this should just implement the necessary tools to run it from DrRacket. Then maybe a command line utility, and then maybe a GUI to run it. That would be great. 



# Assumptions

Basic: 

Matches in the tournament are "head-to-head", i.e. 1 vs 1, and not  1 v 1 v 1, doubles, or a complex team game. If the match is based on two teams competing, they could be represented as "players" without issue. So Mark vs Jeremy would work, but so too would "Rangers" vs "Hipsters" — in this latter case, though, the accuracy of the rating is likely to be lower.


The program is intended to work for rated players; however, if ratings are not available for any players, then the players should be seeded into random order. Should some players have a rating and some not, new players should be seeded at a rating of 800. Should there be any ties in rating, players should be seeded alphabetically. 


There can be an even or odd number of competitors in the tournament. If there are an odd number in a round, then the lowest rated player will be given a bye. No player will receive more than one bye. Competitors should be able to drop out of the tournament as play proceeds, and be added back in. Decisions to allow competitors to drop out and return should be made by tournament organisers, and the system should be able to implement their decision either way — maybe at a serious competition if you have to leave you can't rejoin, but in a more casual competition you might be allowed to jump back in. 


I will be implementing my current understanding of the Monrad pairing system, used by a number of Nordic Chess federations, though there are limited English language resources on this form of pairing, and this implementation may depart from the systems used in those federations. The Monrad pairing system always matches the closest skilled pair that it can, starting from the highest rated seed. That means that in the first round the pairings will be as follows: 1 v 2, 3 v 4, 5 v 6, ... n v n+1. This is seen as a weakness by some, who want the tournament to "build up" to the big clash between the top two rated seeds. However, all seeds will get closer games throughout the tournament if they are always matched to those closest to their skill level, meaning that play throughout the tournament should be more exciting for most players and for most spectators. 



*I will be implementing the Dutch system, in which the field is sorted by rating and then divided in half. The top seed of the top half is paired against the top seed of the bottom half; the second seed of the top half against the second seed of the bottom half, and so on. For example, in an eight player tournament, seed 1 will player seed 5, and seed 2 will play seed 6. I have reservations about the fairness of this system, but it is a commonly implemented version so a good base case — adjustments or alternatives can be implemented once the script is set up.*





There should be a minimum number of players, call it five. 

Ideally it would be great to have player data persist, so that we could look at their performance over several tournaments. 

Starting: 


In the first round, there will be more than 
