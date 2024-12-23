// Let's say 1 ft is 30 pixels
float ft_to_pixel (float ft)
{
  return ft * 30; // Convert feet to pixels (1 ft = 30 pixels)
}

// Create shelves
Shelf light_shelf1;
Shelf light_shelf2;
Shelf light_shelf3;
Shelf audio_shelf;
Shelf repair_shelf;
Shelf selectedShelf = null; // Currently selected shelf

//Create shelf colors
color audio_shelf_color = color(131, 20, 216);

// Background color
color bgColor = color(200);

// Room dimensions
float roomX = ft_to_pixel(27); // Room x dimension in pixels
float roomY = ft_to_pixel(22); // Room y dimension in pixels
float roomXft = 27; // Room x dimension in feet
float roomYft = 22; // Room y dimension in feet

public void settings() {
  // Build room: 27ft x 22ft
  size(int(roomX), int(roomY));  // Set the size of the canvas
}

void setup() {
  
  print("Legend: \n");
  print("Light siezed shelves: Black\n");
  print("Audio siezed shelves: Purple\n");
  background(bgColor); // Set the background to grey (light gray)
  
  // Initialize shelves
  light_shelf1 = new Shelf(0, roomYft - 4, 4, 1.5, true);
  light_shelf2 = new Shelf(5, roomYft - 4, 4, 1.5, true);
  light_shelf3 = new Shelf(10, roomYft - 4, 4, 1.5, true);
  
  audio_shelf = new Shelf(15, roomYft - 3, 3, 1.5, true);
  audio_shelf.setColor(audio_shelf_color);
  
  repair_shelf = new Shelf(20, roomYft - 3, 3, 1.5, true);
  repair_shelf.setColor(audio_shelf_color);
}

void draw() {
  // Draw the grid of 1x1 ft squares
  stroke(150); // Set grid line color to light gray
  fill(bgColor); // Set fill color to the background color (same as the room)
  for (float x = 0; x <= 27; x++) {
    for (float y = 0; y <= 22; y++) {
      rect(ft_to_pixel(x), ft_to_pixel(y), ft_to_pixel(1), ft_to_pixel(1)); // Draw each 1x1 ft square
    }
  }
  
  // Draw steady objects
  fill(255); // Set fill color to white
  rect(ft_to_pixel(20), ft_to_pixel(12), ft_to_pixel(2), ft_to_pixel(2)); // Pillar
  
  // Add "Pillar" text 
  fill(0); // Set text color to black
  textSize(16); // Set text size
  textAlign(CENTER, CENTER); // Center-align the text
  text("Pillar", ft_to_pixel(21), ft_to_pixel(13)); // Place text in the center of the square
  
  // If a shelf is selected, update its position to follow the mouse
  if (selectedShelf != null) {
    selectedShelf.updatePosition(mouseX, mouseY);
  }
  
  // Draw shelves
  light_shelf1.draw();
  light_shelf2.draw();
  light_shelf3.draw();
  audio_shelf.draw();
  repair_shelf.draw();
}

void mousePressed() {
  if (selectedShelf == null) {
    // Check if any shelf is clicked to select it
    if (light_shelf1.isMouseOver()) selectShelf(light_shelf1);
    else if (light_shelf2.isMouseOver()) selectShelf(light_shelf2);
    else if (light_shelf3.isMouseOver()) selectShelf(light_shelf3);
    else if (audio_shelf.isMouseOver()) selectShelf(audio_shelf);
    else if (repair_shelf.isMouseOver()) selectShelf(repair_shelf);
  } else {
    // Place the selected shelf in its current grid position
    placeShelf();
  }
}

void selectShelf(Shelf shelf) {
  // Deselect the currently selected shelf if any
  if (selectedShelf != null) {
    selectedShelf.isSelected = false;
  }
  // Select the new shelf
  shelf.isSelected = true;
  selectedShelf = shelf;
}

void placeShelf() {
  if (selectedShelf != null) {
    // Deselect the selected shelf
    selectedShelf.isSelected = false;
    selectedShelf = null;
  }
}

void keyPressed() {
  // Rotate the selected shelf if "R" is pressed
  if (key == 'R' || key == 'r') {
    if (selectedShelf != null) {
      selectedShelf.rotate_shelf();
    }
  }
}
