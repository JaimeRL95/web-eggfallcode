extends Timer

export (PackedScene) var huevo_escena
export (PackedScene) var roca_escena

var velocidad_minima = 0.45
var decremento = 0.07
var velocidad_huevo = 185
var incremento_velocidad = 1.5
var velocidad_maxima = 453

func _ready():
	randomize()
	wait_time = 2
	start()
	connect("timeout", self, "_on_timeout")
	
func _on_Area2D_area_entered(area):
	if area.name == "Nido":
		emit_signal("golpeado")
		queue_free()
	

func _on_timeout():
	var objeto
	var es_roca = false

	if randi() % 4 == 0:
		objeto = roca_escena.instance()
		es_roca = true
	else:
		objeto = huevo_escena.instance()

	var juegop = get_parent()
	juegop.add_child(objeto)

	if es_roca:
		if objeto.has_signal("golpeado"):
			objeto.connect("golpeado", juegop, "_on_roca_golpeada")
	else:
		if objeto.has_signal("atrapado"):
			objeto.connect("atrapado", juegop, "_on_huevo_atrapado")

	var x = rand_range(-300, 300)
	var y = 90
	objeto.position = Vector2(x, y)

	if objeto.has_method("set_velocidad"):
		objeto.set("velocidad", velocidad_huevo)

	wait_time = max(velocidad_minima, wait_time - decremento)
	velocidad_huevo = min(velocidad_maxima, velocidad_huevo + incremento_velocidad)
	start()
