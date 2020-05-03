#! /usr/bin/env racket
#lang racket

(require "elo-ratings.rkt")
; imports update-rating function

#|

The idea for this iteration of this script is to function when run through
DrRacket. I have included some pointers about what features might be desireable
if it were to be run on the command line.

|#


#|
;; TODO read in file of match results, providing winner-rating and loser-rating
;; so that they can be used in the winner and loser functions. These will be in
;; a CSV, with columns
;; approximating "Winner's Name", "Winner's Rating", "Loser's Name",
;; "Loser's Rating". If this was intended to process multiple rounds of
;; Swiss, this might have to be reconfigured, but if only a single round
;; of results are processed at a time the same competitor shouldn't appear
;; in multiple places in the same round. 
|#


#|
;; Because in this game there can only be a winner and a loser, the match
;; outcomes will be 1 or 0, therefore it is only necessary to input
;; the Elo ratings in the correct order to determine the new ratings for
;; either the winner or the loser because the outcome can be hard coded.
|#

; Takes two inputs, winner-rating and loser-rating and returns updated
; Elo rating for the winner
(define winner (update-rating (winner-rating) (expected-score (winner-rating) (loser-rating)) 1))
; Takes two inputs, loser-rating and winner-rating and returns updated
; Elo rating for the loser
(define loser (update-rating (loser-rating) (expected-score (loser-rating) (winner-rating)) 0))


#|
TODO output
This script should produce a file which lists the updated Elo ratings
for all the players involved. Since each player will only play one game
per round, there should not be duplicated players. It might be practical
to use a date-stamped name for the output so that it will not overwrite
any existing data, allowing for re-tracing the Elo rating if something goes
wrong or the system is challeneged. 

Conceivably, if this was batch called from the command line, it would
be desireable to have it print the updated Elo ratings to the terminal
in addition to the file output. 
|#

