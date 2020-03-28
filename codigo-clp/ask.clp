(deffunction pregunta-general (?pregunta) (format t "%s" ?pregunta) (bind ?respuesta (read)) ?respuesta)

(deffunction ask-question (?question $?allowed-values) (printout t ?question) (bind ?answer (read)) (while (not (member ?answer ?allowed-values)) do (printout t ?question) (bind ?answer (read)) ) ?answer)

(deffunction si-o-no-p (?question) (bind ?response (ask-question ?question si no s n)) (if (or (eq ?response si) (eq ?response s)) then TRUE else FALSE))

(defrule inicio-preguntas
	?f <- (preguntar inicio)
	=>
	(assert (preguntar nombre))
	(make-instance persona of Persona (nombre "persona"))
	(retract ?f)
)

(defrule preguntar-nombre
	?f <- (preguntar nombre)
	=>
	(bind ?nombre (pregunta-general "Introduzca el nombre de la persona: "))
	(send [persona] put-nombre ?nombre)
	(assert (preguntar apellidos))
	(retract ?f)
)

(defrule preguntar-apellidos
	?f <- (preguntar apellidos)
	=>
	(bind ?x (pregunta-general "Introduzca los apellidos de la persona: "))
	(send [persona] put-apellidos ?x)
	(assert (preguntar edad))
	(retract ?f)
)

(defrule preguntar-edad
	?f <- (preguntar edad)
	=>
	(bind ?x (pregunta-general "Introduzca la edad de la persona en anyos: "))
	(send [persona] put-edad ?x)
	(assert (preguntar altura))
	(retract ?f)
)

(defrule preguntar-altura
	?f <- (preguntar altura)
	=>
	(bind ?x (pregunta-general "Introduzca la altura de la persona en metros: "))
	(send [persona] put-altura ?x)
	(assert (preguntar peso))
	(retract ?f)
)

(defrule preguntar-peso
	?f <- (preguntar peso)
	=>
	(bind ?x (pregunta-general "Introduzca el peso de la persona en kg: "))
	(send [persona] put-peso ?x)
	(assert (preguntar tiempo))
	(bind ?im (/ (send [persona] get-peso) (* (send [persona] get-altura) (send [persona] get-altura) )  ))
	(send [persona] put-im ?im)
	(retract ?f)
)

(defrule preguntar-tiempo
	?f <- (preguntar tiempo)
	=>
	(bind ?x (pregunta-general "Introduzca el tiempo diario disponible de la persona en minutos: "))
	(send [persona] put-tiempo ?x)
	(assert (preguntar objetivos))
	(retract ?f)
)

(defrule preguntar-objetivos
	?f <- (preguntar objetivos)
	=>
	(printout t "Ahora pasamos a preguntar sobre los objetivos de la persona: " crlf)
	(bind ?fl (ask-question "¿Es la flexibilidad parte de sus objetivos? FALSE/TRUE: " FALSE TRUE))
	(bind ?pr (ask-question "¿Es pasar el rato parte de sus objetivos? FALSE/TRUE: " FALSE TRUE))
	(bind ?pp (ask-question "¿Es perder peso parte de sus objetivos? FALSE/TRUE: " FALSE TRUE))
	(bind ?m  (ask-question "¿Es el mantenimiento parte de sus objetivos? FALSE/TRUE: " FALSE TRUE))
	(make-instance mis_objetivos of Objetivos
		(flexibilidad ?fl)
		(pasar-rato ?pr)
		(perder-peso ?pp)
		(mantenimiento ?m)
	)
	(send [persona] put-objetivos (instance-address [mis_objetivos]))
	(assert (preguntar dieta))
	(retract ?f)
)

(defrule preguntar-dieta
	?f <- (preguntar dieta)
	=>
	(printout t "Ahora pasaremos a preguntar sobre su salud: " crlf)
	(printout t "Empezaremos con la dieta: " crlf)
	(bind ?as (ask-question "¿De la sal abusa usted? FALSE/TRUE: " FALSE TRUE))
	(bind ?cf (ask-question "¿Fruta consume usted? FALSE/TRUE: " FALSE TRUE))
	(bind ?ph (ask-question "¿Pica usted entre horas? FALSE/TRUE: " FALSE TRUE))
	(bind ?diet
    (make-instance dieta of Dieta
		  (abuso-de-sal ?as)
		  (consumo-de-fruta ?cf)
		  (picar-entre-horas ?ph)
    )
	)
	(assert (preguntar salud))
	(retract ?f)
)

