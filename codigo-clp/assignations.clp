; Algoritmo de asignacion de ejercicios a la rutina
; de una persona

;; Guarda los objetivos de la persona en una instancia
(defrule asignar-objetivo
	?f <- (asignar objetivos)
	?obj <- (object (is-a Objetivos))
	=>
	(send [persona] put-objetivos ?obj)
	(retract ?f)
  (assert (objetivos asignados))
)

;; Guarda los habitos de dieta de la persona en una instancia
(defrule asignar-dieta
	?f <- (asignar dieta)
	?obj <- (object (is-a Dieta))
	=>
	(send [salud] put-dieta ?obj)
	(retract ?f)
	(assert (dieta asignada))
)

;; Guarda los problemas fisiologicos de la persona en una instancia
(defrule asignar-problema
	?f <- (asignar problema)
	?obj <- (object (is-a Problemas))
	=>
	(send [salud] put-problemas ?obj)
	(retract ?f)
	(assert (problema asignado))
)

;; Guarda los datos de salud del usuario en una instancia
(defrule asignar-salud
	?f <- (asignar salud)
	?obj <- (object (is-a Salud))
	=>
	(send [persona] put-salud ?obj)
	(retract ?f)
  (assert (salud asignada))
)

;; Guarda los habitos de la vida cotidiana dentro y fuera del trabajo
(defrule asignar-habito
	?f <- (asignar habito)
	=>
	(slot-insert$ [persona] habitos 1 (find-all-instances ((?hab Habitos)) (>= ?hab:duracion-minima 0)))
	(retract ?f)
)

;; Recoge el flag de fin de las preguntas y afirma el flag para iniciar
;; la criba de ejercicios incompatibles con las caracteristicas del usuario
(defrule start-criba
  ?fpf <- (preguntar fin)
  =>
  (retract ?fpf)
  (assert (criba start))
)

;; Recoge los flags de fin de cada uno de los distintos tipos de criba
;; y afirma un flag unico de fin de todos los tipos de criba
(defrule end-criba
  ?f0 <- (criba start)
  ?f1 <- (criba edad-min)
  ?f2 <- (criba edad-max)
  ?f3 <- (criba objetivos)
  ?f4 <- (criba no-apto)
  =>
  (retract ?f0)
  (retract ?f1)
  (retract ?f2)
  (retract ?f3)
  (retract ?f4)
  (assert (criba fin))
)

;; Realiza una criba de ejercicios incompatibles con las caracteristicas
;; del usuario segun la edad minima recomendada de un ejercicio
(defrule criba-edad-min
  (criba start)
  (object (is-a Persona) (edad ?e))
  ?ej <- (object (is-a Ejercicio) (edad-minima ?emin))
  =>
  (if(< ?e ?emin)
    then (unmake-instance ?ej))
  (assert (criba edad-min))
)

;; Realiza una criba de ejercicios incompatibles con las caracteristicas
;; del usuario segun la edad maxima recomendada de un ejercicio
(defrule criba-edad-max
  (criba start)
  (object (is-a Persona) (edad ?e))
  ?ej <- (object (is-a Ejercicio) (edad-maxima ?emax))
  =>

  (if(> ?e ?emax)
    then (unmake-instance ?ej))
  (assert (criba edad-max))
)

;; Definimos 2 funciones booleanas para simplificar las llamadas y
;; comprobaciones en la criba de objetivos
(deffunction contained (?primero ?segundo) (if (eq ?segundo TRUE) then TRUE else (not ?primero)))
(deffunction not-contained (?primero ?segundo) (not (contained ?primero ?segundo)))

