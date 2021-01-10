class movingBall extends gameObject { 
  int size = 10;
  double x;
  double y;
  int dx;
  int dy;
  
  movingBall(double x, double y, int dx, int dy, int size)
  {
    this.x=x;
    this.y=y;
    this.dx=dx;
    this.dy=dy;
    this.size=size;
  }
  
  public void draw()
  {
    this.render();
    this.calculateMovement();
    this.wallCollision();
  }
  
  private void render()
  {
    stroke(255,0,0); //moving ball outline
    fill(255,255,0); //moving ball fill
    
    circle((int)x,(int)y,size); // moving ball position and diameter
    
  }
  
  private void calculateMovement()
  {
    this.x = this.x + this.dx;
    this.y = this.y + this.dy;
  }
  
  private void wallCollision()
  {
    if(this.x >= width)
    {
      this.dx = -this.dx;
    }
    else if(this.x <= 0)
    {
      this.dx = -this.dx;
    }
    
    if(this.y >= height)
    {
      this.dy = -this.dy;
    }
    else if(this.y <= 0)
    {
     this.dy = -this.dy;
    }
    
  }
  

} // movingBall class ends here
