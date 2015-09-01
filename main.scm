;; ---------utils-----------
(load "match.scm")
(load "helpers.scm")
;; --------pass combinator------
(load "nanopass.scm")
;; --------passes-----------
(load "generate-x86-64.scm")
(load "flatten-program.scm")
(load "expose-frame-var.scm")
(load "expose-basic-blocks.scm")
(load "finalize-locations.scm")
(load "assign-registers.scm")
(load "liveness-analysis.scm")

(load "convert-closures.scm")

(load "cps-convert.scm")
(load "canonicalize-expression.scm")

(define compile
  (nanopass
;;   expand-syntax
   canonicalize-expression

   cps-convert

   convert-closures

   liveness-analysis
   assign-registers
   finalize-locations
   expose-frame-var
   expose-basic-blocks
   flatten-program
   generate-x86-64
   ))