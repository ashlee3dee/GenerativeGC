class GCodeGenerator {
  ArrayList<String> gcode;
  Machine printer;
  Settings settings;
  Processor processor;
  GCodeGenerator(Machine t_machine, Settings t_settings, Processor t_processor) {
    printer = t_machine;
    settings = t_settings;
    processor = t_processor;
  }
  GCodeGenerator generate() {
    gcode = new ArrayList<String>();
    startPlot();
    comment("looping through shapes in processor");
    for (RShape shape : processor.shapes) {
      for (RShape child : shape.children) {
        comment("move to first point of shape");
        moveTo(child.getPoint(0));
        lowerTool();
        RPoint[] points = child.getPoints();
        comment("looping through points in shape");
        for (int i=0; i<points.length; i++) {
          RPoint p1 = points[i];
          writeTo(p1);
        }
      }
    }
    endPlot();
    return this;
  }
  void write(String command) {
    gcode.add(command);
  }
  void comment(String comment)
  {
    gcode.add("; "+comment);
  }
  void moveTo(RPoint p) {
    comment("travelling to position");
    raiseTool();
    write("G00 " + "X" + p.x + " Y" + p.y + " F" + settings.travel_speed);
  }
  void writeTo(RPoint p2) {
    write("G1 " + "X" + p2.x + " Y" + p2.y);
  }
  void writeTo(RPoint p2, float f) {
    comment("writing to position with specified feedrate");
    write("G1 " + "X" + p2.x + " Y" + p2.y);
  }
  void raiseTool() {
    comment("raising tool");
    write("G00" + " Z" + 0 + " F" + settings.retraction_speed);
  }
  void lowerTool() {
    comment("lowering tool");
    write("G00" + " Z" + settings.retraction_amount + " F" + settings.retraction_speed);
  }
  void setSpeed(float speed) {
    comment("overriding feedrate");
    write("G1 F" + speed);
  }
  void startPlot() {
    comment("starting plot");
    write("G28 X0 Y0"+" ; home xy"); //Home X and Y axes
    write("G90"+" ; set absolute movement mode"); //Absolute mode
    //write("G00 X" + printer.x_center_table + " Y" + printer.y_center_table + " F8000" + " ; move to center of work area"); //Go to the center
  }
  void endPlot() {
    comment("ending plot");
    raiseTool(); //Retract filament to avoid filament drop on last layer
    write("G28 X0 Y0"); //Home X and Y axes
  }
  void export() {
    //Create a unique name for the exported file
    String name_save = "/output/figure_"+day()+""+hour()+""+minute()+"_"+second()+".gcode";
    //Convert from ArrayList to array (required by saveString function)
    String[] arr_gcode = gcode.toArray(new String[gcode.size()]);
    // Export GCODE
    saveStrings(name_save, arr_gcode);
  }
}
