;;;;;;;;;;;;;;;
;; Questions ;;
;;;;;;;;;;;;;;;

; Scheme

(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  (car (cdr s))
)

(define (caddr s)
  (car(cddr s))
)

(define (sign x)
  (cond
    ((zero? x) 0)
    ((< x 0) (- 1))
    (else 1)))

(define (square x) (* x x))

(define (pow b n)
  (cond
    ((zero? n) 1)
    ((even? n) (square (pow b (/ n 2))))
    ((odd? n) (* b (pow b (- n 1))))))

(define (unique s)
  (cond
    ((null? s) nil)
    (else
      (cons (car s)
          (filter (lambda (x) (not(equal? x (car s)))) (unique (cdr s)))
        ))


    )
)