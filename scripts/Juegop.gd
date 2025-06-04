extends Node2D

var nuevos_huevos = 0
var huevos_atrapados = 0
var huevos_perdidos = 0
var vidas = 3
var nido_seleccionado = "normal"
var nido_desbloqueado = false

func _ready():
	if File.new().file_exists("user://datos_guardados.json"):
		cargar_datos()
		
		if nido_seleccionado == "mejorado":
			$Nido/Spritenido.texture = preload("res://Images/betternido.png")
		else:
			$Nido/Spritenido.texture = preload("res://Images/nido2sinfondow.png")
	else:
		# Se asegura de iniciar con los valores por defecto
		huevos_perdidos = 0
		vidas = 3
		actualizar_corazones()
		$Label.text = "Huevos atrapados: " + str(nuevos_huevos)

func _on_huevo_atrapado():
	huevos_atrapados += 0.3
	nuevos_huevos += 1
	$Label.text = "Huevos atrapados: " + str(nuevos_huevos)
	$TotalHuevosLabel.text = "X" + str(huevos_atrapados)
	guardar_datos()

func _on_huevo_perdido():
	huevos_perdidos += 1

	if huevos_perdidos % 1 == 0:  # Cada 3 huevos perdidos pierdes una vida
		vidas -= 1
		actualizar_corazones()

		if vidas <= 0:
			game_over()

func actualizar_corazones():
	if vidas < 3:
		$corazon3.visible = false
	if vidas < 2:
		$corazon2.visible = false
	if vidas < 1:
		$corazon1.visible = false

func game_over():
	guardar_datos()
	print("¡Juego terminado!")
	$GameOverPopup.mostrar_game_over()
	get_tree().paused = true
	nuevos_huevos = 0

func _on_BotonPausa_pressed():
	$PauseMenu.mostrar_menu_pausa()
	guardar_datos()

func guardar_datos():
	var datos = {
		"huevos": huevos_atrapados,
		"nido_seleccionado": nido_seleccionado,
		"nido_desbloqueado": nido_desbloqueado
	}
	var archivo = File.new()
	if archivo.open("user://datos_guardados.json", File.WRITE) == OK:
		archivo.store_string(to_json(datos))
		archivo.close()

func cargar_datos():
	var archivo = File.new()
	if archivo.file_exists("user://datos_guardados.json"):
		if archivo.open("user://datos_guardados.json", File.READ) == OK:
			var contenido = archivo.get_as_text()
			archivo.close()

			var datos = parse_json(contenido)
			if typeof(datos) == TYPE_DICTIONARY:
				huevos_atrapados = datos.get("huevos", 0)
				nido_seleccionado = datos.get("nido_seleccionado", "normal")
				nido_desbloqueado = datos.get("nido_desbloqueado", false)
				$Label.text = "Huevos atrapados: " + str(nuevos_huevos)

func _on_Reanudar_pressed():
	pass

func _on_Reintentar_pressed():
	pass

func _on_MenuPrincipal_pressed():
	pass

func _on_Tienda_pressed():
	pass
