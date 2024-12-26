class Shelf {
  float x, y;  // Position of the shelf (origin coordinates)
  float wdth, depth;  // Dimensions of the shelf
  float r = 10;  // Corner radius
  color fill_shelf = color(40, 50, 20); // Default fill color (black)
  boolean rotate; // Flag to determine if the shelf should be rotated
  boolean isSelected = false; // Flag to check if the shelf is selected
  float precision= 0.25; // fraction of a foot that object can snap to in grid
    
  
  // Constructor to initialize the shelf's properties
  Shelf(float x, float y, float wdth, float depth, boolean rotate) {
    this.x = x;
    this.y = y;
    
    if (rotate) {
      this.wdth = depth;
      this.depth = wdth;
    } else {
      this.wdth = wdth;
      this.depth = depth;
    }
  }
  
  // Method to rotate the shelf
  void rotate_shelf() {
    float temp = wdth;
    wdth = depth;
    depth = temp;
  }
  
  // Method to draw the shelf
  void draw() {
    if (isSelected) {
      stroke(255, 0, 0); // Red stroke if the shelf is selected
    } else {
      noStroke(); // No border for unselected shelves
    }
    fill(fill_shelf); // Set fill color to the current color
    rect(ft_to_pixel(x), ft_to_pixel(y), ft_to_pixel(wdth), ft_to_pixel(depth), r);
  }
  
  // Check if a point (mouseX, mouseY) is inside the shelf
  boolean isMouseOver() {
    float px = mouseX / ft_to_pixel(1); // Convert mouseX to feet
    float py = mouseY / ft_to_pixel(1); // Convert mouseY to feet
    return (px >= x && px <= x + wdth && py >= y && py <= y + depth);
  }
  
  // Update shelf position (snap to 0.5x0.5 ft grid)
  void updatePosition(float mouseX, float mouseY) {
    x = round((mouseX - 4) / ft_to_pixel(precision)) * precision; // Quantize to precision
    y = round((mouseY - 4) / ft_to_pixel(precision)) * precision;
  }
  
  // Method to change the color of the shelf
  void setColor(color newColor) {
    fill_shelf = newColor;
  }
}
