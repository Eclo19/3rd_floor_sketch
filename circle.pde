// Circle Class
class Circle {
  float x, y, diameter; // Position and size
  boolean isSelected = false;
  float precision = 0.1; // Precision in feet for quantization

  Circle(float x, float y) {
    this.x = x;
    this.y = y;
    this.diameter = ft_to_pixel(3);
  }

  void draw() {
    if (isSelected) {
      stroke(255, 0, 0); // Red stroke if selected
    } else {
      noStroke();
    }
    fill(240, 240, 50); // Black outer circle
    ellipse(ft_to_pixel(x), ft_to_pixel(y), diameter, diameter);
    fill(255); // White inner circle
    ellipse(ft_to_pixel(x), ft_to_pixel(y), diameter * 0.3, diameter * 0.3);
  }

  boolean isMouseOver() {
    float px = mouseX / ft_to_pixel(1);
    float py = mouseY / ft_to_pixel(1);
    float dx = px - x;
    float dy = py - y;
    return sqrt(dx * dx + dy * dy) <= diameter / ft_to_pixel(2);
  }

  void updatePosition(float mouseX, float mouseY) {
    // Quantize x and y positions to the nearest 'precision' feet
    x = round((mouseX / ft_to_pixel(1)) / precision) * precision;
    y = round((mouseY / ft_to_pixel(1)) / precision) * precision;
  }
}
