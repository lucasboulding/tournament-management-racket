#lang racket

(call-with-input-file "test_match_results.csv"
  (lambda (in)
    (read-line in)))


#|;This function closes the file after exiting the scope of the call,
; a context manager, like with open in Python3
(call-with-output-file "call-with.txt"
  #:exists 'append
  (lambda (out)
(display "text in a file" out)))
|#

#|
(define out (open-output-file "data.csv"))
(display "hello" out)
(close-output-port out)
|#