(defrule preguntar-salud
	?f <- (preguntar salud)
  ?diet <- (object (is-a Dieta))
	=>
	(printout t "Continuamos con la salud: " crlf)
	(bind ?pmax (pregunta-general "¿Cual es su presion maxima? "))
	(bind ?pmin (pregunta-general "¿Cual es su presion minima? "))
	(bind ?ppm  (pregunta-general "¿Cual son sus pulsaciones por minuto? "))
	(bind ?can  (ask-question "¿Sufre usted cansancio, tirantez o mareo despues del ejercicio? FALSE/TRUE: " FALSE TRUE))
	(bind ?br-sup  (ask-question "¿Sufre usted problemes en la parte superior de alguno de sus brazos? FALSE/TRUE: " FALSE TRUE))
	(bind ?br-inf  (ask-question "¿Sufre usted problemes en la parte inferior de alguno de sus brazos? FALSE/TRUE: " FALSE TRUE))
	(bind ?pr-sup  (ask-question "¿Sufre usted problemes en la parte superior de alguna de sus piernas? FALSE/TRUE: " FALSE TRUE))
	(bind ?pr-inf  (ask-question "¿Sufre usted problemes en la parte inferior de alguno de sus piernas? FALSE/TRUE: " FALSE TRUE))
	(bind ?espalda  (ask-question "¿Sufre usted problemas de espalda? FALSE/TRUE: " FALSE TRUE))
	(bind ?torso  (ask-question "¿Sufre usted problemas en el torso? FALSE/TRUE: " FALSE TRUE))
	(bind ?ost  (ask-question "¿Sufre usted osteoporosis? FALSE/TRUE: " FALSE TRUE))

	(make-instance mi_problema of Problemas
		(brazo-superior ?br-sup)
		(brazo-inferior ?br-inf)
		(pierna-superior ?pr-sup)
		(pierna-inferior ?pr-inf)
		(osteoporosis ?ost)
		(torso ?torso)
		(espalda ?espalda)
	)
	(make-instance salud of Salud
		(presion-maxima ?pmax)
		(presion-minima ?pmin)
		(ppm ?ppm)
		(cansancio ?can)
	)
	(send [salud] put-dieta (instance-address [dieta]))
	(send [salud] put-problemas (instance-address [mi_problema]))
	(send [persona] put-salud (instance-address [salud]))
	(retract ?f)
	(assert (preguntar habito))
)

(defrule preguntar-habitos
	?f <- (preguntar habito)
	=>
	(bind ?res (ask-question "¿Desea introducir algun habito (mas)? TRUE/FALSE: " FALSE TRUE))
	(retract ?f)
	(assert (preguntar habito ?res))
)

(defrule preguntar-habitos-false
	?f <- (preguntar habito FALSE)
	=>
	(retract ?f)
	(assert (asignar habito))
	(assert (preguntar fin))
)

(defrule preguntar-habitos-true
	?f <- (preguntar habito TRUE)
	=>
	(retract ?f)
	(bind ?tipo (ask-question "¿Habito dentro o fuera del trabajo? fuera/dentro " fuera dentro))
	(assert (preguntar habito TRUE ?tipo))
)

(defrule preguntar-habitos-true-fuera
	?f <- (preguntar habito TRUE fuera)
	=>
	(retract ?f)
	(bind ?dur (pregunta-general "Introduzca la duracion minima en minutos del habito: "))
	(bind ?fre (pregunta-general "Introduzca la frecuencia en veces por semana del habito: "))
	(bind ?algo (ask-question "sentado/de-pie/recados/tareas-domesticas/deporte? " sentado de-pie recados tareas-domesticas deporte))
	(make-instance of Casa (duracion-minima ?dur)(frequencia ?fre)(tipoCasa ?algo))
	(assert (preguntar habito))
)
(defrule preguntar-habitos-true-dentro
	?f <- (preguntar habito TRUE dentro)
	=>
	(retract ?f)
	(bind ?dur (pregunta-general "Introduzca la duracion minima en minutos del habito: "))
	(bind ?fre (pregunta-general "Introduzca la frecuencia en dias por semana del habito: "))
	(bind ?algo (ask-question "desplazamiento-pie/sentado/de-pie/levantar-peso/movimientos-rep/deporte? " desplazamiento-pie sentado de-pie levantar-peso movimientos-rep deporte))
	(make-instance of Trabajo (duracion-minima ?dur)(frequencia ?fre)(tipoTrabajo ?algo))
	(assert (preguntar habito))
)
