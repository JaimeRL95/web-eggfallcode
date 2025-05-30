extends Label


func _ready():
	var font = DynamicFont.new()
	font.font_data = load("res://images/VCR_OSD_MONO_1.001.ttf")
	font.size = 30
	add_font_override("font", font)

