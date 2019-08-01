class Cube extends Creator {
  Cube(Machine t_machine, Settings t_settings) {
    super(t_machine, t_settings);
  }
  void generate(float c_x, float c_y, float c_s) {
    RShape t_shape = new RShape();
    RPoint shapeCenter = new RPoint(c_x+c_s/2,c_y+c_s/2); 
    float t_c_s = 1;
    for (int i=0; i < slider_recursion.getValueI(); i++) {
      RShape t_child = RShape.createRectangle(c_x, c_y, c_s, c_s);
      t_child.scale(t_c_s, shapeCenter);
      t_child.rotate(slider_rotation.getValueF()*i, shapeCenter);
      t_shape.addChild(t_child);
      t_c_s*=slider_scale.getValueF();
    }
    shapes.add(t_shape);
  }
}
