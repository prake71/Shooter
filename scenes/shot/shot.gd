extends Area2D

const SCREEN_WIDTH = 320
const MOVE_SPEED = 500.0

func _process(delta):
#	# Called every frame. Delta is time since last frame.
	position += Vector2(MOVE_SPEED * delta, 0.0)
	if position.x >= SCREEN_WIDTH + 8:
		queue_free()


func _on_shot_area_entered(area):
	if area.is_in_group("asteroids"):
		self.queue_free()
		