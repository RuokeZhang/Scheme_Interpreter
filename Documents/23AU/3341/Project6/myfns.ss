;; Define a function to evaluate PLAN programs
(define (myinterpreter program)
  (eval-plan-program (car (cdr program))))

;; Function to evaluate the planProg expression
(define (eval-plan-program expr)
  (eval-expr expr '()))

;; Function to evaluate expressions
(define (eval-expr expr env)
  (cond
    ((integer? expr) expr)
    ((symbol? expr) (lookup expr env))
    ((equal? (car expr) 'planAdd) (eval-plan-add (car (cdr expr)) (car (cdr (cdr expr))) env))
    ((equal? (car expr) 'planMul) (eval-plan-mul (car (cdr expr)) (car (cdr (cdr expr))) env))
    ((equal? (car expr) 'planSub) (eval-plan-sub (car (cdr expr)) (car (cdr (cdr expr))) env))
    ((equal? (car expr) 'planLet) (eval-plan-let (car (cdr expr)) (car (cdr (cdr expr))) (car (cdr (cdr (cdr expr)))) env))
    ((equal? (car expr) 'planIf) (eval-plan-if (car (cdr expr)) (car (cdr (cdr expr))) (car (cdr (cdr (cdr expr)))) env))
))


;; Function to evaluate planAdd expressions
(define (eval-plan-add expr1 expr2 env)
  (+ (eval-expr expr1 env) (eval-expr expr2 env)))

(define (eval-plan-mul expr1 expr2 env)
  (* (eval-expr expr1 env) (eval-expr expr2 env)))

(define (eval-plan-sub expr1 expr2 env)
  (- (eval-expr expr1 env) (eval-expr expr2 env)))

(define (eval-plan-let id expr1 expr2 env)
  (define (bind-and-eval new-env)
    (eval-expr expr2 new-env))
  (bind-and-eval (cons (cons id (eval-expr expr1 env)) env)))

(define (eval-plan-if expr1 expr2 expr3 env)
    (let ((test-result (eval-expr expr1 env)))
      (if (and (integer? test-result) (> test-result 0))
          (eval-expr expr2 env)
          (eval-expr expr3 env))))


;; Function to look up the value of a symbol in the environment
(define (lookup symbol env)
  (cond
    ((null? env) #f)  ; 如果变量未找到，返回Scheme的假值 #f
    ((equal? (caar env) symbol) (cdar env))  ; 如果找到了变量，返回其值
    (else (lookup symbol (cdr env)))))  ; 在列表的其余部分中继续查找


;; Add functions for planMul, planSub, planLet, and planIf here

;; This is a simplified template. You need to expand this template
;; based on the specific rules and operations of the PLAN language
;; as defined in your project description.
