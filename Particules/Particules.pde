int pnum = 10;
Particule ps[];
PVector gravity = new PVector( 0,1 );

void setup() {
  size( 800,800 );
  ps = new Particule[ pnum ];
  for ( int i = 0; i < pnum; ++i ) {
    ps[ i ] = new Particule( width / 2, height / 2 );
  }
  background( 0 );
}

void draw() {
  //background( 0 );
  float a = frameCount * 0.005;
  //gravity.set( cos(a), sin(a) );
  for ( int i = 0; i < pnum; ++i ) {
    //ps[ i ].setInit( mouseX, mouseY );
    ps[ i ].draw();
    if ( !ps[ i ].alive() ) {
     ps[ i ].reset();
    }
  }
}