extends Node2D

# Reference to the score label
@onready var score_label = $CanvasLayer/Label

# Player score variable
var score = 0

# Function to increase the score
func add_score(value):
	score += value
	update_score_label()

# Function to update the score label text
func update_score_label():
	score_label.text = "Score: " + str(score)

# Called when the node enters the scene tree for the first time.
func _ready():
	update_score_label()  # Make sure the score label is updated when the game starts
