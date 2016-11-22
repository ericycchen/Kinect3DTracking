//https://bitbucket.org/frankiezafe/creactifs2016
//http://piratepad.be/p/creactifs2016

int pnum = 300;
Particule particules[];

void setup() {
  
  size( 800,200 ); 

  particules = new Particule[pnum];
  for ( int i = 0; i < pnum; i++ ) {
    particules[ i ] = new Particule( width / 2, height / 2 );
  }

}

void draw() {

  background( 0 );
  for ( int i = 0; i < pnum; i++ ) {
    particules[ i ].draw();
  }
  
}