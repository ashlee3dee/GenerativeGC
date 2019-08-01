//*******************************************************************
//  Generative GCODE v0.0a
//  by Astrid Alaniz
//
//  This program is meant to be used creatively.
//  It is a set of tools to create vector based generative art,
//  one part generative art utilities, one part GCODE creation.
//  The end result is the output of a quality, well commented,
//  nearly-universal, GCODE file.
//  I will run them on my pen-plotter, but the tools can output
//  GCODE that will run on CNC mills, 3d printers, etc.
//  
//  This wouldn't be posssible without other people. The excellent
//  Geomerative library by Ricard Marxer, and a series of processing
//  tutorials written by Alberto Giachino, from CodePlastic.
// *******************************************************************

import geomerative.*;
import g4p_controls.*;
import java.util.Collections;
import java.util.Comparator;
import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
PeasyCam _cam;
Machine _machine;
Settings _settings;
Processor _processor;
Drawer _drawer;
GCodeGenerator _gCodeGenerator;

void setup() {
  size(1300, 800, P3D);
  RG.init(this);
  RCommand.setSegmentator(RCommand.ADAPTATIVE);

  createGUI();
  _cam = new PeasyCam(this, 200);
  _cam.setActive(true);
  _machine = new Machine();    
  _settings = new Settings();
  _processor = new Processor();

  //Cube cube1 = new Cube(_machine, _settings);
  //for (int i=0; i < 10; i++) {
  //  cube1.generate(random(20, _machine.table_width-20), random(20, _machine.table_length-20), random(10, 20));
  //  _processor.addObject(cube1);
  //}

  //String path = "obj/Lamborghini_Low_Poly.obj";
  println("mesh debug:");
  Mesh mesh1 = new Mesh(_machine, _settings, "obj/Lamborghini_Low_Poly.obj");
  println("mesh loaded");
  mesh1.generate(_machine.table_width/2, _machine.table_length/2, 2, 100);
  println("mesh generated");
  _processor.addObject(mesh1);
  println("mesh added");
  _processor.process();
  println("processed");
  _drawer = new Drawer(_processor, _machine);
  _gCodeGenerator = new GCodeGenerator(_machine, _settings, _processor);
  println("gcode generated");
  _gCodeGenerator.generate().export();
  println("gcode exported");
}

void draw() {
  background(255);
  _drawer.display();
}
