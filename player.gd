extends CharacterBody2D

@export var speed = 300 
@export var gravity = 30
@export var jump_force = 300 

@onready var ap = $AnimationPlayer
@onready var sprite = $Sprite2D

func _physics_process(delta):
	if !is_on_floor():
		velocity.y += gravity
		if velocity.y > 1000:
			velocity.y = 1000

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force

	var horizontal_direction = Input.get_axis("move_left", "move_right")
	
	velocity.x = speed * horizontal_direction

	if horizontal_direction != 0:
		sprite.flip_h = (horizontal_direction == -1)

	move_and_slide()

	update_animations(horizontal_direction)

func update_animations(horizontal_direction):
	if is_on_floor():
		if horizontal_direction == 0:
			ap.play("idle")
		else: 
			ap.play("run")
	else:	
		if velocity.y < 0:
			ap.play("jump")
		elif velocity.y > 0: 
			ap.play("fall")

			

var score = 0

# Function to increase the player's score
func add_score(value):
	score += value
	get_parent().add_score(value)  # Update the score in the main scene