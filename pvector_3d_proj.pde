  PShape my_sphere;
ArrayList<PVector> vertices = new ArrayList<PVector>();
  
  void setup(){
  size(800, 600, P3D);
  frameRate(60);
  smooth();
  sphereDetail(10);
  fill(201,8,255);
  my_sphere = createShape(SPHERE, 100);
}
 
void draw(){
  background(255,255,255);
  pushMatrix();
  translate(width/2, height/2);
  rotateZ(millis() * 0.0001 * TWO_PI);
  rotateY(millis() * 0.0001 * TWO_PI);
  draw_sphere();
  draw_points();
  vertices.clear();
  popMatrix();
}
 
void draw_sphere(){
  shape(my_sphere);
  my_sphere.setVisible(true);
}
 
void draw_points(){
  getVertices(my_sphere, vertices);
  for(int i=0; i < vertices.size(); i++){
    PVector vertex = vertices.get(i);
    float x = vertex.x;
    float y = vertex.y;
    float z = vertex.z;
    pushMatrix();
    translate(x, y, z);
    sphere(10);
    popMatrix();
  }
}
 
void getVertices(PShape shape, ArrayList<PVector> vertices){
  for(int i = 0 ; i < shape.getVertexCount(); i++){
    PVector vertex = shape.getVertex(i);
    vertices.add(vertex);
  }
}