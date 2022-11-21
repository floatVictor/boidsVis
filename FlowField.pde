class FlowField {

  PVector[][] field;
  int cols, rows;
  int resolution;

  FlowField(int r) {
    
    resolution = r;
    cols = width/resolution;
    rows = height/resolution;
    
    field = new PVector[cols][rows];
    update();
  }

  void update() {
    
    for (int i = 0; i < cols; i++) {
      
      for (int j = 0; j < rows; j++) {
        
        float theta = map(noise(i * windRatioVal * 0.01, j * windRatioVal, windSizeVal + ite),0,1,0,TWO_PI * 4);
        
        field[i][j] = new PVector(cos(theta),sin(theta));
      }
    }
  }

  PVector lookup(PVector lookup) {

    int column = int(constrain(lookup.x/resolution,0,cols-1));
    int row = int(constrain(lookup.y/resolution,0,rows-1));
    return field[column][row];
  }
}
