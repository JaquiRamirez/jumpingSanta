class Obstacle{
  //attributes
  int _startX;
  int _gingerBreadX;
  int _gingerBreadY;
  int _speed;
  
  Obstacle(int x){ 
    _startX = x;
    _gingerBreadX = _startX;
  }
  
  void gingerBread(int y){
    _gingerBreadY = 524; 
    noStroke();
    fill(96, 63, 30);
    //constructing the spike
    image(gman, _gingerBreadX, _gingerBreadY);
    _gingerBreadX -= _speed;
  }
  
//methods to use when checking for collision with Santa
  int gingerBreadGetX1(){
    return _gingerBreadX+5; //front coordinate
  }
  int gingerBreadGetX2(){
    return _gingerBreadX+30; //back coordinate
  }
  int gingerBreadGetY1(){
    return _gingerBreadY-50; //top coordinate
  }
  int gingerBreadGetY2(){
    return _gingerBreadY+5; //bottom coordinate
  }
  
  //speed
  void move(int speed){ 
    _speed = speed;
  }
}
