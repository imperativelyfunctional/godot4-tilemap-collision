extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -350.0

@onready
var animationPlayer:AnimationPlayer = get_node("AnimationPlayer")

@onready
var sprite: Sprite2D = get_node("Sprite2D")

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	animationPlayer.play("idle")

func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if Input.is_action_just_pressed("Up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_pressed("Right"):
		sprite.flip_h = false
		velocity.x = SPEED
		animationPlayer.play("walk")
	
	if Input.is_action_pressed("Left"):
		sprite.flip_h = true
		velocity.x = -SPEED
		animationPlayer.play("walk")	

	if Input.is_action_just_released("Right") || Input.is_action_just_released("Left"):
		velocity.x = 0
		animationPlayer.play("idle")
	
	move_and_slide()
