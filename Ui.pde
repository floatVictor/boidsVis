void setUi() {
  
  
  //UI
  cp5 = new ControlP5(this);
  
  //global control
  
  Group GLOBAL = cp5.addGroup("GLOBAL")
             .setPosition(20, 20);
             
  cp5.addSlider("size", 1, 100, size, 0, 5, sliderLength, 10)
             .setColorCaptionLabel(255)
             .setGroup(GLOBAL)
             .setColorLabel(255);
             
  cp5.addSlider("opa", 0, 255, opa, 0, 20, sliderLength, 10)
             .setColorCaptionLabel(255)
             .setGroup(GLOBAL)
             .setColorLabel(255);
             
  cp5.addSlider("warpX", 0, 1, warpX, 0, 35, sliderLength, 10)
             .setColorCaptionLabel(255)
             .setGroup(GLOBAL)
             .setColorLabel(255);
             
  cp5.addSlider("warpY", 0, 1, warpY, 0, 50, sliderLength, 10)
             .setColorCaptionLabel(255)
             .setGroup(GLOBAL)
             .setColorLabel(255);
             
  cp5.addSlider("nbVisible", 0, boidNum, nbVisible, 0, 65, sliderLength, 10)
             .setColorCaptionLabel(255)
             .setGroup(GLOBAL)
             .setColorLabel(255);
             
  cp5.addSlider("opaBack", 0, 255, nbVisible, 0, 80, sliderLength, 10)
             .setColorCaptionLabel(255)
             .setGroup(GLOBAL)
             .setColorLabel(255);
             
  //boids control
  
  Group BOIDS = cp5.addGroup("BOIDS")
             .setPosition(300, 20);
             
  cp5.addSlider("align", 0, 2, align, 0, 5, sliderLength, 10)
             .setColorCaptionLabel(255)
             .setGroup(BOIDS)
             .setColorLabel(255);
             
  cp5.addSlider("cohesion", 0, 2, align, 0, 20, sliderLength, 10)
             .setColorCaptionLabel(255)
             .setGroup(BOIDS)
             .setColorLabel(255);
             
  cp5.addSlider("sep", 0, 2, sep, 0, 35, sliderLength, 10)
             .setColorCaptionLabel(255)
             .setGroup(BOIDS)
             .setColorLabel(255);
             
  //flowfield control
  
  Group FLOWFIELD = cp5.addGroup("FLOWFIELD")
             .setPosition(580, 20);
             
  cp5.addSlider("windRatio", 0, 1, windRatio, 0, 5, sliderLength, 10)
             .setColorCaptionLabel(255)
             .setGroup(FLOWFIELD)
             .setColorLabel(255);
             
  cp5.addSlider("windSize", 0, 1.5, windSize, 0, 20, sliderLength, 10)
             .setColorCaptionLabel(255)
             .setGroup(FLOWFIELD)
             .setColorLabel(255);
             
  cp5.addSlider("windStrenght", 0, 5, windStrenght, 0, 35, sliderLength, 10)
             .setColorCaptionLabel(255)
             .setGroup(FLOWFIELD)
             .setColorLabel(255);
             
  //color
  
  Group COLOR = cp5.addGroup("COLOR")
             .setPosition(20, 130);
             
   cp5.addSlider("h", 0, 255, h, 0, 5, sliderLength, 10)
             .setColorCaptionLabel(255)
             .setGroup(COLOR)
             .setColorLabel(255);
             
  cp5.addSlider("sat", 0, 255, sat, 0, 20, sliderLength, 10)
             .setColorCaptionLabel(255)
             .setGroup(COLOR)
             .setColorLabel(255);
             
   cp5.addSlider("val", 0, 255, val, 0, 35, sliderLength, 10)
             .setColorCaptionLabel(255)
             .setGroup(COLOR)
             .setColorLabel(255);
             
   cp5.addSlider("sat2", 0, 255, sat2, 0, 50, sliderLength, 10)
             .setColorCaptionLabel(255)
             .setGroup(COLOR)
             .setColorLabel(255);
             
   cp5.addSlider("val2", 0, 255, val2, 0, 65, sliderLength, 10)
             .setColorCaptionLabel(255)
             .setGroup(COLOR)
             .setColorLabel(255);
}
