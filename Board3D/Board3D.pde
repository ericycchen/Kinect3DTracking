int grid_x_target = 100;
int grid_y_target = 30;

int grid_x = 100;
int grid_y = 30;

int cell_size = 30;
int gradient_size = 5;

int[] far_color = new int[] { 0,0,0 };
int[] near_color = new int[] { 255,0,0 };

void setup() {

  size( 800, 450, P3D );
  strokeWeight( 1.5 );
}

int gridcolor( float pourcent ) {
  if ( pourcent == 0 ) return color( far_color[0], far_color[1], far_color[2] );
  else if ( pourcent == 1 ) return color( near_color[0], near_color[1], near_color[2] );
  else {
    return color(
      far_color[0] * ( 1 - pourcent ) + near_color[0] * pourcent,
      far_color[1] * ( 1 - pourcent ) + near_color[1] * pourcent,
      far_color[2] * ( 1 - pourcent ) + near_color[2] * pourcent
    );
  }
}

void draw() {

  background( 0 );
  
  //if ( grid_x != grid_x_target ) grid_x++;
  //if ( grid_y != grid_y_target ) grid_y++;
  
  // grid_y = frameCount % 100;

  //float fov = PI/mouseY;
  //float cameraZ = (height/2.0) / tan(fov/2.0);
  //perspective( fov, float(width)/float(height), cameraZ/10.0, cameraZ*10.0 );

  pushMatrix();

  translate( width * 0.5, height * 0.5, 0 );

  rotateX( radians( 30 ) );
  
  noFill();
  
  rotateX( radians(mouseY) );
  //rotateX( radians( 30 ) );
  
  float grid_offset_y = frameCount % cell_size;
  // float bottom_x_offset = 0;
  float bottom_x_offset = -( mouseX - width * 0.5 );

  float gridtop = -grid_y * cell_size * 0.5;
  float gradientsize = gradient_size * cell_size;
  float gradientbottom = gridtop + gradientsize;

  noFill();
  // stroke( 255 );
  beginShape(LINES);
  for ( int x = 0; x <= grid_x; ++x ) {
    
    float px = ( x * cell_size ) - ( grid_x * cell_size * 0.5 );
    float py = grid_y * cell_size * 0.5;
    
    stroke( gridcolor( 0 ) );
    // point début
    vertex( px, -py );
    stroke( gridcolor( 1 ) );
    // point fin
    float px_milieu = px + ( gradientsize / ( py * 2 ) ) * bottom_x_offset;
    vertex( px_milieu, -py + gradientsize );
    
    // point début
    vertex( px_milieu, -py + gradientsize );
    // point fin
    vertex( px + bottom_x_offset, py );
    
    // problème: pas moyen de faire un dégradé!
    // line( px, -py, px, py + grid_offset_y );
  }
  endShape();

  for ( int y = 0; y <= grid_y; ++y ) {
    
    float px = grid_x * cell_size * 0.5;
    float py = ( y * cell_size ) - ( grid_y * cell_size * 0.5 );
    py += grid_offset_y;
    
    if ( py <= gradientbottom ) {
      float pourcent = 1 - ( (gradientbottom - py ) / gradientsize );
      stroke( gridcolor( pourcent ) );
    } else {
      //stroke( gridcolor( 1 ) );
    }
    
    line( -px, py, px, py );
  }

  popMatrix();

  fill( 255 );
  text( frameCount, 10, 25 );

  //println( frameCount );
}