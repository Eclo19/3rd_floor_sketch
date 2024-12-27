// Conversion factor for feet to pixels
int ft_pxl_conversion = 25;

float ft_to_pixel(float ft) {
  return ft * ft_pxl_conversion; // Convert feet to pixels
}

// Function to convert feet and inches to pixels
float ft_in_to_pixel(float ft, float in) {
  float totalFeet = ft + in / 12.0; // Convert inches to feet and add
  return totalFeet * ft_pxl_conversion; // Convert to pixels
}

// PGraphics layers
PGraphics gridLayer, staticTextLayer, staticObjectsLayer;

// Create shelves
Shelf light_shelf1, light_shelf2, light_shelf3;
Shelf audio_shelf, repair_shelf, videogame_shelf, camera_shelf, kit_shelf, table;
Shelf selectedShelf = null; // Currently selected shelf

// Create a person
Person steve;

// Shelf colors
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

// Table dimensions in feet
float table_width = 12;
float table_depth = 5;

public void settings() {
  size(int(roomX), int(roomY)); // Room size
}

void setup() {
  
  //Print Legend
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
  
  // Initialize PGraphics layers
  gridLayer = createGraphics(width, height);
  staticTextLayer = createGraphics(width, height);
  staticObjectsLayer = createGraphics(width, height);

  // Draw static layers
  drawGrid();
  drawStaticObjects();
  drawStaticText();

  // Initialize shelves
  light_shelf1 = new Shelf(18.75, 5, 4, 1.5, false);
  light_shelf2 = new Shelf(18.75, 8, 4, 1.5, false);
  light_shelf3 = new Shelf(18.75, 11, 4, 1.5, false);
  audio_shelf = new Shelf(19.75, 14, 3, 1.5, false);
  audio_shelf.setColor(audio_shelf_color);
  repair_shelf = new Shelf(19.75, 17, 3, 1.5, false);
  repair_shelf.setColor(audio_shelf_color);
  videogame_shelf = new Shelf(16.75, 21, 6, 2, false);
  videogame_shelf.setColor(videogame_shelf_color);
  camera_shelf = new Shelf(18.75, 25.75, 4, 2, false);
  camera_shelf.setColor(camera_shelf_color);
  kit_shelf = new Shelf(14.5, 25.75, 4, 2, false);
  kit_shelf.setColor(kit_shelf_color);
  table = new Shelf(10, 10, table_width, table_depth, true);
  table.setColor(table_color);

  // Initialize the person
  steve = new Person(4, 4, 0.45, 1.9, 0.9); // x, y, head_radius, shoulder_width, shoulder_depth
}

void drawGrid() {
  gridLayer.beginDraw();
  gridLayer.stroke(150);
  gridLayer.fill(bgColor);
  for (float x = 0; x <= roomX / ft_pxl_conversion; x++) { // Iterate in feet
    for (float y = 0; y <= roomY / ft_pxl_conversion; y++) {
      gridLayer.rect(ft_to_pixel(x), ft_to_pixel(y), ft_to_pixel(1), ft_to_pixel(1));
    }
  }
  gridLayer.endDraw();
}

void drawStaticObjects() {
  staticObjectsLayer.beginDraw();

  // Pillar
  staticObjectsLayer.fill(255);
  staticObjectsLayer.rect(ft_in_to_pixel(12, 8), ft_in_to_pixel(5, 11), ft_in_to_pixel(1, 8), ft_in_to_pixel(1, 8));

  // Elevator door
  staticObjectsLayer.fill(0);
  staticObjectsLayer.rect(ft_in_to_pixel(1, 9), 0, ft_to_pixel(4), ft_to_pixel(1));

  // Offices
  staticObjectsLayer.fill(0);
  staticObjectsLayer.rect(0, 0, ft_to_pixel(0.8), ft_to_pixel(3)); // Office 1
  staticObjectsLayer.rect(0, ft_in_to_pixel(13, 8), ft_to_pixel(0.8), ft_to_pixel(3)); // Office 2
  staticObjectsLayer.rect(0, roomY - ft_in_to_pixel(7, 8), ft_to_pixel(0.8), ft_to_pixel(3)); // Office 3

  // Soldering station
  staticObjectsLayer.fill(50, 100, 20);
  staticObjectsLayer.rect(roomX - ft_in_to_pixel(5, 1), 0, ft_in_to_pixel(5, 1), ft_in_to_pixel(2, 1));

  // Sink area
  staticObjectsLayer.rect(roomX - ft_in_to_pixel(8, 0) - ft_in_to_pixel(7, 0), 0, ft_in_to_pixel(7, 0), ft_in_to_pixel(2, 1));

  // Sink pillar
  staticObjectsLayer.fill(255);
  staticObjectsLayer.rect(roomX - ft_in_to_pixel(8, 0), 0, ft_in_to_pixel(3, 0), ft_in_to_pixel(2, 1));

  // Public door
  staticObjectsLayer.fill(0);
  staticObjectsLayer.rect(ft_in_to_pixel(1, 6), roomY - ft_to_pixel(1), ft_to_pixel(3), ft_to_pixel(0.8));

  // Mirror
  staticObjectsLayer.fill(230);
  staticObjectsLayer.rect(ft_in_to_pixel(4, 9), roomY - ft_to_pixel(1), ft_to_pixel(3), ft_to_pixel(0.8));

  // Pillar near mirror
  staticObjectsLayer.fill(255);
  staticObjectsLayer.rect(ft_in_to_pixel(1, 9) + ft_in_to_pixel(1, 6) + ft_in_to_pixel(3, 0) + ft_in_to_pixel(1, 8),
    roomY - ft_in_to_pixel(2, 9), ft_in_to_pixel(1, 8), ft_in_to_pixel(2, 9));

  staticObjectsLayer.endDraw();
}