;; Realiza una criba de ejercicios incompatibles con las caracteristicas
;; del usuario segun si alguno de los objetivos del ejercicio se encuentra
;; entre los objetivos de la persona
(defrule criba-obj
	(criba start)
	?ej <- (object (is-a Ejercicio))
	=>
	(if (or
			(not-contained (send [mis_objetivos] get-flexibilidad) (send (send ?ej get-objetivos) get-flexibilidad))
			(not-contained (send [mis_objetivos] get-pasar-rato) (send (send ?ej get-objetivos) get-pasar-rato))
			(not-contained (send [mis_objetivos] get-perder-peso) (send (send ?ej get-objetivos) get-perder-peso))
			(not-contained (send [mis_objetivos] get-mantenimiento) (send (send ?ej get-objetivos) get-mantenimiento))
		) then
		(unmake-instance ?ej)
	)
	(assert (criba objetivos))
)

;; Realiza una criba de ejercicios incompatibles con las caracteristicas
;; del usuario segun si el ejercicio es apto o no para una persona con los
;; problemas fisiologicos descritos por el usuario
(defrule criba-no-apto
	(criba start)
	=>
	(do-for-all-instances ((?ej Ejercicio))
		(or
			(eq (send ?ej:no-apto get-brazo-superior) TRUE)
			(eq (send ?ej:no-apto get-brazo-inferior) TRUE)
			(eq (send ?ej:no-apto get-pierna-superior) TRUE)
			(eq (send ?ej:no-apto get-pierna-inferior) TRUE)
			(eq (send ?ej:no-apto get-osteoporosis) TRUE)
			(eq (send ?ej:no-apto get-espalda) TRUE)
			(eq (send ?ej:no-apto get-torso) TRUE)
		)
		(bind ?ejpr (send ?ej get-no-apto))
		(if(or
				(and (eq (send [mi_problema] get-brazo-superior) TRUE) (eq (send [mi_problema] get-brazo-superior) (send ?ejpr get-brazo-superior)))
				(and (eq (send [mi_problema] get-brazo-inferior) TRUE) (eq (send [mi_problema] get-brazo-inferior) (send ?ejpr get-brazo-inferior)))
				(and (eq (send [mi_problema] get-pierna-superior) TRUE) (eq (send [mi_problema] get-pierna-superior) (send ?ejpr get-pierna-superior)))
				(and (eq (send [mi_problema] get-pierna-inferior) TRUE) (eq (send [mi_problema] get-pierna-inferior) (send ?ejpr get-pierna-inferior)))
				(and (eq (send [mi_problema] get-osteoporosis) TRUE) (eq (send [mi_problema] get-osteoporosis) (send ?ejpr get-osteoporosis)))
				(and (eq (send [mi_problema] get-espalda) TRUE) (eq (send [mi_problema] get-espalda) (send ?ejpr get-espalda)))
				(and (eq (send [mi_problema] get-torso) TRUE) (eq (send [mi_problema] get-torso) (send ?ejpr get-torso)))
			)
			then
			(unmake-instance ?ej)
		)
	)
	(assert (criba no-apto))
)

;; Comprueba si en alguna de las cribas se han eliminado todos los ejercicios
;; que quedaban y ataja el programa directamente al print final
(defrule no-quedan-ejercicios
	?f <- (criba ?)
  (not (object (is-a Ejercicio)))
	(not (no-hay ejercicios))
	=>
	(retract ?f)
	(assert (fin programa))
  (assert (no-hay ejercicios))
)

;; Recoge el flag de final de todas las cribas y afirma el flag para iniciar
;; el calculo de la condicion fisica
(defrule condicion-fisica-start
	?f <- (criba fin)
  (object (is-a Ejercicio))
	=>
	(retract ?f)
	(assert (cond-fisica 15))
)

