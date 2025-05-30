extends CanvasLayer

onready var fondo_menu = $Fondomenu

var animando = false
var velocidad = 600
var objetivo_y = 200  

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	visible = false
	if fondo_menu:
		fondo_menu.visible = false
		fondo_menu.rect_position.y = -fondo_menu.rect_size.y
		fondo_menu.rect_min_size = Vector2(400, 300)


func mostrar_game_over():
	visible = true
	if fondo_menu:
		fondo_menu.visible = true
		animando = true

func _process(delta):
	if animando and fondo_menu:
		var pos = fondo_menu.rect_position
		if pos.y < objetivo_y:
			pos.y += velocidad * delta
			if pos.y > objetivo_y:
				pos.y = objetivo_y
			fondo_menu.rect_position = pos
		else:
			animando = false


func _on_Reintentar_pressed():
	get_tree().paused = false  # Quitamos pausa para reiniciar bien
	get_tree().reload_current_scene()

func _on_MenuPrincipal_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://scenes/Main menu.tscn")

func _on_Tienda_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://scenes/Tienda.tscn")
func _input(event):
	if event is InputEventMouseButton and event.pressed:
		var pos = event.position
		# Ahora chequeas si la posición del clic está dentro de algún botón
	   

