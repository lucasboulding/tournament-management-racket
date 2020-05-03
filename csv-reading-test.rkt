#lang racket
(require csv-reading)

(define make-results-csv-reader
  (make-csv-reader-maker
   '((separator-chars #\;))))

(define next-row
  (make-results-csv-reader (open-input-file "test_match_results.csv")))

(csv->list (make-results-csv-reader (open-input-file "test_match_results.csv")))

