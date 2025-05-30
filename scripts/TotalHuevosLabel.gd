extends Label



func _ready():
	var font = DynamicFont.new()
	var font_file = load("res://images/VCR_OSD_MONO_1.001.ttf")
	if font_file:
		font.font_data = font_file
		font.size = 50
		add_font_override("font", font)
	else:
		print("⚠️ No se encontró la fuente TTF.")
