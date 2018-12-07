class Player{
  
  float x;
  float y;
  float speed;
  float size;

  
  Player(){
    this.x = width/2;
    this.y = height - 30;
    this.size = 30;
    this.speed = 8;   
  }
 
  void Display(){
    image(spaceship, x, y, size, 30);
    
  }
  
  void moveLeft(){
    this.x -= speed;
    
  }
  
  void moveRight(){
    this.x += speed;
  }
  
  void reset(){
    this.x = width/2;
    this.y = height - 30;
  }
  
  
}