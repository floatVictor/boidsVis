class Boid {
  
  int index;
  PVector pos, vel, acc;
  float maxForce, maxSpeed;
  
  Boid(PVector _pos, int _index) {
    
    pos = _pos;
    vel = PVector.random2D();
    vel.setMag(random(2, 4));
    acc = new PVector();
    maxForce = 0.2;
    maxSpeed = 3;
    index = _index;
  }
  
  void checkBound() {
    
    if (pos.x > width) {
      pos.x = 0;
    } else if (pos.x < 0) {
      pos.x = width;
    }
    if (pos.y > height) {
      pos.y = 0;
    } else if (pos.y < 0) {
      pos.y = height;
    }
  }
  
  PVector align(Boid[] boidTab) {
   
    float lookRad = 25;
    PVector steer = new PVector();
    int total = 0;
    
    for(Boid b : boidTab) {
    
      float d = dist(pos.x, pos.y, b.pos.x, b.pos.y);
      if(b != this && d < lookRad) {
        
        steer.add(b.vel);
        total++;
      }
    }
    
    if (total > 0) {
      
      steer.div(total);
      steer.setMag(maxSpeed);
      steer.sub(vel);
      steer.limit(maxForce);
    }
    
    return steer;
  }
  
  PVector separation(Boid[] boidTab) {
    
    float lookRad = 25;
    PVector steer = new PVector();
    int total = 0;
    
    for(Boid b : boidTab) {
      
      float d = dist(pos.x, pos.y, b.pos.x, b.pos.y);
      if(b != this && d < lookRad) {
        
        PVector b2 = PVector.sub(pos, b.pos);
        b2.div(d * d);
        steer.add(b2);
        total++;
      }
    }
    
    if (total > 0) {
      
      steer.div(total);
      steer.setMag(maxSpeed);
      steer.sub(vel);
      steer.limit(maxForce);
    }
    
    return steer;
  }
    
  PVector cohesion(Boid[] boidTab) {
    
    float lookRad = 25;
    PVector steer = new PVector();
    int total = 0;
    
    for(Boid b : boidTab) {
      
      float d = dist(pos.x, pos.y, b.pos.x, b.pos.y);
      if (b != this && d < lookRad) {
        steer.add(b.pos);
        total++;
      }
    }
    if (total > 0) {
      
      steer.div(total);
      steer.sub(pos);
      steer.setMag(maxSpeed);
      steer.sub(vel);
      steer.limit(maxForce);
    }
    
    return steer;
  }
  
  void flock(Boid[] boidTab) {
    
    PVector alignV = this.align(boidTab);
    PVector cohesionV = this.cohesion(boidTab);
    PVector separationV = this.separation(boidTab);
    
    alignV.mult(align);
    cohesionV.mult(cohesion);
    separationV.mult(sep);
    
    acc.add(alignV);
    acc.add(cohesionV);
    acc.add(separationV);
  }
  
  void applyForce(PVector force, float strenght) {
    acc.add(force.mult(strenght));
  }
  
  void follow(FlowField flow) {
    
    PVector desired = flow.lookup(pos);
    desired.mult(maxSpeed);

    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxForce);
    applyForce(steer, windStrenght);
  }
  
  PVector getPos() { return pos;}
  
  void update() {
    
    pos.add(vel);
    vel.add(acc);
    vel.limit(maxSpeed);
    acc.mult(0);
  }
  
  void display(color c) {
    
    pg.strokeWeight((int)map(noise((index*1000 + ite) * 0.01), 0, 1, 1, size));
    pg.stroke(c, opa);
    pg.point(map(pos.x, 0, width, width - width * warpX, width * warpX), 
        map(pos.y, 0, height, height - height * warpY, height * warpY));
  }
}
