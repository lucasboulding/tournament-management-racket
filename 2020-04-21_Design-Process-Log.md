---
author: Lucas Boulding
title: Design Process Log
date: 2020-04-21
---

# Preamble

This log outlines the thinking behind my code. This form of documentation can prove invaluable for troubleshooting, but it's primary function is to assist in my learning. In some senses it's like a verbose git commit, except that it includes my thinking process as well as actual technical detail. It will include theories about how I think things work, as well as plans, goals, attempts, and failures. 

# Log

## 2020-04-21 

The Elo rating script does not work as I had envisaged; instead of specifying that the ratings should be input on the command line in the order "winner loser", you have to type the flag each time. This means typing more when entering commands, and I think it is unnecessary.  I suspect that this could be fixed by changing the program to use the "args" section of the command line function, which would then make the values available.


A second thing that I don't know how to do is specify that if one of the values entered for "winner" and "loser" is not entered, it should default to our baseline Elo for new players of 800. 


On fiddling about writing some more documentation about how it currently works, I notice that running the command `racket elo-rating-cli.rkt` without supplying additional arguments returns what I would expect for a match of 800 vs 800. 


Let's assume that the next milestone is to be able to read in a CSV of match results, which supplies the winner and loser ratings and the result of the match on each line. What this version of the script should return is a list of winner's and loser's ratings for each match, which corresponds to their original input position (so that no one will get confused). It might be better to be able to link a name or ID to each player so that the ratings can be followed clearly, but this may add a level of complexity I'm not ready to deal with yet.    


I also think that it might be a good idea to have the script echo back the ratings entered for each player, so that the change is visually represented and the user has the opportunity to notice they've made a typo or a mistake of some kind. 
