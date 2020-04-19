#lang racket/base


;; We use whole integers to represent a player's Elo rating.
;; We use a decimal between 0 and 1 to represent a player's expected score.


;; rating-power: Number -> Number
;; rating-power is a sub-function used to determine expected-score. It
;; takes in a player-rating and outputs a number.
(define (rating-power player-rating)
  (expt 10 (/ player-rating 400)))


;; Number -> Number
;; This function takes two player's Elo ratings as integers and returns
;; player a's expected score. Note, by simply inputting player-a and player-b
;; in the opposite variables, this function will calculate the other player's
;; expected score without the need of additional functions.
(define (expected-score player-a player-b)
  (/ (rating-power player-a) (+ (rating-power player-a) (rating-power player-b))))


;; Number -> Number
;; This function takes the initial rating of a player, the expected score of
;; that player against their opponent, and the actual score of the player in
;; the match against that opponent. The output is the player's new rating.
(define (update-rating initial-rating expected-score actual-score)
  (round (+ initial-rating (* 32 (- actual-score expected-score)))))


;; Number -> Number
;; This function tries to adapt the Elo rating system to account for
;; the margin by which teams were victorious, the idea being that
;; a more significant victory is a better performance than a more marginal
;; victory. It takes in the points difference and use a natural logarithm
;; to make a larger number of points significant, but doesn't punish teams
;; much more once it reaches a certain threshold.
(define (margin-of-victory-mod points-difference)
  (log (abs (+ points-difference 1))))


;; Number, Number -> Number
;; This function attempts to combat the autocorrelation problem-
;; I don't have a full handle on this problem myself, but it adjusts the
;; size of k to mean that it is larger when the underdog wins and smaller when
;; the favourite wins.
(define (autocorrelation-mod winners-elo losers-elo)
  (/ 2.2 (+ (* (- winners-elo losers-elo) 0.001) 2.2)))


;; This updated function, the FiveThirtyEight function, uses both the
;; margin-of-victory-mod and the autocorrelation-mod to attribute a greater
;; or lesser number of ratings points, depending on the game.
(define (fte-update-w-rating w-initial-rating l-initial-rating expected-score actual-score points-difference)
  (round (+ w-initial-rating (* 32 (- actual-score expected-score) (margin-of-victory-mod points-difference) (autocorrelation-mod w-initial-rating l-initial-rating)))))

(provide expected-score
         update-rating
         fte-update-w-rating)