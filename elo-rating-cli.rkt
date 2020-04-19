#! /usr/bin/env racket
#lang racket

(require "elo-ratings.rkt")


; This makes the default values of the parameters.
; At present these defaults cannot actually be called,
; as the CLI will refuse to proceed with just flags.
; When run through DrRacket, these values are used.
(define winner-rating (make-parameter 800))
(define loser-rating (make-parameter 800))


; It is not necessary to call this function explicitly. It maps the
; input arguments from the CLI into the program so the values can
; be referenced. 
(define rating-calculator
  (command-line
   #:usage-help
   "This script takes a winner and a loser's rating and "
   "returns the new ratings for both players."

   #:once-each
   [("-w" "--winner-rating") WINNER-RATING
                             "The winner's initial Elo rating"
                             (winner-rating (string->number WINNER-RATING))]
   [("-l" "--loser-rating") LOSER-RATING
                            "The loser's initial Elo rating"
                            (loser-rating (string->number LOSER-RATING))]

   #:args ()
    (void)))



; This section avoids an error I was getting, where winner-rating and loser-rating
; were being read as procedures, not values. This makes things clearer by
; evaluating the ratings changes to a variable that can then be passed to the
; output.
; N.B. This assumes a game where the outcomes are recorded as victories (1),
; and losses (0). 
(define winner (update-rating (winner-rating) (expected-score (winner-rating) (loser-rating)) 1))
(define loser (update-rating (loser-rating) (expected-score (loser-rating) (winner-rating)) 0))


(printf "~a\n" (string-append "Winner's Elo: " (number->string winner)))
(printf "~a\n" (string-append "Loser's Elo: " (number->string loser)))