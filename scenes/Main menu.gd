extends Node2D
func _on_nuevapartida_pressed():
	print("Nueva Partida pulsada")

	
	var dir = Directory.new()
	if dir.file_exists("user://datos_guardados.json"):
		dir.remove("user://datos_guardados.json")

	get_tree().change_scene("res://scenes/Juegop.tscn")

	
	
	


func _on_contitinuar_pressed():
	# Cargar la escena del juego, los datos se mantienen
	get_tree().change_scene("res://scenes/Juegop.tscn")

func _on_Tienda_pressed():
	get_tree().change_scene("res://scenes/Tienda.tscn")


