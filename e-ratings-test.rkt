#lang racket/base

(require rackunit
         "elo-ratings.rkt")

;; Tests
;; Expected Score tests
;; Players of the same rating should have an equal chance of winning, i.e 0.5
(check-=
 (expected-score 1500 1500)
 0.5 0.1)
;; Players with 100 points higher rating are expected to win ~64% of the time
(check-=
 (expected-score 1500 1400)
 0.64 0.1)
;; Players with 200 points higher rating are expected to win ~78% of the time
(check-=
 (expected-score 1500 1300)
 0.75 0.1)
;; Players with 400 points higher rating are expected to win ~90% of the time
(check-=
 (expected-score 1500 1100)
 0.9 0.1)

;; Rating Update tests
;; The rating of a player who wins a match should increase

;; The rating of a player who wins against the weakest opposition should
;; increase to a maximum of K-factor
(check-eqv?
 (update-rating 1500 0.01 1) 1532.0)
;; The rating of a player who wins against 0.25 odds should increase by 24
(check-eqv?
 (update-rating 1500 0.25 1) 1524.0)
;; The rating of a player who wins against even odds (0.5) should increase by 16
(check-eqv?
 (update-rating 1500 0.5 1) 1516.0)
;; The rating of a player who wins against better odds (0.75) should increase by 8
(check-eqv?
 (update-rating 1500 0.75 1) 1508.0)


;; The rating of a player who loses a match should decrease
;; The rating of a player who wins should be zero-sum with the rating of the
;; one who loses that match

