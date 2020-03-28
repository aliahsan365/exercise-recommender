; Tue May 17 12:17:38 CEST 2016
; 
;+ (version "3.5")
;+ (build "Build 663")


(defclass %3ACLIPS_TOP_LEVEL_SLOT_CLASS "Fake class to save top-level slot information"
	(is-a USER)
	(role abstract)
	(single-slot recomendado
		(type INSTANCE)
;+		(allowed-classes Problemas)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot flexibilidad
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot edad
;+		(comment "Edad de la Persona")
		(type INTEGER)
		(range 0 1000)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot brazo-inferior
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot torso
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot peso
;+		(comment "Peso de la persona en Kg")
		(type FLOAT)
		(range 0.0 1000.0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot repeticiones-minimas
;+		(comment "Numero de repeticiones minimas del ejercicio.")
		(type INTEGER)
		(range 0 1000)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot salud
;+		(comment "Salud de la persona")
		(type INSTANCE)
;+		(allowed-classes Salud)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot ppm
;+		(comment "Pulsaciones por minuto de la persona")
		(type INTEGER)
		(range 0 1000)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot jueves
		(type INSTANCE)
;+		(allowed-classes Ejercicio)
		(create-accessor read-write))
	(single-slot consumo-de-fruta
		(type SYMBOL)
		(allowed-values FALSE TRUE)
		(default FALSE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot perder-peso
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot picar-entre-horas
		(type SYMBOL)
		(allowed-values FALSE TRUE)
		(default FALSE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot cansancio
;+		(comment "Cansancio, tirantez o mareo despues de ejercicio.")
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot frequencia
;+		(comment "Veces por semana")
		(type INTEGER)
		(range 0 1000)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot martes
		(type INSTANCE)
;+		(allowed-classes Ejercicio)
		(create-accessor read-write))
	(single-slot pierna-inferior
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot dieta
;+		(comment "Dieta asociada a la persona.")
		(type INSTANCE)
;+		(allowed-classes Dieta)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot habitos
		(type INSTANCE)
;+		(allowed-classes Habitos)
		(create-accessor read-write))
	(single-slot pierna-superior
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot miercoles
		(type INSTANCE)
;+		(allowed-classes Ejercicio)
		(create-accessor read-write))
	(single-slot tiempo
;+		(comment "Tiempo disponible en minutos al dia.")
		(type INTEGER)
		(range 30 1000)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot dificultad
;+		(comment "Dificultad del ejercicio ligada a la condicion del usuario y al ejercicio.")
		(type SYMBOL)
		(allowed-values moderada normal dificil)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot combina-con
;+		(comment "el ejercicio combina con otros ejercicios.")
		(type INSTANCE)
;+		(allowed-classes Ejercicio)
		(create-accessor read-write))
	(multislot lunes
		(type INSTANCE)
;+		(allowed-classes Ejercicio)
		(create-accessor read-write))
	(multislot viernes
		(type INSTANCE)
;+		(allowed-classes Ejercicio)
		(create-accessor read-write))
	(single-slot mantenimiento
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot objetivos
;+		(comment "Objetivos que trabaja la persona o el ejercicio.")
		(type INSTANCE)
;+		(allowed-classes Objetivos)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot edad-minima
;+		(comment "Edad minima recomendada para este ejercicio.")
		(type INTEGER)
		(range 0 1000)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot apellidos
;+		(comment "Apellidos")
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot repeticiones-maximas
;+		(comment "Numero de repeticiones maximas del ejercicio.")
		(type INTEGER)
		(range 0 1000)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot duracion-maxima
		(type INTEGER)
		(range 0 1000)
		(default 120)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot im
;+		(comment "Indice de masa corporal de la persona")
		(type FLOAT)
		(range 0.0 1000.0)
		(default 0.0)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot presion-maxima
		(type FLOAT)
		(range 0.0 1000.0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot tipoTrabajo
		(type SYMBOL)
		(allowed-values desplazamiento-pie sentado de-pie levantar-peso movimientos-rep deporte)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot abuso-de-sal
		(type SYMBOL)
		(allowed-values FALSE TRUE)
		(default FALSE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot calorias-minuto
;+		(comment "Calorias por minuto que consume el ejercicio.")
		(type FLOAT)
		(range 0.0 1000.0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot osteoporosis
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot problemas
;+		(comment "Problemas de salud asociados a la persona.")
		(type INSTANCE)
;+		(allowed-classes Problemas)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot presion-minima
		(type FLOAT)
		(range 0.0 1000.0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot no-apto
		(type INSTANCE)
;+		(allowed-classes Problemas)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot pasar-rato
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot altura
;+		(comment "Altura de la persona en m")
		(type FLOAT)
		(range 0.0 1000.0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot duracion-minima
;+		(comment "Duracion en minutos del ejercicio.")
		(type INTEGER)
		(range 0 1000)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot brazo-superior
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot nombre
;+		(comment "Nombre de la persona")
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot tipoCasa
		(type SYMBOL)
		(allowed-values sentado de-pie recados tareas-domesticas deporte)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot edad-maxima
;+		(comment "Edad maxima recomendada para este ejercicio.")
		(type INTEGER)
		(range 0 1000)
		(default 200)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot espalda
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Persona "Clase persona, contiene toda la informacion sobre la persona"
	(is-a USER)
	(role concrete)
	(single-slot objetivos
;+		(comment "Objetivos que trabaja la persona o el ejercicio.")
		(type INSTANCE)
;+		(allowed-classes Objetivos)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot edad
;+		(comment "Edad de la Persona")
		(type INTEGER)
		(range 0 1000)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot salud
;+		(comment "Salud de la persona")
		(type INSTANCE)
;+		(allowed-classes Salud)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot habitos
		(type INSTANCE)
;+		(allowed-classes Habitos)
		(create-accessor read-write))
	(single-slot nombre
;+		(comment "Nombre de la persona")
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot apellidos
;+		(comment "Apellidos")
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot altura
;+		(comment "Altura de la persona en m")
		(type FLOAT)
		(range 0.0 1000.0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot im
;+		(comment "Indice de masa corporal de la persona")
		(type FLOAT)
		(range 0.0 1000.0)
		(default 0.0)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot peso
;+		(comment "Peso de la persona en Kg")
		(type FLOAT)
		(range 0.0 1000.0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot tiempo
;+		(comment "Tiempo disponible en minutos al dia.")
		(type INTEGER)
		(range 30 1000)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Salud "Clase Salud, Indica el estado de salud de una persona"
	(is-a USER)
	(role concrete)
	(single-slot presion-maxima
		(type FLOAT)
		(range 0.0 1000.0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot dieta
;+		(comment "Dieta asociada a la persona.")
		(type INSTANCE)
;+		(allowed-classes Dieta)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot ppm
;+		(comment "Pulsaciones por minuto de la persona")
		(type INTEGER)
		(range 0 1000)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot cansancio
;+		(comment "Cansancio, tirantez o mareo despues de ejercicio.")
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot problemas
;+		(comment "Problemas de salud asociados a la persona.")
		(type INSTANCE)
;+		(allowed-classes Problemas)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot presion-minima
		(type FLOAT)
		(range 0.0 1000.0)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Ejercicio "Ejercicio que puede hacer una persona"
	(is-a USER)
	(role concrete)
	(single-slot objetivos
;+		(comment "Objetivos que trabaja la persona o el ejercicio.")
		(type INSTANCE)
;+		(allowed-classes Objetivos)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot recomendado
		(type INSTANCE)
;+		(allowed-classes Problemas)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot edad-minima
;+		(comment "Edad minima recomendada para este ejercicio.")
		(type INTEGER)
		(range 0 1000)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot repeticiones-maximas
;+		(comment "Numero de repeticiones maximas del ejercicio.")
		(type INTEGER)
		(range 0 1000)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot duracion-maxima
		(type INTEGER)
		(range 0 1000)
		(default 120)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot duracion-minima
;+		(comment "Duracion en minutos del ejercicio.")
		(type INTEGER)
		(range 0 1000)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot repeticiones-minimas
;+		(comment "Numero de repeticiones minimas del ejercicio.")
		(type INTEGER)
		(range 0 1000)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot dificultad
;+		(comment "Dificultad del ejercicio ligada a la condicion del usuario y al ejercicio.")
		(type SYMBOL)
		(allowed-values moderada normal dificil)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot combina-con
;+		(comment "el ejercicio combina con otros ejercicios.")
		(type INSTANCE)
;+		(allowed-classes Ejercicio)
		(create-accessor read-write))
	(single-slot nombre
;+		(comment "Nombre de la persona")
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot calorias-minuto
;+		(comment "Calorias por minuto que consume el ejercicio.")
		(type FLOAT)
		(range 0.0 1000.0)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot edad-maxima
;+		(comment "Edad maxima recomendada para este ejercicio.")
		(type INTEGER)
		(range 0 1000)
		(default 200)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot no-apto
		(type INSTANCE)
;+		(allowed-classes Problemas)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Habitos "Habitos que una persona puede tener"
	(is-a USER)
	(role concrete)
	(single-slot duracion-minima
;+		(comment "Duracion en minutos del ejercicio.")
		(type INTEGER)
		(range 0 1000)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot frequencia
;+		(comment "Veces por semana")
		(type INTEGER)
		(range 0 1000)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Trabajo "Habitos en el trabajo"
	(is-a Habitos)
	(role concrete)
	(single-slot tipoTrabajo
		(type SYMBOL)
		(allowed-values desplazamiento-pie sentado de-pie levantar-peso movimientos-rep deporte)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Casa "Habitos en casa o fuera del trabajo"
	(is-a Habitos)
	(role concrete)
	(single-slot tipoCasa
		(type SYMBOL)
		(allowed-values sentado de-pie recados tareas-domesticas deporte)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Problemas "Problemas fisicos que puede padecer una persona."
	(is-a USER)
	(role concrete)
	(single-slot brazo-superior
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot pierna-inferior
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot brazo-inferior
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot pierna-superior
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot osteoporosis
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot torso
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot espalda
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Dieta "Dieta que puede tener una persona."
	(is-a USER)
	(role concrete)
	(single-slot abuso-de-sal
		(type SYMBOL)
		(allowed-values FALSE TRUE)
		(default FALSE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot consumo-de-fruta
		(type SYMBOL)
		(allowed-values FALSE TRUE)
		(default FALSE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot picar-entre-horas
		(type SYMBOL)
		(allowed-values FALSE TRUE)
		(default FALSE)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Objetivos
	(is-a USER)
	(role concrete)
	(single-slot flexibilidad
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot pasar-rato
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot perder-peso
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot mantenimiento
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Solucion
	(is-a USER)
	(role concrete)
	(multislot martes
		(type INSTANCE)
;+		(allowed-classes Ejercicio)
		(create-accessor read-write))
	(multislot lunes
		(type INSTANCE)
;+		(allowed-classes Ejercicio)
		(create-accessor read-write))
	(multislot jueves
		(type INSTANCE)
;+		(allowed-classes Ejercicio)
		(create-accessor read-write))
	(multislot viernes
		(type INSTANCE)
;+		(allowed-classes Ejercicio)
		(create-accessor read-write))
	(multislot miercoles
		(type INSTANCE)
;+		(allowed-classes Ejercicio)
		(create-accessor read-write)))


(definstances instancies
; Tue May 17 12:17:38 CEST 2016
; 
;+ (version "3.5")
;+ (build "Build 663")

([ontologia_Class0] of  Ejercicio

	(calorias-minuto 12.0)
	(combina-con
		[ontologia_Class10030]
		[ontologia_Class10031]
		[ontologia_Class10032]
		[ontologia_Class10033])
	(duracion-minima 10)
	(edad-minima 10)
	(no-apto [ontologia_Class20002])
	(nombre "Flexiones")
	(objetivos [ontologia_Class10055])
	(recomendado [ontologia_Class20003])
	(repeticiones-maximas 100)
	(repeticiones-minimas 10))

([ontologia_Class10030] of  Ejercicio

	(calorias-minuto 12.0)
	(combina-con
		[ontologia_Class0]
		[ontologia_Class10031]
		[ontologia_Class10032]
		[ontologia_Class10033]
		[ontologia_Class28])
	(duracion-minima 10)
	(edad-minima 10)
	(no-apto [ontologia_Class20003])
	(nombre "Abdominales")
	(objetivos [ontologia_Class10055])
	(recomendado [ontologia_Class20005])
	(repeticiones-maximas 100)
	(repeticiones-minimas 10))

([ontologia_Class10031] of  Ejercicio

	(calorias-minuto 15.0)
	(combina-con
		[ontologia_Class0]
		[ontologia_Class10030]
		[ontologia_Class10032]
		[ontologia_Class10033])
	(duracion-minima 30)
	(edad-maxima 70)
	(edad-minima 10)
	(no-apto [ontologia_Class20007])
	(nombre "Bici")
	(objetivos [ontologia_Class10058])
	(recomendado [ontologia_Class20005]))

([ontologia_Class10032] of  Ejercicio

	(calorias-minuto 10.0)
	(combina-con
		[ontologia_Class0]
		[ontologia_Class10030]
		[ontologia_Class10031]
		[ontologia_Class10033])
	(duracion-minima 10)
	(edad-minima 10)
	(no-apto [ontologia_Class20007])
	(nombre "Sentadillas")
	(objetivos [ontologia_Class10055])
	(recomendado [ontologia_Class20008])
	(repeticiones-maximas 100)
	(repeticiones-minimas 10))

([ontologia_Class10033] of  Ejercicio

	(calorias-minuto 20.0)
	(combina-con
		[ontologia_Class10030]
		[ontologia_Class10031]
		[ontologia_Class10033])
	(duracion-minima 10)
	(edad-maxima 70)
	(edad-minima 10)
	(no-apto [ontologia_Class20007])
	(nombre "Correr")
	(objetivos [ontologia_Class10061])
	(recomendado [ontologia_Class20005]))

([ontologia_Class10055] of  Objetivos

	(flexibilidad TRUE)
	(mantenimiento TRUE)
	(pasar-rato TRUE)
	(perder-peso TRUE))

([ontologia_Class10058] of  Objetivos

	(flexibilidad FALSE)
	(mantenimiento TRUE)
	(pasar-rato TRUE)
	(perder-peso TRUE))

([ontologia_Class10061] of  Objetivos

	(flexibilidad FALSE)
	(mantenimiento TRUE)
	(pasar-rato FALSE)
	(perder-peso TRUE))

([ontologia_Class10065] of  Objetivos

	(flexibilidad TRUE)
	(mantenimiento FALSE)
	(pasar-rato TRUE)
	(perder-peso FALSE))

([ontologia_Class10066] of  Objetivos

	(flexibilidad TRUE)
	(mantenimiento TRUE)
	(pasar-rato TRUE)
	(perder-peso FALSE))

([ontologia_Class10070] of  Objetivos

	(flexibilidad FALSE)
	(mantenimiento FALSE)
	(pasar-rato FALSE)
	(perder-peso TRUE))

([ontologia_Class20002] of  Problemas

	(brazo-inferior TRUE)
	(brazo-superior TRUE)
	(espalda TRUE)
	(osteoporosis FALSE)
	(pierna-inferior FALSE)
	(pierna-superior FALSE)
	(torso TRUE))

([ontologia_Class20003] of  Problemas

	(brazo-inferior FALSE)
	(brazo-superior FALSE)
	(espalda FALSE)
	(osteoporosis FALSE)
	(pierna-inferior FALSE)
	(pierna-superior FALSE)
	(torso FALSE))

([ontologia_Class20005] of  Problemas

	(brazo-inferior FALSE)
	(brazo-superior FALSE)
	(espalda TRUE)
	(osteoporosis FALSE)
	(pierna-inferior FALSE)
	(pierna-superior FALSE)
	(torso TRUE))

([ontologia_Class20007] of  Problemas

	(brazo-inferior FALSE)
	(brazo-superior FALSE)
	(espalda FALSE)
	(osteoporosis TRUE)
	(pierna-inferior TRUE)
	(pierna-superior TRUE)
	(torso FALSE))

([ontologia_Class20008] of  Problemas

	(brazo-inferior FALSE)
	(brazo-superior FALSE)
	(espalda FALSE)
	(osteoporosis FALSE)
	(pierna-inferior FALSE)
	(pierna-superior FALSE)
	(torso TRUE))

([ontologia_Class20012] of  Problemas

	(brazo-inferior TRUE)
	(brazo-superior TRUE)
	(espalda TRUE)
	(osteoporosis TRUE)
	(pierna-inferior TRUE)
	(pierna-superior TRUE)
	(torso TRUE))

([ontologia_Class20013] of  Problemas

	(brazo-inferior FALSE)
	(brazo-superior FALSE)
	(espalda FALSE)
	(osteoporosis FALSE)
	(pierna-inferior FALSE)
	(pierna-superior FALSE)
	(torso FALSE))

([ontologia_Class20016] of  Problemas

	(brazo-inferior TRUE)
	(brazo-superior TRUE)
	(espalda TRUE)
	(osteoporosis FALSE)
	(pierna-inferior FALSE)
	(pierna-superior FALSE)
	(torso TRUE))

([ontologia_Class20017] of  Problemas

	(brazo-inferior FALSE)
	(brazo-superior FALSE)
	(espalda TRUE)
	(osteoporosis TRUE)
	(pierna-inferior FALSE)
	(pierna-superior FALSE)
	(torso TRUE))

([ontologia_Class20018] of  Problemas

	(brazo-inferior TRUE)
	(brazo-superior TRUE)
	(espalda FALSE)
	(osteoporosis FALSE)
	(pierna-inferior TRUE)
	(pierna-superior TRUE)
	(torso FALSE))

([ontologia_Class25] of  Ejercicio

	(calorias-minuto 5.0)
	(combina-con
		[ontologia_Class0]
		[ontologia_Class10030]
		[ontologia_Class10031]
		[ontologia_Class10032]
		[ontologia_Class10033]
		[ontologia_Class25]
		[ontologia_Class26]
		[ontologia_Class27]
		[ontologia_Class28]
		[ontologia_Class29])
	(duracion-minima 10)
	(edad-minima 10)
	(no-apto [ontologia_Class20013])
	(nombre "Estiramientos")
	(objetivos [ontologia_Class10055])
	(recomendado [ontologia_Class20012])
	(repeticiones-minimas 20))

([ontologia_Class26] of  Ejercicio

	(calorias-minuto 10.0)
	(combina-con
		[ontologia_Class25]
		[ontologia_Class27])
	(duracion-minima 30)
	(edad-minima 12)
	(no-apto [ontologia_Class20013])
	(nombre "Pilates")
	(objetivos [ontologia_Class10065])
	(recomendado [ontologia_Class20012]))

([ontologia_Class27] of  Ejercicio

	(calorias-minuto 5.0)
	(combina-con
		[ontologia_Class25]
		[ontologia_Class26])
	(duracion-minima 30)
	(edad-minima 10)
	(no-apto [ontologia_Class20013])
	(nombre "Taichi")
	(objetivos [ontologia_Class10066])
	(recomendado [ontologia_Class20012]))

([ontologia_Class28] of  Ejercicio

	(calorias-minuto 15.0)
	(combina-con [ontologia_Class10030])
	(duracion-minima 15)
	(edad-maxima 60)
	(edad-minima 18)
	(no-apto [ontologia_Class20016])
	(nombre "Pesas")
	(objetivos [ontologia_Class10058])
	(recomendado [ontologia_Class20003])
	(repeticiones-maximas 50)
	(repeticiones-minimas 20))

([ontologia_Class29] of  Ejercicio

	(calorias-minuto 10.0)
	(duracion-minima 30)
	(edad-maxima 80)
	(edad-minima 10)
	(no-apto [ontologia_Class20018])
	(nombre "Natacion")
	(objetivos [ontologia_Class10055])
	(recomendado [ontologia_Class20017])
	(repeticiones-maximas 50)
	(repeticiones-minimas 10))
)
