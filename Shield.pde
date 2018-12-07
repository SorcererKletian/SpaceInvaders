class Shield{
  
  float w = 100;
  float h = 25;
  float x;
  float y;
  int hp;
  Boolean isHit;
  
  
  Shield(float posx, float posy){
    x = posx;
    y = posy;
    this.hp = 6;
    isHit = false;
  }
  
  void desenha(){
    rect(x, y, w, h);
    fill(0, 255, 0);
  }
  
  void update(){
    if (hp == 0){
      this.destroyed();
    }
  }
  
  void isHitten(){
    isHit = true;
    if (isHit){
      this.hp = hp -1;
      isHit = false;
    }
  }
  
  void destroyed(){
    
    this.y = -1000;
  }
  
  
}