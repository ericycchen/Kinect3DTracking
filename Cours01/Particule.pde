class Particule extends PVector {
  
  private PVector dir;
  private int couleur;
  
  // constructeur! ~setup
  public Particule( float x, float y ) {
    this.x = x;
    this.y = y;
    dir = new PVector( random( -1,1 ), random( -1,1 ) );
    dir.normalize();
    couleur = color( 
        random( 200,255 ),
        random( 100,255 ),
        random( 50,100 )
      );
  }
  
  public void draw() {
    
    add( dir );
    if ( x <= 0 || x >= width ) {
      dir.x *= -1;
    }
    if ( y <= 0 || y >= height ) {
      dir.y *= -1;
    }
    
    noStroke();
    fill( couleur );
    ellipse( x,y,10,10 );
    
  }
  
}