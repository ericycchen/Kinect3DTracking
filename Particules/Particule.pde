class Particule extends PVector { //<>//

  private PVector init;
  private PVector dir;
  private PVector dir_var;
  private int lifeduration;
  private int lifetime;
  private float speed;
  private float mass;
  private float size;
  private float startcolor[];
  private float endcolor[];
  
  public Particule( float x, float y ) {
    init = new PVector( x,y );
    dir_var = new PVector( 0.15, 0.15 );
    //dir_var = new PVector( 0, 0 );    
    lifeduration = 0;
    lifetime = 0;
    speed = 0;
    size = 3;
    reset();
  }
  
  public void setInit( float x, float y ) {
    init.set( x, y );
  }
  
  public boolean alive() {
    return ( lifetime >= 0 );
  }
  
  public void reset() {
    x = init.x;
    y = init.y;
    dir = new PVector();
    dir.set( random( -1,1 ), random( -1,1 ) );
    dir.normalize();
    speed = random( 0.9, 1.5 );
    mass = random( 0.01, 0.1 );
    lifeduration = (int) random( 300, 1200 );
    lifetime = lifeduration;
    
    PVector c = new PVector( random( 0.6,1 ), random( 0.4,1 ), random( 0,0.21 ) );
    c.normalize();
    c.mult( 255 );
    startcolor = new float[] { c.x,c.y,c.z,180 };
    endcolor = new float[] { 255,0,0,0 };    
  
  }
  
  public void draw() {
    if ( lifetime < 0 ) return;
    
    PVector tmp;
    tmp = new PVector();
    tmp.add( gravity );
    tmp.mult( mass );
    tmp.add( dir );
    tmp.normalize();
    dir = tmp;
    
    tmp = new PVector( random( -dir_var.x, dir_var.x ), random( -dir_var.y, dir_var.y ) );
    tmp.add( dir );
    tmp.normalize();
    dir = tmp;
    
    float pc = lifetime * 1.f / lifeduration;
    float pci = 1 - pc;
    tmp = new PVector();
    tmp.add( dir );
    tmp.mult( speed );
    add( tmp );
    
    if ( x < 0 || x >= width ) dir.x *= -1;
    if ( y < 0 || y >= height ) dir.y *= -1;
    
    noStroke();
    int fc = color( 
      startcolor[0] * pc + endcolor[0] * pci, 
      startcolor[1] * pc + endcolor[1] * pci,
      startcolor[2] * pc + endcolor[2] * pci,
      startcolor[3] * pc + endcolor[3] * pci
    );
    fill( fc );
    float s = size * pc;
    ellipse( x,y,s,s );
    lifetime--;
  }

}