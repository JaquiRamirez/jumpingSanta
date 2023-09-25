class Player{
  //affected by arguments
  int _santaX; //x position 
  int _santaY; //y position
  int _PlayerSize; 
  int _startY;

  
  int gravity = 6; 
  int jumpCounter = 0; 
  int jumpCounterLimit = 20; 
  boolean isJumping = false; 
  boolean notInAir = true; 

  Player(int x, int y, int size){ //the Player object has three arguments x & y position and size
    _santaX = x;
    _santaY = y;
    _PlayerSize = size;
    _startY = y; //used to determine when gravity is active
  }

  void jump(){ 
    if(notInAir){ //Santa on the grounds
      isJumping = true; //sets boolean to true, which triggers the jump in "physics()" 
    }
  }

  void physics(){ //is put into the "draw()" to constantly update
    //gravity
    if(_santaY < _startY){ //if Santa's y position is less than the starting y position
      _santaY += gravity; //increments Santa's y position by gravity
      notInAir = false; //when Santa is not in the air, stopping "jump()" from workin
   }else{
      notInAir = true; //if Santa is on the floor, allowing "jump" method to work
    }

    //jump triggered by "jump()" method
    if(isJumping){
      _santaY -= 12; 
      jumpCounter += 1; //increments the jumpCounter, which determines when to stop jumping 
    }
    if(jumpCounter >= jumpCounterLimit){ //when the counter reaches the limit the jump stops
      isJumping = false;
      jumpCounter = 0; //the counter is reset
    }
  }

  //get methods to use when checking for collision with obstacles
  int getX(){ 
    return _santaX + _PlayerSize/2; //Santa's front coordinate
  }
  int getY(){
    return _santaY + _PlayerSize/2; //Santa's bottom coordinate
  }

  void display(){ //puts"draw()" to constantly update
    pushMatrix(); //matrix necessary to contain the rotate transformation
    rectMode(CENTER);
    translate(_santaX, _santaY);

    //Santa design
    noStroke();
    image(santa, 0, 0, _PlayerSize, _PlayerSize);
   popMatrix();//matrix necessary to contain the rotate transformation

  }

}
