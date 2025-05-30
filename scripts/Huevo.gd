extends Area2D

signal atrapado

func _ready():
	add_to_group("huevos")
	connect("area_entered", self, "_on_area_entered")


func _on_area_entered(area):
	if area.is_in_group("nido"):
		emit_signal("atrapado")
		queue_free()
# 

#	pass
var velocidad = 185  # píxeles por segundo.
func _process(delta):
	position.y += velocidad * delta
	var pantalla_alto = get_viewport().size.y
	if position.y > 1000:
		if get_parent().has_method("_on_huevo_perdido"):
			get_parent()._on_huevo_perdido()  
		queue_free()  # Elimina el huevo cuando ya no se ve en pantalla

