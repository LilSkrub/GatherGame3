class character extends gameObject {
 int size = 10;
 int halfSize;
 double x;
 double y;
 int lives = 100;
 
 character(double x, double y, int size)
 {
   this.x = x;
   this.y = y;
   this.size = size;
   this.halfSize = size/2;
 }
 
 public void draw()
 {
   this.render();
   this.characterMovement();
   this.wallCollision();
 }
 
 private void render()
 {
   stroke(255,0,0);   // red character outline
   fill(255,255,255); // white character fill
   circle((int)x,(int)y,size);  // character position and size
 }
 
 private void playerMoveUp()
 {
   this.y = this.y - this.halfSize;
 }
 
 private void playerMoveDown()
 {
   this.y = this.y + this.halfSize;
 }
 
 private void playerMoveLeft()
 {
   this.x = this.x - this.halfSize;
 }
 
 private void playerMoveRight()
 {
   this.x = this.x + this.halfSize;
 }
 
 
 private void wallCollision()
 {
   if(this.x >= width - this.halfSize)
   {
     this.x = width - this.halfSize;
   }
   if(this.x <= 0 + this.halfSize)
   {
     this.x = 0 + this.halfSize;
   }
   if(this.y >= height - this.halfSize)
   {
     this.y = height - this.halfSize;
   }
   if(this.y <= 0 + this.halfSize)
   {
     this.y = 0 + this.halfSize;
   }
 }
   
 public boolean objectCollision(gameObject objectIn)
 {
   if(dist((float)this.x, (float)objectIn.x, (float)this.y, (float)objectIn.y) < this.size)
   {
     return true;
   }
   return false;
 }
 
// // CIRCLE/RECTANGLE
//boolean circleRect(float cx, float cy, float radius, float rx, float ry, float rw, float rh) {

//  // temporary variables to set edges for testing
//  float testX = cx;
//  float testY = cy;

//  // which edge is closest?
//  if (cx < rx)         testX = rx;      // compare left edge
//  else if (cx > rx+rw) testX = rx+rw;   // right edge
//  if (cy < ry)         testY = ry;      // top edge
//  else if (cy > ry+rh) testY = ry+rh;   // bottom edge

//  // get distance from closest edges
//  float distX = cx-testX;
//  float distY = cy-testY;
//  float distance = sqrt( (distXdistX) + (distYdistY) );

//  // if the distance is less than the radius, collision!
//  if (distance <= radius) {
//    return true;
//  }
//  return false;
//}
 
  private void characterMovement()
 {
   if(keyPressed) {
       switch(key) {
         case 'w':
         case 'W':
           playerMoveUp();
           break;
         case 's':
         case 'S':
           playerMoveDown();
           break;
         case 'a':
         case 'A':
           playerMoveLeft();
           break;
         case 'd':
         case 'D':
           playerMoveRight();
           break;
         default:
       }
       if(key == CODED)
       {
        switch(keyCode)
        {
          case UP:
            playerMoveUp();
            break;
          case DOWN:
            playerMoveDown();
            break;
          case LEFT:
            playerMoveLeft();
            break;
          case RIGHT:
            playerMoveRight();
            break;
          default:
        }
       }
   }
   
 }
   
 } // class ends here
