class Person {
  float x, y;  // Position (center of shoulders)
  float head_radius;  // Radius of the circular head
  float shoulder_width, shoulder_depth;  // Dimensions of the rectangular shoulders
  boolean isSelected = false;  // Whether the person is selected
  boolean isRotated = false;  // Rotation state
  float precision= 0.25; // fraction of a foot that object can snap to in grid
  
  float sideway1 = QUARTER_PI; // Initial angle for the hair arc
  float sideway2 = TWO_PI - QUARTER_PI; // Initial angle for the hair arc

  // Constructor to initialize the person's properties
  Person(float x, float y, float head_radius, float shoulder_width, float shoulder_depth) {
    this.x = x;
    this.y = y;
    this.head_radius = head_radius;
    this.shoulder_width = shoulder_width;
    this.shoulder_depth = shoulder_depth;
  }

  // Method to draw the person
  void draw() {
    // Highlight if selected
    if (isSelected) {
      stroke(255, 0, 0);  // Red stroke if selected
    } else {
      noStroke();  // No stroke otherwise
    }

    // Draw shoulders
    fill(14, 174, 174);  
    rect(ft_to_pixel(x - shoulder_width / 2), ft_to_pixel(y - shoulder_depth / 2),
         ft_to_pixel(shoulder_width), ft_to_pixel(shoulder_depth));

    // Draw head
    fill(169, 125, 100);  // Light skin tone for head
    ellipse(ft_to_pixel(x), ft_to_pixel(y + 0.2 * head_radius),
            ft_to_pixel(head_radius * 2), ft_to_pixel(head_radius * 2));

    // Draw hair
    fill(63, 41, 10);  // Black color for hair
    arc(ft_to_pixel(x), ft_to_pixel(y + 0.2 * head_radius), 
        ft_to_pixel(head_radius * 1.8), ft_to_pixel(head_radius * 1.8), 
        sideway1, sideway2, CHORD);
  }

  // Method to rotate the person (swap width and depth of shoulders)
  void rotate() {
    float temp = shoulder_width;
    shoulder_width = shoulder_depth;
    shoulder_depth = temp;
    
    // Change the angles for the hair arc based on rotation state
    if (isRotated) {
      sideway1 = QUARTER_PI + HALF_PI; // Hair arc starts from the bottom
      sideway2 = TWO_PI - QUARTER_PI + HALF_PI; // Hair arc ends at the top
    } else {
      sideway1 = QUARTER_PI; // Hair arc starts at top-right
      sideway2 = TWO_PI - QUARTER_PI; // Hair arc ends at top-left
    }
    
    isRotated = !isRotated; // Update rotation state
  }

  // Check if the mouse is over the shoulders
  boolean isMouseOverShoulders() {
    float px = mouseX / ft_to_pixel(1);  // Convert mouseX to feet
    float py = mouseY / ft_to_pixel(1);  // Convert mouseY to feet
  
    // Check if the mouse position is within the shoulder rectangle
    return (px >= x - shoulder_width / 2 && px <= x + shoulder_width / 2 &&
            py >= y - shoulder_depth / 2 && py <= y + shoulder_depth / 2);
  }

  // Update person position (snap to grid)
  void updatePosition(float mouseX, float mouseY) {
    x = round((mouseX - 4) / ft_to_pixel(precision)) * precision;  // Quantize to nearest 0.5 ft grid square
    y = round((mouseY - 4) / ft_to_pixel(precision)) * precision;
  }
}
