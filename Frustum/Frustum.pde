import controlP5.*;

ControlP5 cp5;

// default configuration

float world_size = 500;
float offset_z = 0;

float bg_gray = 100;

float ball_spacing = 110;
float ball_radius = 50;
float total_depth = 5000;

int xlayers = 1;
int ylayers = 1;
int zlayers = 8;

float rotation_speed = 0.002;

void setup() {

  size( 1200, 600, P3D);
  
  cp5 = new ControlP5(this);
  
  int spgap = 16;
  int sp = 10;
  cp5.addSlider("world_size").setPosition(10,sp).setRange( 100, 10000 ); sp += spgap;
  cp5.addSlider("offset_z").setPosition(10,sp).setRange( -500, 500 ); sp += spgap;
  sp += spgap;
  cp5.addSlider("bg_gray").setPosition(10,sp).setRange( 0, 255 ); sp += spgap;
  sp += spgap;
  cp5.addSlider("ball_radius").setPosition(10,sp).setRange( 5, 100 ); sp += spgap;
  cp5.addSlider("ball_spacing").setPosition(10,sp).setRange( 30, 200 ); sp += spgap;
  cp5.addSlider("total_depth").setPosition(10,sp).setRange( 1000, 10000 ); sp += spgap;
  sp += spgap;
  cp5.addSlider("xlayers").setPosition(10,sp).setRange( 0, 4 ); sp += spgap;
  cp5.addSlider("ylayers").setPosition(10,sp).setRange( 0, 4 ); sp += spgap;
  cp5.addSlider("zlayers").setPosition(10,sp).setRange( 1, 10 ); sp += spgap;
  sp += spgap;
  cp5.addSlider("rotation_speed").setPosition(10,sp).setRange( 0, 0.01 ); sp += spgap;
  
  
}

void draw() {
  
  noFill();
  background( bg_gray );
  
  hint(ENABLE_DEPTH_TEST);
  //lights();
  //directionalLight( 51, 102, 126, -1, -1, 0 );

  PVector fscale = frustumizer( ( mouseX - width * 0.5 ) * 2, ( mouseY - height * 0.5 ) * 2, world_size );
  
  pushMatrix();
  
   // center the world on the screen
   // uncomment this line to move the back of the world
   // translate( width * 0.5, height * 0.5, -( world_size * 2 ) + offset_z );
   translate( width * 0.5, height * 0.5, -( world_size * 2 ) );
   // draw world box
   noFill();
   stroke( 200 );
   box( world_size * 2 );
    
   // now we can draw objects in the world
   noStroke();
   pushMatrix();
     translate(0, 0, offset_z );
     scale( fscale.x, fscale.y, fscale.z );
     for ( int z = zlayers; z >= -zlayers; --z ) {
       float pc = ( ( z + zlayers ) / ( zlayers * 2.f ) );
       float pci = 1 - pc;
       fill( pci * bg_gray, pci * bg_gray + pc * 255, pci * bg_gray + pc * 255 );
       rotateZ( frameCount * rotation_speed );
       for ( int y = -ylayers; y <= ylayers; ++y ) {
         for ( int x = -xlayers; x <= xlayers; ++x ) {
           pushMatrix();
             translate( x * ball_spacing, y * ball_spacing, z * total_depth / zlayers );
             rotateZ( frameCount * 0.01 );
             //fill( 255,0,0, 180 );
             sphere( ball_radius );
           popMatrix();
         }
       }
     }
   popMatrix();
  
  popMatrix();
  
  // overlay
  hint(DISABLE_DEPTH_TEST);
  frustumReset();
  fill( 0,50 );
  rect( 0,0,190,height );
  
}