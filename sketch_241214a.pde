import processing.serial.*; 
import java.io.IOException;

Serial myPort;

String angle = "";
String distance = "";
String data = "";

String noObject;

float pixsDistance;

int iAngle = 0, iDistance = 0;

int index1 = 0;

PFont orcFont;

void setup() {
  size(1440, 900);  // Adjust to your screen resolution
  smooth();
  println(Serial.list());  // List available serial ports for debugging
  myPort = new Serial(this, "/dev/tty.usbmodem1301", 9600);  // Change to your port
  myPort.bufferUntil('.');  // Serial data ends with a '.'
}

void draw() {
  fill(98, 245, 31);
  
  noStroke();
  
  fill(0, 4); 
  rect(0, 0, width, height-height * 0.065); 
  
  fill(98, 245, 31); // Green color

  drawRadar(); 
  drawLine();
  drawObject();
  drawText();
}

void serialEvent(Serial myPort) {
  data = myPort.readStringUntil('.');
  if (data != null) {
    data = data.trim();  // Remove extra spaces or newlines
    index1 = data.indexOf(",");
    if (index1 > 0) {
      try {
        angle = data.substring(0, index1);  // Extract angle
        distance = data.substring(index1 + 1);  // Extract distance
        
        iAngle = int(angle);  // Convert to integer
        iDistance = int(distance);  // Convert to integer

        // Constrain values to valid ranges
        iAngle = constrain(iAngle, 0, 180);
        iDistance = constrain(iDistance, 0, 40);
      } catch (Exception e) {
        println("Error parsing data: " + data);
      }
    }
  }
}

void drawRadar() {
  pushMatrix();
  translate(width / 2, height - height * 0.074);
  noFill();
  strokeWeight(2);
  stroke(98, 245, 31);
  
  // Draw concentric arcs
  arc(0, 0, (width - width * 0.0625), (width - width * 0.0625), PI, TWO_PI);
  arc(0, 0, (width - width * 0.27), (width - width * 0.27), PI, TWO_PI);
  arc(0, 0, (width - width * 0.479), (width - width * 0.479), PI, TWO_PI);
  arc(0, 0, (width - width * 0.687), (width - width * 0.687), PI, TWO_PI);
  
  // Draw angle lines
  line(-width / 2, 0, width / 2, 0);    
  for (int i = 30; i <= 150; i += 30) {
    line(0, 0, (-width / 2) * cos(radians(i)), (-width / 2) * sin(radians(i)));
  }
  popMatrix();
}

void drawObject() {
  pushMatrix();
  translate(width / 2, height - height * 0.074);
  strokeWeight(9);
  stroke(255, 10, 10);  // Red for detected objects
  
  pixsDistance = iDistance * ((height - height * 0.1666) * 0.025);  // Convert distance to pixels
  
  if (iDistance < 40) {
    line(pixsDistance * cos(radians(iAngle)), -pixsDistance * sin(radians(iAngle)), 
         (width - width * 0.505) * cos(radians(iAngle)), -(width - width * 0.505) * sin(radians(iAngle)));
  }
  popMatrix();
}

void drawLine() {
  pushMatrix();
  strokeWeight(9);
  stroke(30, 250, 60);  // Green color
  translate(width / 2, height - height * 0.074); 
  line(0, 0, (height - height * 0.12) * cos(radians(iAngle)), -(height - height * 0.12) * sin(radians(iAngle)));
  popMatrix();
}

void drawText() { 
  pushMatrix();
  if (iDistance > 40) {
    noObject = "Out of Range";
  } else {
    noObject = "In Range";
  }

  fill(0, 0, 0);
  noStroke();
  rect(0, height - height * 0.0648, width, height);
  fill(98, 245, 31);
  textSize(25);
  
  text("10cm", width - width * 0.3854, height - height * 0.0833);
  text("20cm", width - width * 0.281, height - height * 0.0833);
  text("30cm", width - width * 0.177, height - height * 0.0833);
  text("40cm", width - width * 0.0729, height - height * 0.0833);
  textSize(40);
  text("Angle:  " + iAngle + " °", width - width * 0.48, height - height * 0.0277);
  text("Distance:  ", width - width * 0.26, height - height * 0.0277);
 
  if (iDistance < 40) {
    text("             " + iDistance + " cm", width - width * 0.225, height - height * 0.0277);
    fill(255, 10, 10);
    text("WARNING!", width - width * 0.875, height - height * 0.0277);
  }
  
  textSize(25);
  fill(98, 245, 60);
  
  // Angle labels
  float angleStep = 30;
  for (int i = 30; i <= 150; i += 30) {
    pushMatrix();
    translate((width - width * 0.4994) + width / 2 * cos(radians(i)), 
             (height - height * 0.0907) - width / 2 * sin(radians(i)));
    rotate(-radians(i - 90));
    text(i + "°", 0, 0);
    popMatrix();
  }
  popMatrix(); 
}
