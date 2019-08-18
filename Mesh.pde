class Mesh extends Creator { //<>//
  String filePath;
  GMatrix matrix;
  Mesh(Machine t_machine, Settings t_settings, String _filePath) {
    super(t_machine, t_settings);
    filePath = _filePath;
    matrix = new GMatrix();
  }
  Mesh(Machine t_machine, Settings t_settings, String _filePath, PVector _rotationVector) {
    super(t_machine, t_settings);
    filePath = _filePath;
    matrix = new GMatrix();
    matrix.setRotationVector(_rotationVector);
  }
  void generate(float c_x, float c_y, float c_s, float c_d) {
    RShape t_shape = new RShape();
    PShape t_obj = loadShape(filePath);
    for (int i = 0; i < t_obj.getChildCount(); i++) {

      if (true) { //backface culling result
        PShape face = t_obj.getChild(i);
        RShape _face = new RShape();
        PVector startPoint = new PVector(face.getVertexX(0), face.getVertexY(0), face.getVertexZ(0));
        startPoint = matrix.applyPerspective(startPoint);
        _face.addMoveTo(startPoint.x, startPoint.y);
        int numVertices = face.getVertexCount();
        for (int j = 0; j < numVertices; j++) {
          PVector _v = new PVector(face.getVertexX(j), face.getVertexY(j), face.getVertexZ(j));
          _v = matrix.applyPerspective(_v);
          _face.addLineTo(_v.x, _v.y);
        }
        t_shape.addChild(_face);
      }
    }
    t_shape.scale(c_s);
    t_shape.translate(c_x, c_y);
    shapes.add(t_shape);
  }
}
