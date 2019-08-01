class Drawer {
  Processor processor;
  Machine machine;
  Drawer(Processor t_processor, Machine t_machine) {
    processor = t_processor;
    machine = t_machine;
  }
  void display() {
    showPrinterChamber();
    showPreview();
  }
  void showPreview() {
    pushMatrix();
    translate(-machine.table_width/2, -machine.table_length/2);
    translate(42.5, 0);
    for (RShape shape : processor.shapes) {
      for (RShape child : shape.children) {
        RPoint[] points = child.getPoints();
        for (int i=0; i<points.length-1; i++) {
          RPoint p1 = points[i];
          RPoint p2 = points[i+1];
          stroke(i, i, i);
          line(p1.x, p1.y, p2.x, p2.y);
        }
      }
    }
    popMatrix();
  }
  void showPrinterChamber() { 
    pushMatrix();
    translate(-machine.table_width/2, -machine.table_length/2);
    translate(42.5, 0);
    fill(200);
    stroke(0);
    rectMode(CORNER);
    rect(0, 0, machine.table_width, machine.table_length);
    noFill();
    translate(machine.table_width/2, machine.table_length/2);
    box(machine.table_width, machine.table_length, machine.table_depth);
    popMatrix();
  }
}
