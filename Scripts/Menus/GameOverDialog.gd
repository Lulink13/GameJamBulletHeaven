extends Panel # or PopupPanel

signal retry_pressed
signal quit_pressed

func _ready():
	# Center the dialog on screen
	position = get_viewport_rect().size / 2 - size / 2
	# Hide dialog by default
	hide()

func _on_retry_button_pressed():
	emit_signal("retry_pressed")
	queue_free()

func _on_quit_button_pressed():
	emit_signal("quit_pressed")
	queue_free()
