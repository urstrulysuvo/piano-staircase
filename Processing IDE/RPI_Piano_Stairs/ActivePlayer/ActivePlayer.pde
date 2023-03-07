import processing.serial.*;
import ddf.minim.*;
import java.util.Map;

Serial myPort;
HashMap<String, Player> playerMap = new HashMap<String, Player>();

void setup() {
  myPort = new Serial(this, "/dev/ttyUSB0", 9600);
  textFont(createFont("Piboto Regular", 16), 64);
  
  //playerMap.put("a", new Player(this, "piano-notes/APiano4-a.wav"));
  //playerMap.put("b", new Player(this, "piano-notes/APiano4-b.wav"));
  //playerMap.put("c", new Player(this, "piano-notes/APiano4-c.wav"));
  //playerMap.put("d", new Player(this, "piano-notes/APiano4-d.wav"));
  //playerMap.put("e", new Player(this, "piano-notes/APiano4-e.wav"));
  //playerMap.put("f", new Player(this, "piano-notes/APiano4-f.wav"));
  //playerMap.put("g", new Player(this, "piano-notes/APiano4-g.wav"));
  //playerMap.put("x", new Player(this, "piano-notes/APiano4-c1.wav"));
  //playerMap.put("y", new Player(this, "piano-notes/APiano4-d1.wav"));
  
  playerMap.put("a", new Player(this, "piano-notes/APiano5-a.wav"));
  playerMap.put("b", new Player(this, "piano-notes/APiano5-b.wav"));
  playerMap.put("c", new Player(this, "piano-notes/APiano5-c.wav"));
  playerMap.put("d", new Player(this, "piano-notes/APiano5-d.wav"));
  playerMap.put("e", new Player(this, "piano-notes/APiano5-e.wav"));
  playerMap.put("f", new Player(this, "piano-notes/APiano5-f.wav"));
  playerMap.put("g", new Player(this, "piano-notes/APiano5-g.wav"));
  playerMap.put("x", new Player(this, "piano-notes/APiano5-c1.wav"));
  playerMap.put("y", new Player(this, "piano-notes/APiano5-d1.wav"));
}

void draw() { 
  if(myPort.available() > 0) {
    String val = myPort.readStringUntil('\n');
    if (val != null && val.length() == 2) {
      val = val.substring(0, 1);
      background(255);
      text(val, 34, height / 2 + 18);
      fill(0);
      playerMap.get(val).play();
    }
  }
}
