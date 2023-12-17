import peasy.*;
import controlP5.*;

float dia = 50.0;
float sw = 1.0;

PVector[][] vp;
int layer = 20;
int section = 36;
float radius = 200.0;
float coneHeight = 400.0;

// 新添加的可控变量
float angleOffset = 0.0;
float rotationSpeed = 0.01;
float coneX = 0.0;
float coneY = 0.0;
float coneZ = 0.0;
float pointSize = 5.0;
boolean showPoints = true;
boolean showWireframe = true;

PeasyCam cam;
ControlP5 cp;

void setup() {
  size(800, 800, P3D);
  background(0);
  cam = new PeasyCam(this, 400);
  UI();

  buildCone();
}

void draw() {
  background(0);
  buildCone();
  displayCone();

  cam.beginHUD();
  cp.draw();
  cam.endHUD();

  if (mouseX < 300 && mouseY < 300) {
    cam.setActive(false);
  } else {
    cam.setActive(true);
  }
}

void buildCone() {
  vp = new PVector[layer][section];
  float angle = TWO_PI / section;

  for (int i = 0; i < layer; i++) {
    float ratio = float(i) / layer;
    float coneRadius = radius * (1.0 - ratio);
    float currentHeight = coneHeight * ratio;

    for (int j = 0; j < section; j++) {
      float x = coneRadius * cos(angle * j + angleOffset) + coneX;
      float y = coneRadius * sin(angle * j + angleOffset) + coneY;
      float z = currentHeight + coneZ;
      vp[i][j] = new PVector(x, y, z);
    }
  }
  
  angleOffset += rotationSpeed;
}

void displayCone() {
  if (showWireframe) {
    strokeWeight(sw);
    stroke(255);
    float c = 255 / vp.length;
    for (int i = 0; i < vp.length - 1; i++) {
      fill(i * c);
      for (int j = 0; j < vp[0].length; j++) {
        beginShape(TRIANGLES);
        vertex(vp[i][j].x, vp[i][j].y, vp[i][j].z);
        vertex(vp[i + 1][j].x, vp[i + 1][j].y, vp[i + 1][j].z);
        vertex(vp[i][(j + 1) % vp[0].length].x, vp[i][(j + 1) % vp[0].length].y, vp[i][(j + 1) % vp[0].length].z);

        vertex(vp[i][(j + 1) % vp[0].length].x, vp[i][(j + 1) % vp[0].length].y, vp[i][(j + 1) % vp[0].length].z);
        vertex(vp[i + 1][j].x, vp[i + 1][j].y, vp[i + 1][j].z);
        vertex(vp[i + 1][(j + 1) % vp[0].length].x, vp[i + 1][(j + 1) % vp[0].length].y, vp[i + 1][(j + 1) % vp[0].length].z);
        endShape();
      }
    }
  }

  if (showPoints) {
    for (int i = 0; i < vp.length; i++) {
      for (int j = 0; j < vp[0].length; j++) {
        strokeWeight(pointSize);
        stroke(255, 0, 255);
        point(vp[i][j].x, vp[i][j].y, vp[i][j].z);
      }
    }
  }
}
