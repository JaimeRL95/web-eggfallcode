extends CanvasLayer

onready var fondo_menu = $Fondopausa  

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	for child in get_children():
		child.pause_mode = Node.PAUSE_MODE_PROCESS
	visible = false
	fondo_menu.visible = false


func mostrar_menu_pausa():
	visible = true
	fondo_menu.visible = true
	get_tree().paused = true

func ocultar_menu_pausa():
	visible = false
	fondo_menu.visible = false
	get_tree().paused = false

func _on_Reanudar_pressed():
	ocultar_menu_pausa()

func _on_MenuPrincipal_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://scenes/Main menu.tscn")
	
func _on_Tienda_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://scenes/Tienda.tscn")
	
func _on_Reintentar_pressed():
	
	get_tree().paused = false  # Quitamos pausa para reiniciar bien
	get_tree().reload_current_scene()
