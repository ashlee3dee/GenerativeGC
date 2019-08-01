/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void slider_size_changed(GSlider source, GEvent event) { //_CODE_:slider_size:943360:
  println("slider1 - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:slider_size:943360:

public void checkbox1_clicked1(GCheckbox source, GEvent event) { //_CODE_:checkbox1:292063:
  println("checkbox1 - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:checkbox1:292063:

public void slider_recursion_changed(GSlider source, GEvent event) { //_CODE_:slider_recursion:447703:
  println("slider2 - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:slider_recursion:447703:

public void slider_scale_changed(GSlider source, GEvent event) { //_CODE_:slider_scale:400999:
  println("slider3 - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:slider_scale:400999:

public void button_generate_clicked(GButton source, GEvent event) { //_CODE_:button_generate:585802:
  println("button_generate - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:button_generate:585802:

public void slider_rotation_changed(GSlider source, GEvent event) { //_CODE_:slider_rotation:428354:
  println("slider_rotation - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:slider_rotation:428354:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.CYAN_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  label_Options = new GLabel(this, 10, 10, 280, 27);
  label_Options.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label_Options.setText("Options");
  label_Options.setOpaque(true);
  slider_size = new GSlider(this, 90, 50, 200, 30, 10.0);
  slider_size.setLimits(50.0, 50.0, 100.0);
  slider_size.setNumberFormat(G4P.DECIMAL, 2);
  slider_size.setOpaque(false);
  slider_size.addEventHandler(this, "slider_size_changed");
  checkbox1 = new GCheckbox(this, 90, 210, 80, 30);
  checkbox1.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox1.setText("randomize");
  checkbox1.setOpaque(true);
  checkbox1.addEventHandler(this, "checkbox1_clicked1");
  slider_recursion = new GSlider(this, 90, 90, 200, 30, 10.0);
  slider_recursion.setLimits(5, 0, 100);
  slider_recursion.setNumberFormat(G4P.INTEGER, 0);
  slider_recursion.setOpaque(false);
  slider_recursion.addEventHandler(this, "slider_recursion_changed");
  slider_scale = new GSlider(this, 90, 130, 200, 30, 10.0);
  slider_scale.setLimits(0.9, 0.01, 0.99);
  slider_scale.setNumberFormat(G4P.DECIMAL, 2);
  slider_scale.setOpaque(false);
  slider_scale.addEventHandler(this, "slider_scale_changed");
  label_size = new GLabel(this, 10, 50, 70, 30);
  label_size.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label_size.setText("Size");
  label_size.setOpaque(true);
  label_scale = new GLabel(this, 10, 130, 70, 30);
  label_scale.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label_scale.setText("Scale");
  label_scale.setOpaque(true);
  label_recursion = new GLabel(this, 10, 90, 70, 30);
  label_recursion.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label_recursion.setText("Recursion");
  label_recursion.setOpaque(true);
  button_generate = new GButton(this, 10, 210, 70, 30);
  button_generate.setText("Generate");
  button_generate.addEventHandler(this, "button_generate_clicked");
  label_rotation = new GLabel(this, 10, 170, 70, 30);
  label_rotation.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label_rotation.setText("Rotation");
  label_rotation.setOpaque(true);
  slider_rotation = new GSlider(this, 90, 170, 200, 30, 10.0);
  slider_rotation.setLimits(10.0, 0.0, 90.0);
  slider_rotation.setNumberFormat(G4P.DECIMAL, 2);
  slider_rotation.setOpaque(false);
  slider_rotation.addEventHandler(this, "slider_rotation_changed");
}

// Variable declarations 
// autogenerated do not edit
GLabel label_Options; 
GSlider slider_size; 
GCheckbox checkbox1; 
GSlider slider_recursion; 
GSlider slider_scale; 
GLabel label_size; 
GLabel label_scale; 
GLabel label_recursion; 
GButton button_generate; 
GLabel label_rotation; 
GSlider slider_rotation; 
