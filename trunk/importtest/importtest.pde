import arb.soundcipher.*;
import arb.soundcipher.constants.*;
import ddf.minim.*;
import ddf.minim.javasound.*;
import psimplicity.sound.*;
import psimplicity.core.*;


//Minim minim = new Minim(this);
Project project = new Project(this);
Stage stage;
Sprite froggy;
//CSound tooreal;
//String soundurl = "http://dl.dropbox.com/u/29199305/istayed.mp3";

void setup(){
  size(504,504);
  stage = new Stage("http://images1.pixlis.com/background-image-vertical-lines-and-stripes-seamless-tileable-chartreuse-olive-22rkk3.png");
  froggy = new Sprite(/*"http://www.majhost.com/gallery/veggieman/scans/frog.png",0,0*/);
  //tooreal = new CSound(soundurl);
  froggy.SetPenColorTo(#FF0000);
  froggy.SetPenSizeTo(4);
  froggy.PenDown();
  //if (Project.minim != null) println("ok");
}
void draw(){
  Project.Update();
}
void keyPressed(){
  if (Project.KeyPressed(UP)) froggy.ChangeYBy(5);
  if (Project.KeyPressed(DOWN)) froggy.ChangeYBy(-5);
  if (Project.KeyPressed(LEFT)) froggy.ChangeXBy(-5);
  if (Project.KeyPressed(RIGHT)) froggy.ChangeXBy(5);
  if (Project.KeyPressed(' ')) Project.PlayNoteForBeats(60,0.5);
}
