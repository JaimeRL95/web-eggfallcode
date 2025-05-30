extends Node2D

onready var flecha = $Flecha
onready var popup = $Popup
onready var popup_label = $PopupLabel
onready var timer = $Popup/Timer
onready var label_huevos = $LabelHuevos

var huevos = 0
var nido_desbloqueado = false
var nido_seleccionado = "normal"

func _ready():
	cargar_datos()
	actualizar_ui()
	popup.visible = false
	
func mostrar_popup_confirmacion(texto):
	$Confirmacion.dialog_text = texto
	$Confirmacion.popup_centered()
	yield($Confirmacion, "confirmed")  # Espera confirmación del usuario

func _on_NidoNormalBoton_pressed():
	nido_seleccionado = "normal"
	mover_flecha($NidoNormalBoton)
	guardar_datos()

func _on_NidoMejoradoBoton_pressed():
	if nido_desbloqueado:
		nido_seleccionado = "mejorado"
		mover_flecha($NidoMejoradoBoton)
		guardar_datos()
	else:
		if huevos >= 200:
			yield(mostrar_popup_confirmacion("¿Desbloquear por 200 huevos dorados?"), "completed")

			huevos -= 200
			nido_desbloqueado = true
			nido_seleccionado = "mejorado"
			mover_flecha($NidoMejoradoBoton)
			mostrar_popup("¡Desbloqueado!", 3)
			guardar_datos()
			actualizar_ui()
		else:
			mostrar_popup("No tienes suficientes\nhuevos dorados\n se necesitan 200 ", 3)

func mover_flecha(boton):
	flecha.rect_position = boton.rect_global_position + Vector2(0, -50)

func mostrar_popup(texto, duracion = 0):
	popup_label.text = texto
	popup.visible = true
	if duracion > 0:
		timer.wait_time = duracion
		timer.start()

func _on_Timer_timeout():
	popup.visible = false
	popup_label.visible=false
	label_huevos.visible=false
	
# Guarda los datos
func guardar_datos():
	var datos = {
		"huevos": huevos,
		"nido_desbloqueado": nido_desbloqueado,
		"nido_seleccionado": nido_seleccionado
	}
	var file = File.new()
	file.open("user://datos_guardados.json", File.WRITE)
	file.store_string(to_json(datos))
	file.close()

# Carga los datos
func cargar_datos():
	var file = File.new()
	if file.file_exists("user://datos_guardados.json"):
		file.open("user://datos_guardados.json", File.READ)
		var contenido = file.get_as_text()
		file.close()
		var datos = parse_json(contenido)
		if typeof(datos) == TYPE_DICTIONARY:
			huevos = datos.get("huevos", 0)
			nido_desbloqueado = datos.get("nido_desbloqueado", false)
			nido_seleccionado = datos.get("nido_seleccionado", "normal")

func actualizar_ui():
	$TotalHuevosLabel.text = "X" + str(huevos)
	if nido_seleccionado == "normal":
		mover_flecha($NidoNormalBoton)
	else:
		mover_flecha($NidoMejoradoBoton)

func _on_flechasalida_pressed():
	get_tree().change_scene("res://scenes/Main menu.tscn")
