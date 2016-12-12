// reset the processing view to normal

void frustumReset() {

  float fov = PI / 3.0;
  float camz = (height / 2.0) / tan(fov / 2.0);
  
  camera( 
   width * 0.5, height * 0.5, camz,
   width * 0.5, height * 0.5,0, 
   0,1,0 );
   
  perspective( fov, float(width) / float(height), camz / 10.0, camz * 10.0);  

}

// the method fix the frustum depending on the screen and world_size
// and returns a PVector representing the scale that correct the
// deformation implied by the frustum

PVector frustumizer( float x, float y, float world_size ) {

  float hw = width * 0.5;
  float hh = height * 0.5;

  PVector cam_eye_offset = new PVector( -x, -y, 0.f );
  
  PVector cam_center_offset = new PVector( -x, -y, 0.f );
  
  PVector cam_eye = new PVector( hw, hh, 100.0 );
  cam_eye.add( cam_eye_offset );

  PVector cam_center = new PVector(  hw, hh, 0.0 );
  cam_center.add( cam_center_offset );

  PVector camup = new PVector( 0, 1, 0 );

  camera( 
    cam_eye.x, cam_eye.y, cam_eye.z, 
    cam_center.x, cam_center.y, cam_center.z, 
    camup.x, camup.y, camup.z );

  float f_near = 200; // << !important => objects size on screen
  float f_far = 100000; // should be far enough
  
  // magic numbers
  float cam_dist = cam_eye.dist( cam_center );
  float hypo = sqrt( pow( cam_dist + world_size, 2 ) + pow( world_size, 2 ) );
  // there must be a shorter way...
  float tana = tan( asin( world_size / hypo ) );
  
  float f_w_offset = ( x / world_size ) * f_near * tana;
  float f_h_offset = ( -y / world_size ) * f_near * tana;
  
  float f_left = -f_near * tana + f_w_offset;
  float f_right = f_near * tana + f_w_offset;

  float f_top = -f_near * tana + f_h_offset;
  float f_bottom = f_near * tana + f_h_offset;
  
  frustum( f_left, f_right, f_top, f_bottom, f_near, f_far );
  
  return new PVector( 1, width / float( height ), ( world_size / float( width ) ) / ( world_size / cam_dist ) );

}