class Snowflakes {
  //initializing variables
  float x = random(width);//scatters snow in the x direction
  float y = random(-500,-50);//scatters snow in the Y diretion
  float z = random(0, 20);//gives depth to the snow
  float yspeed = map (z, 0, 2, 1, 2);//makes snow fall at different speeds with the depth
  
  //function for falling snow
  void gravity() {
    y = y + yspeed;
    //reset raindrops after they fall to a random height
    if (y > height) {
      y = random(-200, -100);
      yspeed = map(z, 0, 2, 1, 2);
    }
  }
  void show() {
    //initializing snowflake
    stroke(255, 255, 255);//color white
    line(x+2,y,x,y+2);
  }
}
