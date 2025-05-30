extends Label

func _ready():
	var font = DynamicFont.new()
	font.font_data = load("res://images/VCR_OSD_MONO_1.001.ttf")
	font.size = 50
	add_font_override("font", font)
	text = "Huevos atrapados: 0"




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
