class BulletEnemy{
  float x, y, speed;
  Boolean atirando = false;
  Boolean natela = false;
  float bulletPower;
  
  BulletEnemy(float initX, float initY){
    x = initX;
    y = initY;
    speed = 5;
    atirando = false;
    bulletPower = 1;
    
  }
  
  void start(){
    if (atirando == false){
      atirando = true;
    }
  }

  void update(){
    if (atirando == true){
      y = y + speed;
      natela = true;
      if (y >= height){
        reset();        
      }
    } 
  }
  
  void setPower(float power){
    this.bulletPower = bulletPower * power;
  }
  
  void reset(){
    y = -10;
    speed = 0;
    atirando = false;
    natela = false;
  }
  
  void display(){
    rect(x, y, 5, 10);
    fill(255, 255, 255);
    noStroke();
  
  }
}