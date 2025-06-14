extends Area2D

signal atrapada_roca
signal golpeado

var velocidad = 300  # Velocidad más rápida que el huevo
func _ready():
	connect("area_entered", self, "_on_Area2D_area_entered")
	# o
	connect("body_entered", self, "_on_Area2D_body_entered")
	

func _physics_process(delta):
	position.y += velocidad * delta
	if position.y > 1000:
		queue_free()

func _on_Roca_body_entered(body):
	if body.name == "Nido":
		emit_signal("golpeado")
		visible = false
		set_deferred("collision_layer", 0)
		set_deferred("collision_mask", 0)
		queue_free()


func _on_Node2D_golpeado():
	pass # Replace with function body.
func _on_Area2D_area_entered(area):
	print("Colisión detectada con: ", area.name)  # <- Aquí el print para debug
	if area.name == "Nido":
		print("¡Colisión con el nido!")  # Para confirmar que es el nido
		emit_signal("golpeado")
		queue_free()
func _on_Area2D_body_entered(body):
	print("Body colisionó con: ", body.name)
	if body.name == "Nido":
		
		emit_signal("golpeado")
		queue_free()


func _on_area_entered(area):
	print("Colisionó con: ", area.name)
	if area.name == "Nido":
	
		emit_signal("golpeado")
		queue_free()