void drawStaticText() {
  staticTextLayer.beginDraw();
  staticTextLayer.textSize(16);
  staticTextLayer.textAlign(CENTER, CENTER);

  // Pillar
  staticTextLayer.fill(0);
  staticTextLayer.text("Pillar", ft_in_to_pixel(12, 8) + ft_in_to_pixel(0.5, 0) + 8, ft_in_to_pixel(5, 11) + ft_in_to_pixel(0.5, 0) + 7);

  // Elevator door
  staticTextLayer.fill(255);
  staticTextLayer.text("Elev. door", ft_in_to_pixel(1, 9) + ft_to_pixel(2), ft_to_pixel(0.5));

  // Offices
  staticTextLayer.text("Office 1", ft_to_pixel(0.4) + 20, ft_to_pixel(1.5)); // Office 1
  staticTextLayer.text("Office 2", ft_to_pixel(0.4) + 20, ft_in_to_pixel(13, 8) + ft_to_pixel(1.5)); // Office 2
  staticTextLayer.text("Office 3", ft_to_pixel(0.4) + 20, roomY - ft_in_to_pixel(7, 8) + ft_to_pixel(1.5)); // Office 3

  // Soldering station
  staticTextLayer.text("Soldering", roomX - ft_in_to_pixel(5, 1) + ft_to_pixel(2.5), ft_to_pixel(1));

  // Sink area
  staticTextLayer.text("Sink", roomX - ft_in_to_pixel(8, 0) - ft_in_to_pixel(3.5, 0), ft_to_pixel(1));

  // Public door
  staticTextLayer.text("Pub. door", ft_in_to_pixel(1, 6) + ft_to_pixel(1.5), roomY - ft_to_pixel(0.5));

  // Mirror
  staticTextLayer.fill(0);
  staticTextLayer.text("Mirror", ft_in_to_pixel(4, 9) + ft_to_pixel(1.5), roomY - ft_to_pixel(0.5) - 5);

  staticTextLayer.endDraw();
}

void draw() {
  background(bgColor);
  image(gridLayer, 0, 0); // Draw grid
  image(staticObjectsLayer, 0, 0); // Draw static objects
  image(staticTextLayer, 0, 0); // Draw static text

  // If a shelf is selected, update its position
  if (selectedShelf != null) {
    selectedShelf.updatePosition(mouseX, mouseY);
  }

  // If the person is selected, update its position
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
  table.draw();

  // Draw the person
  steve.draw();
}

void mousePressed() {
  if (selectedShelf == null && !steve.isSelected) {
    if (steve.isMouseOverShoulders()) {
      steve.isSelected = true;
    } else if (light_shelf1.isMouseOver()) selectShelf(light_shelf1);
    else if (light_shelf2.isMouseOver()) selectShelf(light_shelf2);
    else if (light_shelf3.isMouseOver()) selectShelf(light_shelf3);
    else if (audio_shelf.isMouseOver()) selectShelf(audio_shelf);
    else if (repair_shelf.isMouseOver()) selectShelf(repair_shelf);
    else if (videogame_shelf.isMouseOver()) selectShelf(videogame_shelf);
    else if (camera_shelf.isMouseOver()) selectShelf(camera_shelf);
    else if (kit_shelf.isMouseOver()) selectShelf(kit_shelf);
    else if (table.isMouseOver()) selectShelf(table);
  } else {
    placeShelf();
    steve.isSelected = false;
  }
}

void selectShelf(Shelf shelf) {
  if (selectedShelf != null) {
    selectedShelf.isSelected = false;
  }
  shelf.isSelected = true;
  selectedShelf = shelf;
}

void placeShelf() {
  if (selectedShelf != null) {
    selectedShelf.isSelected = false;
    selectedShelf = null;
  }
}

void keyPressed() {
  if (key == 'R' || key == 'r') {
    if (selectedShelf != null) {
      selectedShelf.rotate_shelf();
    } else if (steve.isSelected) {
      steve.rotate();
    }
  }
}