;; Calcula un valor de condicion fisica a partir de los habitos, dieta y
;; datos fisiologicos del usuario
(defrule condicion-fisica
	?cond <- (cond-fisica ?i)
	(not (fin cond-fisica))
	(not (condicion-fisica ?))
	=>
	(if(send [dieta] get-abuso-de-sal)
		then (bind ?i (- ?i 1))
	)
	(if(send [dieta] get-consumo-de-fruta)
		then (bind ?i (+ ?i 1))
	)
	(if(send [dieta] get-picar-entre-horas)
		then (bind ?i (- ?i 1))
	)
	(if(send [salud] get-cansancio)
		then (bind ?i (- ?i 1))
	)
	(bind ?pmax (send [salud] get-presion-maxima))
	(bind ?pmin (send [salud] get-presion-minima))
	(if(and (>= ?pmax 90) (<= ?pmax 140))
		then
		(if(and (>= ?pmin 60) (<= ?pmin 80))
			then (bind ?i (+ ?i 1))
		)
		else (if(not (and (>= ?pmin 60) (<= ?pmin 80)))
			then (bind ?i (+ ?i 1))
		)
	)
	(bind ?im (send [persona] get-im))
	(if(and (>= ?im 18.5) (< ?im 25))
		then (bind ?i (+ ?i 1))
		else if(or (< ?im 17) (>= ?im 30)
				then (bind ?i (- ?i 1))
			)
	)
  (bind ?ppm (send [salud] get-ppm))
  (if(or (> ?ppm 100) (< ?ppm 50))
    then (bind ?i (- ?i 1))
  )
  (do-for-all-instances ((?h Trabajo))
    (or (eq ?h:tipoTrabajo deporte)
      (eq ?h:tipoTrabajo levantar-peso)
      (eq ?h:tipoTrabajo movimientos-rep)
    )
    (bind ?i (+ ?i ?h:frequencia))
  )
  (do-for-all-instances ((?h Trabajo))
    (eq ?h:tipoTrabajo sentado)
    (bind ?i (- ?i ?h:frequencia))
  )
  (do-for-all-instances ((?h Casa))
    (or (eq ?h:tipoCasa deporte)
      (eq ?h:tipoCasa tareas-domesticas)
    )
    (bind ?i (+ ?i ?h:frequencia))
  )
  (do-for-all-instances ((?h Casa))
    (eq ?h:tipoCasa sentado)
    (bind ?i (- ?i ?h:frequencia))
  )
	(retract ?cond)
	(assert (cond-fisica ?i))
	(assert (fin cond-fisica))
)

;; Recoge el flag de fin de calculo de la condicion fisica y determina,
;; a partir del valor de condicion fisica calculado, si el usuario se
;; encuentra en una condicion fisica buena, media o mala
(defrule cond-fisica-fin
	?f <- (fin cond-fisica)
	?cond <- (cond-fisica ?i)
	=>
	(retract ?f)
	(if (< ?i 14)
		then (assert (condicion-fisica mala))
		else (if(> ?i 18)
			then (assert (condicion-fisica buena))
			else (assert (condicion-fisica media))
		)
	)
	(assert (calcula solucion))
)

;; Asigna a los ejercicios una dificultad apropiada para la condicion
;; fisica del usuario, y posteriormente determina el numero de
;; repeticiones de una rutina de ejericios que refleje dicha
;; dificultad
(defrule calculo-ejercicios
  (calcula solucion)
  (condicion-fisica ?cond)
  =>
  (bind ?dif moderada)
  (if(eq ?cond media)
    then (bind ?dif normal)
    else (if(eq ?cond buena)
      then (bind ?dif dificil)
    )
  )
  (do-for-all-instances ((?ej Ejercicio))
    (not (eq (send ?ej get-dificultad) ?dif))
    (modify-instance ?ej (dificultad ?dif))
  )
  (do-for-all-instances ((?ej Ejercicio))
    (not (eq (send ?ej get-dificultad) desconocida))
    (bind ?rmin (send ?ej get-repeticiones-minimas))
    (bind ?rmax (send ?ej get-repeticiones-maximas))
    (if(eq 0 ?rmin)
      then
        (send ?ej put-repeticiones-minimas 1)
    )
    (if(eq 0 ?rmax)
      then
        (send ?ej put-repeticiones-maximas 1)
    )
  )
  (do-for-all-instances ((?ej Ejercicio))
    (eq (send ?ej get-dificultad) normal)
    (bind ?rmin (send ?ej get-repeticiones-minimas))
    (bind ?rmax (send ?ej get-repeticiones-maximas))
    (send ?ej put-repeticiones-minimas (/ (+ ?rmin ?rmax) 2))
  )
  (do-for-all-instances ((?ej Ejercicio))
    (eq (send ?ej get-dificultad) dificil)
    (bind ?rmax (send ?ej get-repeticiones-maximas))
    (send ?ej put-repeticiones-minimas ?rmax)
  )
  (assert (calculado ejercicios))
)

