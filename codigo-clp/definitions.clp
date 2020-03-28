; Definicion del inicio del programa

;; Cabecera del programa
(defrule presentacion "regla que presenta al sistema"
  (declare (salience 10))
  =>
  (printout t "------------------------------------------------" crlf)
  (printout t "------ Sistema de Recomendacion de Rutinas -----" crlf)
  (printout t "------------------------------------------------" crlf)
  (printout t crlf)
)

;; afirmacion del flag que inicia el programa
(deffacts inicial
  (preguntar inicio)
)
