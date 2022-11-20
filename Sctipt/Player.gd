extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()

#func _ready():
#	self.hp = 90
#	sdset_start_hp(self.hp, self.max_hp)

func get_input():
	velocity = Vector2()
	$CollisionPolygon2D/AnimatedSprite.play("idle")
	if velocity.x >= 0: 
		if Input.is_action_pressed("right"):
			velocity.x += speed
			$CollisionPolygon2D/AnimatedSprite.play("run")
			$CollisionPolygon2D/AnimatedSprite.flip_h = false
		if Input.is_action_pressed("left"):
			velocity.x -= speed
			$CollisionPolygon2D/AnimatedSprite.play("run")
			$CollisionPolygon2D/AnimatedSprite.flip_h = true
		if Input.is_action_pressed("down"):
			velocity.y += speed
			$CollisionPolygon2D/AnimatedSprite.play("run")
		if Input.is_action_pressed("up"):
			velocity.y -= speed
			$CollisionPolygon2D/AnimatedSprite.play("run")
#	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
