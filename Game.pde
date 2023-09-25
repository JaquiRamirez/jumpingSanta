//importing soundfile library
import processing.sound.*;
SoundFile backgroundMusic;
//declaring png and gif image names
PImage gover;
PImage gman;
PImage santa;

//delcaring hero/Santa
Player hero;

//delaring obstacles and snowflakes
Obstacle[] obstacles = new Obstacle[25]; //adding the obstacles  
Snowflakes[] snowflakes = new Snowflakes[600];

//variables
int timer = 0; 
int deathCounter = 0; 
int highScore = 0; 
int fade = 0; 

//boolean welcomeScreen;
//boolean start;

void setup(){
  size(1000, 600);
  //initializing background music
  backgroundMusic = new SoundFile(this, "audio1.mp3"); 
  backgroundMusic.amp(0.25); 
  backgroundMusic.play();
  
  //initializing png and gif image
  gover = loadImage("R.png");
  santa = loadImage("santa.gif");
  gman = loadImage("gingerbread_man.gif");
  
  hero = new Player(150, 524, 50); //has x, y, and size parameters, the y and size 
  
  //initializing size and number of snowflakes 
   for (int i = 0; i < snowflakes.length; i++) {
     snowflakes[i] = new Snowflakes();
   }

  //initialising obstacles
  for(int i = 0; i < 25; i++){
    obstacles[i] = new Obstacle(1000); 
  }
}

void draw(){
  //background
  scenery();
  //snow
  for (int i = 0; i < snowflakes.length; i++) {
    snowflakes[i].gravity();
    snowflakes[i].show();
   }
  //obstacles
  for(int i = 0; i < 25; i++){
    obstacles[i].move(4); //initialises the move speed for all obstacles
  }
  obstacleSpawn(); //spawns obstacles based on timer
  collision(); //checks collisions between obstacles and santa

  //santa
  hero.display();
  hero.physics();

  //timer, scoreboard and control display
  timer();
  scoreboard(); 
  displayControls();
}

void keyPressed(){
  switch(key){
    //jump
  case ' ':
    hero.jump();
    break;
  }
}

void collision(){
  //collision with enemy
  for(int i = 0; i < 25; i++){
    if(hero.getX() > obstacles[i].gingerBreadGetX1() && hero.getX() < obstacles[i].gingerBreadGetX2()){
      if(hero._santaY > obstacles[i].gingerBreadGetY1() && hero._santaY < obstacles[i].gingerBreadGetY2()){
        backgroundMusic.stop();
        delay(1000);
        reset();
      }
    }
  }

}

void timer(){ //timer used to determine score and obstacle spawning
  timer += 1;
}

void reset(){ //resets the game back to the beginning
  //replays music from start
  backgroundMusic.stop();
  backgroundMusic.play();
  //resets timer
  timer = 0;
  //resets obstacles
  for(int i = 0; i < 25; i++){
    obstacles[i] = new Obstacle(1000);
  }
  //resets "floor"
  hero._startY = 524;
  deathCounter += 1;
  fade = 0;
}

void scoreboard(){ //scoreboard that tracks longest travelled distance
  if(timer > highScore){
    highScore = timer;
  }
  textAlign(CENTER);
  //highscore display
  textSize(35);
  fill(255, 255, 255);
  text("Highscore: "+highScore/60, 800, 50); 
  //deathcounter display
  fill(255, 255, 255);
  textSize(45);
  text(deathCounter, 500, 60);
}

void displayControls(){
  //displays controls until the timer reaches 250
  if(timer < 400){
    textAlign(CENTER);
    textSize(35);
    fill(255, 255, 255);
    text("JUMP: USE SPACE", 220, 50);
  }
}

void scenery(){ 
  //ground
  strokeWeight(3);
  stroke(0);
  fill(188,158,130);
  rect(500, 600, 1050, 100);
  //sky
 strokeWeight(3);
  stroke(0);
  rectMode(CORNER);
  fill(137,186,243);
  rect(0, 0, 1100, 550);
}

void gameComplete(){
  //fades to dark blue
  noStroke();
  fill(32, 116, 254, fade);
  rectMode(CENTER);
  rect(500, 300, 1000, 600);
  fade += 1;
  //game over screen
    imageMode(CENTER);
    image(gover, 500, 300); 
}

void obstacleSpawn(){ //spawns the obstacles based on the timer 

//spike is 550 from floor
  if(timer > 150){
    obstacles[1].gingerBread(550);
  }
  if(timer > 250){
    obstacles[2].gingerBread(550);
  }
  if(timer > 350){
    obstacles[3].gingerBread(550);
  }
  if(timer > 450){
    obstacles[4].gingerBread(550);
  }
  if(timer > 525){
    obstacles[5].gingerBread(550);
  }
  if(timer > 450){
    obstacles[6].gingerBread(550);
  }
  if(timer > 675){
    obstacles[7].gingerBread(550);
  }
  if(timer > 685){
    obstacles[8].gingerBread(550);
  }
  if(timer > 750){
    obstacles[9].gingerBread(550);
  }
  if(timer > 758){
    obstacles[10].gingerBread(550);
  }
  if(timer > 850){
    obstacles[11].gingerBread(550);
  }
  if(timer > 950){
    obstacles[12].gingerBread(550);
  }
    if(timer > 958){
    obstacles[13].gingerBread(550);
  }
  if(timer > 1050){
    obstacles[14].gingerBread(550);
  }
  if(timer > 1150){
    obstacles[15].gingerBread(550);
  }
  if(timer > 1156){
    obstacles[16].gingerBread(550);
  }
  if(timer > 1260){
    obstacles[17].gingerBread(550);
  }
  if(timer > 1364){
    obstacles[18].gingerBread(550);
  }
  if(timer > 1464){ 
    obstacles[19].gingerBread(550);
  }
  if(timer > 1590){
    obstacles[20].gingerBread(550);
  }
  if(timer > 1690){
    obstacles[21].gingerBread(550);
  }
  if(timer > 1760){ 
    obstacles[22].gingerBread(550);
  }
  if(timer > 1810){ 
    obstacles[23].gingerBread(550);
  }
  if(timer > 1908){ 
    obstacles[24].gingerBread(550);
  }
  //game is complete
  if(timer > 2200){
   gameComplete(); 
  }
  //game resets
  if(timer > 2450){
   reset(); 
  }
}
