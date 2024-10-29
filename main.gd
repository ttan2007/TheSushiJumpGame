extends Node  # or Control, depending on your scene setup

# Reference to the Label node (adjust path to match your scene hierarchy)
@onready var score_label = $Player/Label

# Score variable
var score = 0

# Function to increase the score
func add_score(value):
	score += value
	update_score_label()

# Function to update the Label text
func update_score_label():
	score_label.text = "You have " + str(score) + " Sushi!"

# Initialize the label with the starting score
func _ready():
	update_score_label()  # Initialize the label with the starting score
	add_score(0)  # Test: Add 10 points to the score at the start