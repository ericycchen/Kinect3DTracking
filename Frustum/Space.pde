void Space(float Space_w)
{
  //noLoop();
  float cols,rows;
  float scl= Space_w/12;
  cols = Space_w/scl;
  rows = Space_w/scl;
  
  pushMatrix();
  translate(-(Space_w/2), -(Space_w/2),Space_w/2);
  rotateY(PI/2);
  for(int x=0;x<cols;x++)
  {
    for(int y=0;y<rows;y++)
    {
      if ((x % 2 == 0 && y % 2 == 1) || (x % 2 == 1 && y %2 == 0)) 
      {
        fill(255);
      } 
      else 
      {
        fill(0);
      }
      rect(x*scl,y*scl,scl,scl);
    }
  }
  popMatrix();
  
  pushMatrix();
  translate(-(Space_w/2), -(Space_w/2),Space_w/2);
  rotateX(-PI/2);
  for(int x=0;x<cols;x++)
  {
    for(int y=0;y<rows;y++)
    {
      if ((x % 2 == 0 && y % 2 == 1) || (x % 2 == 1 && y %2 == 0)) 
      {
        fill(0);
      } 
      else 
      {
        fill(255);
      }
      rect(x*scl,y*scl,scl,scl);
    }
  }
  popMatrix();

  pushMatrix();
  translate(Space_w/2, -(Space_w/2),Space_w/2);
  rotateY(PI/2);
  for(int x=0;x<cols;x++)
  {
    for(int y=0;y<rows;y++)
    {
      if ((x % 2 == 0 && y % 2 == 1) || (x % 2 == 1 && y %2 == 0)) 
      {
        fill(0);
      } 
      else 
      {
        fill(255);
      }
      rect(x*scl,y*scl,scl,scl);
    }
  }
  popMatrix();
  
  pushMatrix();
  translate(-(Space_w/2), Space_w/2,Space_w/2);
  rotateX(-PI/2);
  for(int x=0;x<cols;x++)
  {
    for(int y=0;y<rows;y++)
    {
      if ((x % 2 == 0 && y % 2 == 1) || (x % 2 == 1 && y %2 == 0)) 
      {
        fill(255);
      } 
      else 
      {
        fill(0);
      }
      rect(x*scl,y*scl,scl,scl);
    }
  }
  popMatrix();
  /*
  pushMatrix();
  translate(-(Space_w/2),-(Space_w/2),-(Space_w/2));
  //rotateX(-PI/2);
  for(int x=0;x<cols;x++)
  {
    for(int y=0;y<rows;y++)
    {
      if ((x % 2 == 0 && y % 2 == 1) || (x % 2 == 1 && y %2 == 0)) 
      {
        fill(255);
      } 
      else 
      {
        fill(0);
      }
      rect(x*scl,y*scl,scl,scl);
    }
  }
  popMatrix();
 */ 
}