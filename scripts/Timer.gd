extends Timer

export (PackedScene) var huevo_escena

var velocidad_minima = 0.3
var decremento = 0.05
var velocidad_huevo = 185  # velocidad inicial de caída
var incremento_velocidad = 3  # cuanto se incrementa la velocidad cada vez
var velocidad_maxima = 500  # límite superior de velocidad de caída

func _ready():
	randomize()
	wait_time = 2.0
	start()
	connect("timeout", self, "_on_timeout")

func _on_timeout():
	var huevo = huevo_escena.instance()
	var juegop = get_parent()
	juegop.add_child(huevo)
	huevo.connect("atrapado", juegop, "_on_huevo_atrapado")

	var x = rand_range(-300, 300)
	var y = 90
	huevo.position = Vector2(x, y)

	# Le pasamos la velocidad actual de caída al huevo
	huevo.velocidad = velocidad_huevo

	# Aumenta progresivamente velocidad de caída y frecuencia
	wait_time = max(velocidad_minima, wait_time - decremento)
	velocidad_huevo = min(velocidad_maxima, velocidad_huevo + incremento_velocidad)
	start()

