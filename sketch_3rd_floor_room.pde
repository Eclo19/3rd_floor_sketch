// Let's say 1 ft = 25 pixels
int ft_pxl_conversion = 25;

float ft_to_pixel (float ft)
{
  return ft * ft_pxl_conversion; // Convert feet to pixels (1 ft = 30 pixels)
}

// Function to convert feet and inches to pixels (Useful for laser measurements)
float ft_in_to_pixel(float ft, float in) {
  float totalFeet = ft + in / 12.0; // Convert inches to feet and add to feet
  return totalFeet * ft_pxl_conversion; // Convert to pixels (1 ft = 30 pixels)
}


// Create shelves
Shelf light_shelf1;
Shelf light_shelf2;
Shelf light_shelf3;
Shelf audio_shelf;
Shelf repair_shelf;
Shelf videogame_shelf;
Shelf camera_shelf;
Shelf kit_shelf;

Shelf table; 

Shelf selectedShelf = null; // Currently selected shelf

// Create a person
Person steve;

// Create shelf colors
color audio_shelf_color = color(131, 20, 216);
color videogame_shelf_color = color(12, 125, 201);
color camera_shelf_color = color(153, 103, 30);
color kit_shelf_color = color(150, 0, 150);
color table_color = color(240, 204, 153); 

// Background color
color bgColor = color(200);

// Room dimensions
float roomX = ft_in_to_pixel(22, 10); // Room x dimension in pixels
float roomY = ft_in_to_pixel(27, 10); // Room y dimension in pixels
float roomXft = 22.83; // Room x dimension in feet
float roomYft = 27.83; // Room y dimension in feet

public void settings() {
  // Build room: 27ft x 22ft
  size(int(roomX), int(roomY));  // Set the size of the canvas
}

void setup() {
  print("Legend: \n\n");
  print("Pillars: White\n");
  print("Doors: Black\n");
  print("Light sized shelves: Dark Green\n");
  print("Audio sized shelves: Purple\n");
  print("Videogame shelf: Blue\n");
  print("Camera shelf: Light Brown\n");
  print("Kit shelf: Pink\n");
  print("Table (theoretical): Light Wood\n");
  background(bgColor); // Set the background to grey (light gray)
  
  // Initialize shelves
  
  //Lights
  light_shelf1 = new Shelf(18.75, 5, 4, 1.5, false);
  light_shelf2 = new Shelf(18.75, 8, 4, 1.5, false);
  light_shelf3 = new Shelf(18.75, 11, 4, 1.5, false);
  
  //Audio
  audio_shelf = new Shelf(19.75, 14, 3, 1.5, false);
  audio_shelf.setColor(audio_shelf_color);
  
  //Repair
  repair_shelf = new Shelf(19.75, 17, 3, 1.5, false);
  repair_shelf.setColor(audio_shelf_color);
  
  //Videogame
  videogame_shelf = new Shelf(16.75, 21, 6, 2, false);
  videogame_shelf.setColor(videogame_shelf_color);
  
  //Camera
  camera_shelf = new Shelf(18.75, 25.75, 4, 2, false);
  camera_shelf.setColor(camera_shelf_color);
  
  //Kit
  kit_shelf = new Shelf(14.5, 25.75, 4, 2, false);
  kit_shelf.setColor(kit_shelf_color);
  
  //Table 
  table = new Shelf(10, 10, 6, 3, true);
  table.setColor(table_color);
  

  // Initialize the person
  steve = new Person(4,4, 0.45, 1.9, 0.9);  // x, y, head_radius, shoulder_width, shoulder_depth
}