;; Realiza una serie de comprobaciones sobre los tiempos de duracion
;; estandar de las rutinas y del tiempo libre del usuario, y modifica
;; el valor de repeticiones minimas (que sera el que se muestre en el
;; horario final) de forma acorde
(defrule calculo-tiempos
  (calcula solucion)
  =>
  (bind ?tiempo (send [persona] get-tiempo))
  (do-for-all-instances ((?ej Ejercicio))
    (< (send ?ej get-duracion-maxima) (/ ?tiempo 2))
    (send ?ej put-duracion-minima (send ?ej get-duracion-maxima))
  )
  (do-for-all-instances ((?ej Ejercicio))
    (and (not (< (send ?ej get-duracion-maxima) (/ ?tiempo 2)))
      (< (send ?ej get-duracion-minima) (/ ?tiempo 3))
    )
    (send ?ej put-duracion-minima (/ ?tiempo 3))
  )
  (assert (calculado tiempos))
)

;; Declara la plantilla de puntuacion de uso de un ejercicio, para evitar
;; repetir ejercicios de un dia para otro
(deftemplate punt "puntuacion"
	(slot ej)
	(slot pt)
)

;; Recoge los flags de fin de calculos de la dificultad, repeticiones y
;; duracion de las rutinas de ejercicios y afirma un flag para iniciar
;; la generacion de una solucion
(defrule calculos-fin
  ?f0 <- (calculado ejercicios)
  ?f1 <- (calculado tiempos)
  =>
  (retract ?f0)
  (retract ?f1)
  (assert (solucion start))
)

;; Recoge el flag de inicio de generacion de solucion y afirma un flag para
;; iniciar la funcion de inicializacion de ejercicios para dicha generacion
;; a partir de las instancias restantes
(defrule solucion-empezar
	?f <- (solucion start)
  =>
	(assert(cargar ejercicios))
	(retract ?f)
	(make-instance mi_solucion of Solucion)
)

;; Inicializa las estructuras de ejercicio-puntuacion para indicar la "rareza
;; de apariciones" en el horario y afirma un flag de inicio para la generacion
;; de un horario para el lunes
(defrule cargar-ejercicios
	(cargar ejercicios)
	=>
	(do-for-all-instances ((?ej Ejercicio))
	(assert(punt(ej ?ej)(pt 100.0)))
	)
	(assert(solucion lunes))
)

;; Recoge el flag de inicio de generacion de horario para el lunes, lo genera
;; y declara el flag para generar el horario del martes
(defrule solucion-lunes
	?sol <- (solucion lunes)
	?f <- (punt(ej ?ej)(pt ?pt&:(> ?pt 0)))
  (not (punt (pt ?pt2&:(> ?pt2 ?pt))))
	(not (lunes ?ej))
  =>
	(bind ?i 1)
	(retract ?f)
	(assert(punt(ej ?ej)(pt (- ?pt 5))))
	(assert (lunes ?ej))
	(bind ?tiempo (send ?ej get-duracion-minima))

  (bind ?i 1)
  (while (<= ?i (length$ (send [mi_solucion] get-lunes)))
  do
    (bind ?iej (nth$ ?i (send [mi_solucion] get-lunes)))
    (bind ?tiempoej (send ?iej get-duracion-minima))
    (bind ?tiempo (+ ?tiempo ?tiempoej))
    (bind ?i (+ ?i 1))
  )

  (bind ?tiempouser (send [persona] get-tiempo))
	(if(> ?tiempo ?tiempouser)
		then
		(assert(solucion martes))
		(retract ?sol)
		else
		(slot-insert$ [mi_solucion] lunes  (+ 1 (length$ (send [mi_solucion] get-lunes)))  ?ej)
	)
)

