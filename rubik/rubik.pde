import java.util.List;
import java.util.Arrays;
import java.util.Collections;

boolean help = true;

int strokeWeight = 5;

float rotateXoffset = -0.3;
float rotateYoffset = 0.2;
  
Cube cube;

void setup() {
  size(800, 600, P3D);
  strokeWeight(strokeWeight);
  textAlign(CENTER, CENTER);
  textSize(48);
  
  cube = new Cube2();
}

void keyPressed() {
  switch (key) {
    case '0':
      help = !help;
      break;
    case '1':
      cube = new Cube2();
      break;
    case '2':
      cube = new Cube3();
      break;
    case '+':
      if (cube.animationLength > 1) {
        cube.animationLength /= 4;
      }
      break;
    case '-':
      if (cube.animationLength < 64) {
        cube.animationLength *= 4;
      }
      break;
    default:
      cube.handleKey(key);
  }
}

void mouseDragged() {
  rotateXoffset += (pmouseY - mouseY) * 0.01;
  rotateYoffset += (mouseX - pmouseX) * 0.01;
}

void drawRotationHelper() {
  fill(0, 128);
  float xpos= cos(radians(mouseX / 2)) * 500;
  float ypos= -(mouseY - (height / 2)) * 3;
  float zpos= sin(radians(mouseX / 2)) * 500;
  int hoverOffset = (int)(cube.sideWidth * cube.blocks.length / 1.7);
  int inOffset = (cube.sideWidth * cube.blocks.length / 2) - (cube.sideWidth / 2) ;
  int outOffset = inOffset + (int)(cube.sideWidth * 0.8);
  
  if (ypos < -cube.sideWidth * 7) { // U helper
    rotateX(radians(90));
    text("q", -inOffset, outOffset, hoverOffset);
    text("a", -inOffset, -outOffset, hoverOffset);
    text("w", outOffset, inOffset, hoverOffset);
    text("s", -outOffset, inOffset, hoverOffset);
    text("e", inOffset, -outOffset, hoverOffset);
    text("d", inOffset, outOffset, hoverOffset);
    text("r", -outOffset, -inOffset, hoverOffset);
    text("f", outOffset, -inOffset, hoverOffset);
    rotateX(radians(-90));
    return;
  }
  if (ypos > cube.sideWidth * 7) { // D helper
    rotateX(radians(-90));
    text("q", -inOffset, outOffset, hoverOffset);
    text("a", -inOffset, -outOffset, hoverOffset);
    text("w", -outOffset, -inOffset, hoverOffset);
    text("s", outOffset, -inOffset, hoverOffset);
    text("e", inOffset, -outOffset, hoverOffset);
    text("d", inOffset, outOffset, hoverOffset);
    text("r", outOffset, inOffset, hoverOffset);
    text("f", -outOffset, inOffset, hoverOffset);
    rotateX(radians(90));
    return;
  }
  if (zpos > cube.sideWidth * 5) { // F helper
    text("q", -inOffset, outOffset, hoverOffset);
    text("a", -inOffset, -outOffset, hoverOffset);
    text("z", outOffset, inOffset, hoverOffset);
    text("h", -outOffset, inOffset, hoverOffset);
    text("e", inOffset, -outOffset, hoverOffset);
    text("d", inOffset, outOffset, hoverOffset);
    text("t", -outOffset, -inOffset, hoverOffset);
    text("g", outOffset, -inOffset, hoverOffset);
  }
  if (xpos < -cube.sideWidth * 5) { // L helper
    rotateY(radians(-90));
    text("r", -inOffset, outOffset, hoverOffset);
    text("f", -inOffset, -outOffset, hoverOffset);
    text("z", outOffset, inOffset, hoverOffset);
    text("h", -outOffset, inOffset, hoverOffset);
    text("w", inOffset, -outOffset, hoverOffset);
    text("s", inOffset, outOffset, hoverOffset);
    text("t", -outOffset, -inOffset, hoverOffset);
    text("g", outOffset, -inOffset, hoverOffset);
    rotateY(radians(90));
  }
  if (zpos < -cube.sideWidth * 5) { // B helper
    rotateY(radians(-180));
    text("e", -inOffset, outOffset, hoverOffset);
    text("d", -inOffset, -outOffset, hoverOffset);
    text("z", outOffset, inOffset, hoverOffset);
    text("h", -outOffset, inOffset, hoverOffset);
    text("q", inOffset, -outOffset, hoverOffset);
    text("a", inOffset, outOffset, hoverOffset);
    text("t", -outOffset, -inOffset, hoverOffset);
    text("g", outOffset, -inOffset, hoverOffset);
    rotateY(radians(180));
  }
  if (xpos > cube.sideWidth * 5) { // R helper
    rotateY(radians(90));
    text("w", -inOffset, outOffset, hoverOffset);
    text("s", -inOffset, -outOffset, hoverOffset);
    text("z", outOffset, inOffset, hoverOffset);
    text("h", -outOffset, inOffset, hoverOffset);
    text("r", inOffset, -outOffset, hoverOffset);
    text("f", inOffset, outOffset, hoverOffset);
    text("t", -outOffset, -inOffset, hoverOffset);
    text("g", outOffset, -inOffset, hoverOffset);
    rotateY(radians(-90));
  }
}

void draw() {
  background(192);
  float xpos= cos(radians(mouseX / 2)) * 500;
  float ypos= -(mouseY - (height / 2)) * 3;
  float zpos= sin(radians(mouseX / 2)) * 500;
  camera(xpos, ypos, zpos, 0, 0, 0, 0, 1, 0);
  cube.drawCube();
  if (help) {
    drawRotationHelper();
  }
}
