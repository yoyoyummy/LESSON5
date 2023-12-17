void UI() {
  cp = new ControlP5(this, createFont("微软雅黑", 16));
  cp.addSlider("radius")
    .setPosition(30, 30)
    .setRange(50, 400)
    .setValue(radius)
    .setSize(200, 20);
  cp.addSlider("coneHeight")
    .setPosition(30, 60)
    .setRange(10, 1000)
    .setValue(coneHeight)
    .setSize(200, 20);
  cp.addSlider("dia")
    .setPosition(30, 90)
    .setRange(0, 200)
    .setValue(dia)
    .setSize(200, 20);
  cp.addSlider("sw")
    .setPosition(30, 120)
    .setRange(0, 20)
    .setValue(sw)
    .setSize(200, 20);
  cp.addSlider("angleOffset")
    .setPosition(30, 150)
    .setRange(0, TWO_PI)
    .setValue(angleOffset)
    .setSize(200, 20);
  cp.addSlider("rotationSpeed")
    .setPosition(30, 180)
    .setRange(0.001, 0.1)
    .setValue(rotationSpeed)
    .setSize(200, 20);
  cp.addSlider("pointSize")
    .setPosition(30, 300)
    .setRange(1, 10)
    .setValue(pointSize)
    .setSize(200, 20);
  cp.addToggle("showPoints")
    .setPosition(30, 330)
    .setSize(50, 20)
    .setValue(showPoints);
  cp.addToggle("showWireframe")
    .setPosition(30, 360)
    .setSize(50, 20)
    .setValue(showWireframe);
  cp.setAutoDraw(false);
}