void draw() {
  // Draw the grid of 1x1 ft squares
  stroke(150); // Set grid line color to light gray
  fill(bgColor); // Set fill color to the background color (same as the room)
  for (float x = 0; x <= roomX; x++) {
    for (float y = 0; y <= roomY; y++) {
      rect(ft_to_pixel(x), ft_to_pixel(y), ft_to_pixel(1), ft_to_pixel(1)); // Draw each 1x1 ft square
    }
  }
  
  // Draw steady objects
  
  //Middle pillar
  fill(255); // Set fill color to white
  rect(ft_in_to_pixel(12, 8), ft_in_to_pixel(5, 11), ft_in_to_pixel(1, 8), ft_in_to_pixel(1, 8)); // Pillar
  
  // Add text 
  fill(0); // Set text color
  textSize(16); // Set text size
  textAlign(CENTER, CENTER); // Center-align the text
  text("Pillar", ft_in_to_pixel(12, 8) + 20, ft_in_to_pixel(5, 11) + 18); // Place text in the center of the square
  
  //Elevator door
  fill(0);
  rect(ft_in_to_pixel(1, 9), 0, ft_to_pixel(4), 20);
  
  // Add text 
  fill(255); // Set text color 
  textSize(16); // Set text size
  textAlign(CENTER, CENTER); // Center-align the text
  text("Elev. door", ft_in_to_pixel(1, 9) + 50, 5); // Place text in the center of the square
  
  //Add office 1
  fill(0);
  rect(0, 0, 20, ft_to_pixel(3));
  
  // Add text 
  fill(255); // Set text color 
  textSize(16); // Set text size
  textAlign(CENTER, CENTER); // Center-align the text
  text("Office 1", 30, 45); // Place text in the center of the square
  
  //Add office 2
  fill(0);
  rect(0, ft_in_to_pixel(13, 8), 20, ft_to_pixel(3));
  
  // Add text 
  fill(255); // Set text color 
  textSize(16); // Set text size
  textAlign(CENTER, CENTER); // Center-align the text
  text("Office 2", 30, ft_in_to_pixel(13, 8) + 45); // Place text in the center of the square
  
   //Add office 3
  fill(0);
  rect(0, roomY - ft_in_to_pixel(7, 8), 20, ft_to_pixel(3));
  
  // Add text 
  fill(255); // Set text color 
  textSize(16); // Set text size
  textAlign(CENTER, CENTER); // Center-align the text
  text("Office 3", 30,  roomY - ft_in_to_pixel(7, 8) + 45); // Place text in the center of the square
  
  //Add soldering station
  fill(50, 100, 20);
  rect(roomX - ft_in_to_pixel(5, 1), 0, ft_in_to_pixel(5, 1), ft_in_to_pixel(2, 1));
  
  // Add text 
  fill(255); // Set text color
  textSize(16); // Set text size
  textAlign(CENTER, CENTER); // Center-align the text
  text("Soldering", roomX - ft_in_to_pixel(5, 1) + 60, 25); // Place text in the center of the square
  
  // Add sink area
  fill(50, 100, 20);
  rect(roomX - ft_in_to_pixel(8, 0) - ft_in_to_pixel(7, 0), 0, ft_in_to_pixel(7, 0), ft_in_to_pixel(2, 1));
  
  //Add text
  fill(255); // Set text color 
  textSize(16); // Set text size
  textAlign(CENTER, CENTER); // Center-align the text
  text("Sink", roomX - ft_in_to_pixel(8, 0) - ft_in_to_pixel(7, 0) + 85, 25); // Place text in the center of the square
  
  // Add sink pillar
  fill(255);
  rect(roomX - ft_in_to_pixel(8, 0), 0, ft_in_to_pixel(3, 0), ft_in_to_pixel(2, 1));
  
  //Add text
  fill(0); // Set text color 
  textSize(16); // Set text size
  textAlign(CENTER, CENTER); // Center-align the text
  text("Pillar", roomX - ft_in_to_pixel(8, 0) + 40 , 25); // Place text in the center of the square
  
  // Add public door
  fill(0);
  rect(ft_in_to_pixel(1, 6), roomY - 20, ft_to_pixel(3), 20);
  
  //Add text
  fill(255); // Set text color 
  textSize(16); // Set text size
  textAlign(CENTER, CENTER); // Center-align the text
  text("Pub. door", ft_in_to_pixel(1, 6) + 37, roomY - 10); // Place text in the center of the square
  
  // Add public door
  fill(230);
  rect(ft_in_to_pixel(4, 9), roomY - 20, ft_to_pixel(3), 20);
  
  //Add text
  fill(0); // Set text color 
  textSize(16); // Set text size
  textAlign(CENTER, CENTER); // Center-align the text
  text("Mirror", ft_in_to_pixel(4, 9) + 40, roomY - 10); // Place text in the center of the square
  
  // Add pillar near mirror
  fill(255);
  rect(ft_in_to_pixel(1, 9) + ft_in_to_pixel(1, 6) + ft_in_to_pixel(3, 0) + ft_in_to_pixel(1, 8), roomY - ft_in_to_pixel(2, 9), ft_in_to_pixel(1, 8), ft_in_to_pixel(2, 9));
  
  //Add text
  fill(0); // Set text color 
  textSize(16); // Set text size
  textAlign(CENTER, CENTER); // Center-align the text
  text("Pillar",ft_in_to_pixel(1, 9) + ft_in_to_pixel(1, 6) + ft_in_to_pixel(3, 0) + ft_in_to_pixel(1, 8) + 20,roomY - ft_in_to_pixel(2, 9) + 40); // Place text in the center of the square
  
  // If a shelf is selected, update its position to follow the mouse
  if (selectedShelf != null) {
    selectedShelf.updatePosition(mouseX, mouseY);
  }

  // If the person is selected, update its position to follow the mouse
  if (steve.isSelected) {
    steve.updatePosition(mouseX, mouseY);
  }
  
  // Draw shelves
  light_shelf1.draw();
  light_shelf2.draw();
  light_shelf3.draw();
  audio_shelf.draw();
  repair_shelf.draw();
  videogame_shelf.draw();
  camera_shelf.draw();
  kit_shelf.draw();
  
  //Draw table
  table.draw();
  
  // Draw the person
  steve.draw();
}

void mousePressed() {
  if (selectedShelf == null && !steve.isSelected) {
    // Check if any steve is clicked to select it
    if (steve.isMouseOverShoulders()) {  // Check if the shoulders are clicked
      steve.isSelected = true;
    }
    //Check if any of the shelves are selected 
    else if (light_shelf1.isMouseOver()) selectShelf(light_shelf1);
    else if (light_shelf2.isMouseOver()) selectShelf(light_shelf2);
    else if (light_shelf3.isMouseOver()) selectShelf(light_shelf3);
    else if (audio_shelf.isMouseOver()) selectShelf(audio_shelf);
    else if (repair_shelf.isMouseOver()) selectShelf(repair_shelf);
    else if (videogame_shelf.isMouseOver()) selectShelf(videogame_shelf);
    else if (camera_shelf.isMouseOver()) selectShelf(camera_shelf);
    else if (kit_shelf.isMouseOver()) selectShelf(kit_shelf);
    else if (table.isMouseOver()) selectShelf(table);
    
  } else {
    // Place the selected shelf in its current grid position
    placeShelf();
    steve.isSelected = false;  // Deselect person
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
    } else if (steve.isSelected) {
      steve.rotate(); // Toggle rotation for the person
    }
  }
}
