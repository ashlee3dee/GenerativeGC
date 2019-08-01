class Processor {
  ArrayList<Creator> objects = new ArrayList<Creator>();
  ArrayList<RShape> shapes;
  Processor addObject(Creator object) {
    objects.add(object);
    return this;
  }
  void process() {
    shapes = new ArrayList<RShape>();
    for (Creator obj : objects) {
      for (RShape shape : obj.shapes) {
          shapes.add(shape);
      }
    }
  }
}
