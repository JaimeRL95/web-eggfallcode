extends Area2D

var velocidad = 1000
var sprite_ancho = 64  
func _ready():
	add_to_group("nido")

func _process(delta):
	var movimiento = 0

	if Input.is_action_pressed("ui_left"):
		movimiento -= 1
	if Input.is_action_pressed("ui_right"):
		movimiento += 1


	position.x += movimiento * velocidad * delta

	
	var limite_izq = -286
	var limite_der = 241

	position.x = clamp(position.x, limite_izq, limite_der)
var limite_izq = -286
var limite_der = 241
func _input(event):
	if event is InputEventScreenDrag or (event is InputEventScreenTouch and event.pressed) or (event is InputEventMouseButton and event.pressed):
		var global_pos = get_global_mouse_position()
		var local_pos = get_parent().to_local(global_pos)
		
		
		var nueva_x = local_pos.x - 370
		
		var limite_izq = -286
		var limite_der = 241
		position.x = clamp(nueva_x, limite_izq, limite_der)



