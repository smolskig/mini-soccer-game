extends Control

func _ready():
	pass
func _process(delta):
	$p1.text = str($"/root/Global".p1)
	$p2.text = str($"/root/Global".p2)