;; Funcion de generacion de horario de martes, que recoge su flag y afirma
;; el flag para el miercoles
(defrule solucion-martes
	?sol <- (solucion martes)
	?f <- (punt(ej ?ej)(pt ?pt&:(> ?pt 0)))
  (not (punt (pt ?pt2&:(> ?pt2 ?pt))))
	(not (martes ?ej))
  =>
	(bind ?i 1)
	(retract ?f)
	(assert(punt(ej ?ej)(pt (- ?pt 5))))
	(assert (martes ?ej))
	(bind ?tiempo (send ?ej get-duracion-minima))

  (bind ?i 1)
  (while (<= ?i (length$ (send [mi_solucion] get-martes)))
  do
    (bind ?iej (nth$ ?i (send [mi_solucion] get-martes)))
    (bind ?tiempoej (send ?iej get-duracion-minima))
    (bind ?tiempo (+ ?tiempo ?tiempoej))
    (bind ?i (+ ?i 1))
  )

  (bind ?tiempouser (send [persona] get-tiempo))
	(if(> ?tiempo ?tiempouser)
		then
		(assert(solucion miercoles))
		(retract ?sol)
		else
		(slot-insert$ [mi_solucion] martes  (+ 1 (length$ (send [mi_solucion] get-martes)))  ?ej)
	)
)

;; Recoge el flag del miercoles, genera un horario y da paso al jueves
(defrule solucion-miercoles
	?sol <- (solucion miercoles)
	?f <- (punt(ej ?ej)(pt ?pt&:(> ?pt 0)))
  (not (punt (pt ?pt2&:(> ?pt2 ?pt))))
	(not (miercoles ?ej))
  =>
	(bind ?i 1)
	(retract ?f)
	(assert(punt(ej ?ej)(pt (- ?pt 5))))
	(assert (miercoles ?ej))
	(bind ?tiempo (send ?ej get-duracion-minima))

  (bind ?i 1)
  (while (<= ?i (length$ (send [mi_solucion] get-miercoles)))
  do
    (bind ?iej (nth$ ?i (send [mi_solucion] get-miercoles)))
    (bind ?tiempoej (send ?iej get-duracion-minima))
    (bind ?tiempo (+ ?tiempo ?tiempoej))
    (bind ?i (+ ?i 1))
  )

  (bind ?tiempouser (send [persona] get-tiempo))
	(if(> ?tiempo ?tiempouser)
		then
		(assert(solucion jueves))
		(retract ?sol)
		else
		(slot-insert$ [mi_solucion] miercoles  (+ 1 (length$ (send [mi_solucion] get-miercoles)))  ?ej)
	)
)

;; Recoge el flag del jueves, genera un horario y da paso al viernes
(defrule solucion-jueves
	?sol <- (solucion jueves)
	?f <- (punt (ej ?ej) (pt ?pt&:(> ?pt 0)))
  (not (punt (pt ?pt2&:(> ?pt2 ?pt))))
	(not (jueves ?ej))
  =>
	(bind ?i 1)
	(retract ?f)
	(assert(punt(ej ?ej)(pt (- ?pt 5))))
	(assert (jueves ?ej))
	(bind ?tiempo (send ?ej get-duracion-minima))

  (bind ?i 1)
  (while (<= ?i (length$ (send [mi_solucion] get-jueves)))
  do
    (bind ?iej (nth$ ?i (send [mi_solucion] get-jueves)))
    (bind ?tiempoej (send ?iej get-duracion-minima))
    (bind ?tiempo (+ ?tiempo ?tiempoej))
    (bind ?i (+ ?i 1))
  )

  (bind ?tiempouser (send [persona] get-tiempo))
	(if(> ?tiempo ?tiempouser)
		then
		(assert(solucion viernes))
		(retract ?sol)
		else
		(slot-insert$ [mi_solucion] jueves  (+ 1 (length$ (send [mi_solucion] get-jueves)))  ?ej)
	)
)

