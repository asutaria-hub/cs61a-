
; Tail recursion

(define (replicate x n)
  (define (helper n i)
  	(if (= n 0)
  		i
  		(helper (- n 1) (cons x i))))
  (helper n nil))
 

(define (accumulate combiner start n term)
  (define (range n)
    (define (helper x)
      (if (> x n)
        nil
        (cons x (helper (+ 1 x)))))
    (helper 1))
  (define (reduce-b combiner lst b)
    (reduce combiner (cons b lst)))
  (reduce-b combiner (map term (range n)) start)
  )

(define (accumulate-tail combiner start n term)
  (define (helper x i)
  	(if (> x n)
  		i
  		(helper (+ 1 x) (combiner i (term x)))))
  (helper 1 start)
)

; Streams

(define (map-stream f s)
    (if (null? s)
    	nil
    	(cons-stream (f (car s)) (map-stream f (cdr-stream s)))))

(define multiples-of-three
  (cons-stream 3 (map-stream (lambda (x) (+ 3 x)) multiples-of-three))
)


(define (nondecreastream s)
	(define (helper s x)
		(if (zero? x) s
			(helper (cdr-stream s) (- x 1))
			)
		)


	(define (helper1 s)
		(if (null? s) nil
			(cons (car s)
				(if (null? (cdr-stream s)) nil
					(if (< (car (cdr-stream s)) (car s)) nil
						(helper1 (cdr-stream s))
						))
					)

				)
		)


    (cons-stream (helper1 s)
	(if (null? (cdr-stream s)) nil
		(nondecreastream (helper s (length (helper1 s))))
		)

	)
)
    


(define finite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 3
                (cons-stream 1
                    (cons-stream 2
                        (cons-stream 2
                            (cons-stream 1 nil))))))))

(define infinite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 2
                infinite-test-stream))))