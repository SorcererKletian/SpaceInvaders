class Enemy{
  
  float posx, posy;
  float edgeLeft = 0;
  float edgeRight = 800;
  float speed;
  float hp;
  Boolean left;
  Boolean right;
  float z;
  float px = 1;
  Boolean hitbox;
  float w;
  float h;
  float pt;
  Boolean fora;
  Boolean move;
  Boolean isHit;
  Boolean easy, medium, hard;
  
  
  Enemy(){
    
  }
  
  Enemy(float x, float y){
    this.hp = 1;
    this.posx = x;
    this.posy = y;
    this.w = 30;
    this.h = 30;
    this.pt = 100;
    this.fora = false;
    this.hp = 1;
    left = false;
    move = true;
    isHit = false;
    
  }
  
  void setDificulty(float df){
    if (df == 1){
      easy = true;
    }
    if (df == 2){
      medium = true;
    }
    if (df == 3){
      hard = true;
    }
  }
  void Display(){
    image(invader2, posx, posy, w, h);
  
    
  }
  float getX(){
    return this.posx;
  }
  float getY(){
    return this.posy;
  }
  
   void update(){
    if (this.hp <= 0){
      this.remove();
    }
  }
  
  void isHitten(float b){
    isHit = true;
    if (this.isHit == true){
      this.hp = this.hp - b;
      isHit = false;
    }
  }
  
  void remove(){
    this.posy = -50000;
    fora = true;
    move = false;
    
  }
  
  void move(float tf){
    this.setDificulty(tf);
    if (!left && move){
      posx += speed + tf;
    }
    if (left && move){
      posx -= speed + tf;
    }   
  }
  
  void moveBaixo(){
      left = true;
      posy += 20;
  }
  void moveBaixoInverso(){
    left = false;
    posy += 20;
  }
  
}