import ddf.minim.*;
import psimplicity.sound.*;
import psimplicity.core.*;

Project project = new Project(this);
Stage stage;
Sprite froggy;
Sound tooreal;

void setup(){
  size(500,500);
  stage = new Stage("http://fc02.deviantart.net/fs71/i/2012/150/9/f/simokovitch_by_banoinoi-d51ptle.png");
  froggy = new Sprite("http://www.majhost.com/gallery/veggieman/scans/frog.png",0,0);
  tooreal = new Sound("https://dl.dropbox.com/u/29199305/tooreal.mp3");
  froggy.SetPenColorTo(#FF0000);
  froggy.SetPenSizeTo(10);
  froggy.PenDown();
}
void draw(){
  project.Update();
}
void keyPressed(){
  if (Project.KeyPressed(UP)) froggy.ChangeYBy(5);
  if (Project.KeyPressed(DOWN)) froggy.ChangeYBy(-5);
  if (Project.KeyPressed(LEFT)) froggy.ChangeXBy(-5);
  if (Project.KeyPressed(RIGHT)) froggy.ChangeXBy(5);
}
