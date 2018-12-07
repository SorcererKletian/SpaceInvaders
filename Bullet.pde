class Bullet{
  float x, y, speed;
  Boolean atirando = false;
  
  Bullet(float initX, float initY){
    x = initX;
    y = initY;
    speed = 8;
    atirando = false;
    
  }
  
  void start(){
    if (atirando == false){
      atirando = true;
    }
  }

  void update(){
    if (atirando == true){
      y = y - speed;
      if (y <= 0){
        reset();        
      }
    }
    
  }
  
  void reset(){
    y = -10;
    speed = 0;
    atirando = false;
    space = false;
  }
  
  void display(){
    image(tiro, x, y);
  
  }
  


}