;; Recoge el flag del viernes, genera un horario y afirma un flag que marca
;; el final de la generacion de horarios
(defrule solucion-viernes
	?sol <- (solucion viernes)
	?f <- (punt(ej ?ej)(pt ?pt&:(> ?pt 0)))
  (not (punt (pt ?pt2&:(> ?pt2 ?pt))))
	(not (viernes ?ej))
  =>
	(bind ?i 1)
	(retract ?f)
	(assert(punt(ej ?ej)(pt (- ?pt 5))))
	(assert (viernes ?ej))
	(bind ?tiempo (send ?ej get-duracion-minima))

  (bind ?i 1)
  (while (<= ?i (length$ (send [mi_solucion] get-viernes)))
  do
    (bind ?iej (nth$ ?i (send [mi_solucion] get-viernes)))
    (bind ?tiempoej (send ?iej get-duracion-minima))
    (bind ?tiempo (+ ?tiempo ?tiempoej))
    (bind ?i (+ ?i 1))
  )

  (bind ?tiempouser (send [persona] get-tiempo))
	(if(> ?tiempo ?tiempouser)
		then
		(assert(fin solucion))
		(retract ?sol)
		else
		(slot-insert$ [mi_solucion] viernes  (+ 1 (length$ (send [mi_solucion] get-viernes)))  ?ej)
	)
)

;; Recoge todas las afirmaciones para checks generadas al montar el horario
;; del lunes una vez se ha generado el horario de toda la semana
(defrule limpia-lunes
	(fin solucion)
	?dia <- (lunes ?)
	=>
	(retract ?dia)
)

;; Recoge todas las afirmaciones para checks generadas al montar el horario
;; del martes una vez se ha generado el horario de toda la semana
(defrule limpia-martes
	(fin solucion)
	?dia <- (martes ?)
	=>
	(retract ?dia)
)

;; Recoge todas las afirmaciones para checks generadas al montar el horario
;; del miercoles una vez se ha generado el horario de toda la semana
(defrule limpia-miercoles
	(fin solucion)
	?dia <- (miercoles ?)
	=>
	(retract ?dia)
)

;; Recoge todas las afirmaciones para checks generadas al montar el horario
;; del jueves una vez se ha generado el horario de toda la semana
(defrule limpia-jueves
	(fin solucion)
	?dia <- (jueves ?)
	=>
	(retract ?dia)
)

;; Recoge todas las afirmaciones para checks generadas al montar el horario
;; del viernes una vez se ha generado el horario de toda la semana
(defrule limpia-viernes
	(fin solucion)
	?dia <- (viernes ?)
	=>
	(retract ?dia)
)

;; Recoge los flags de fin de generacion de horarios y el de inicializacion
;; de ejercicios, comprueba que se ha eliminado toda la basura generada en la
;; generacion de horarios, y afirma un flag de fin de programa para imprimir
;; la solucion por pantalla
(defrule solucion-fin
	?f <- (fin solucion)
	(not (lunes ?))
	(not (martes ?))
	(not (miercoles ?))
	(not (jueves ?))
	(not (viernes ?))
	?f1 <- (cargar ejercicios)
	=>
	(retract ?f)
	(retract ?f1)
	(assert (fin programa))
)

;; Recoge el flag de fin de programa y afirma un flag 'legacy' de codigo
;; del prototipo entregado
(defrule finaliza
	?f <- (fin programa)
	(not (solucion ?))
	=>
	(retract ?f)
  (assert (standby FALSE))
)
