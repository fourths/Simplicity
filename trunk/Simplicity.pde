//Simplicity
//veg & pf

//minim for sound
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim = new Minim(this);

void Stop(){
  noLoop();
}

void Exit(){
  exit(); 
}

float PickRandom(float low,float high){
  return random(low, high);
}
int PickRandom(int low,int high){
  return int(random(low, high));
}
float PickRandom(float low,int high){
  return random(low, high);
}
float PickRandom(int low,float high){
  return random(low, high);
}
float PickRandom(Variable low,Variable high){
  return random(float(low.value.toString()), float(high.value.toString()));
}
float PickRandom(Variable low, int high){
  return random(float(low.value.toString()), high);
}
float PickRandom(int low, Variable high){
  return random(low, float(high.value.toString()));
}
float PickRandom(Variable low, float high){
  return random(float(low.value.toString()), high);
}
float PickRandom(float low, Variable high){
  return random(low, float(high.value.toString()));
}


int LengthOf(int val){
  return str(val).length(); 
}
int LengthOf(float val){
  return str(val).length(); 
}
int LengthOf(String val){
  return val.length(); 
}
int LengthOf(Variable val){
  return val.value.length(); 
}

String Join(Variable vval,String sval){
  String[] tar = new String[2];
  tar[0] = vval.value.toString();
  tar[1] = sval;
  return join(tar,"");
}
String Join(String sval,Variable vval){
  String[] tar = new String[2];
  tar[0] = sval;
  tar[1] = vval.value.toString();
  return join(tar,"");
}
String Join(Variable vval,Variable vval2){
  String[] tar = new String[2];
  tar[0] = vval.value.toString();
  tar[1] = vval2.value.toString();
  return join(tar,"");
}
String Join(String sval,String sval2){
  String[] tar = new String[2];
  tar[0] = sval;
  tar[1] = sval2;
  return join(tar,"");
}

String LetterOf(int loc,String val){
  return str(val.charAt(loc));
}
String LetterOf(int loc,Variable val){
  return str(val.value.charAt(loc));
}

boolean MouseDown(){
  if (mousePressed) return true;
  else return false;
}
boolean MouseDown(String btn){
  if (mousePressed){
    if (btn == "left" || btn == "Left" || btn == "LEFT"){
      if (mouseButton == LEFT) return true;
      else return false; 
    }
    if (btn == "right" || btn == "Right" || btn == "RIGHT"){
      if (mouseButton == RIGHT) return true;
      else return false; 
    }
    if (btn == "center" || btn == "Center" || btn == "CENTER" || btn == "middle" || btn == "Middle" || btn == "MIDDLE"){
      if (mouseButton == CENTER) return true;
      else return false; 
    }
    else return false;
  }
  else return false;  
}
boolean MouseDown(int btn){
  if (mousePressed){
    if (btn == 1){
      if (mouseButton == LEFT) return true;
      else return false; 
    }
    if (btn == 2){
      if (mouseButton == RIGHT) return true;
      else return false; 
    }
    if (btn == 3){
      if (mouseButton == CENTER) return true;
      else return false; 
    }
    else return false;
  }
  else return false;
}

//KEY SENSING
boolean KeyPressed(char lpkey){
  if(keyPressed){
    if (key == lpkey || key == str(lpkey).toUpperCase().charAt(0)){
      return true;
    }
    else return false;
  }
  else return false;
}
boolean KeyPressed(String keyc){
  if(keyc == "up" || keyc == "Up" || keyc == "UP"){
    if(keyPressed){
      if (keyCode == UP){
        return true;
      }
      else return false;
    }
    else return false;
  }
  if(keyc == "down" || keyc == "Down" || keyc == "DOWN"){
    if(keyPressed){
      if (keyCode == DOWN){
        return true;
      }
      else return false;
    }
    else return false;
  }
  if(keyc == "left" || keyc == "Left" || keyc == "LEFT"){
    if(keyPressed){
      if (keyCode == LEFT){
        return true;
      }
      else return false;
    }
    else return false;
  }
  if(keyc == "right" || keyc == "Right" || keyc == "RIGHT"){
    if(keyPressed){
      if (keyCode == RIGHT){
        return true;
      }
      else return false;
    }
    else return false;
  }
  if(keyc == "shift" || keyc == "Shift" || keyc == "SHIFT"){
    if(keyPressed){
      if (keyCode == SHIFT){
        return true;
      }
      else return false;
    }
    else return false;
  }
  if(keyc == "alt" || keyc == "Alt" || keyc == "ALT"){
    if(keyPressed){
      if (keyCode == ALT){
        return true;
      }
      else return false;
    }
    else return false;
  }
  if(keyc == "control" || keyc == "Control" || keyc == "CONTROL" || keyc == "ctrl" || keyc == "Ctrl" || keyc =="CTRL"){
    if(keyPressed){
      if (keyCode == CONTROL){
        return true;
      }
      else return false;
    }
    else return false;
  }
  if(keyc == "backspace" || keyc == "Backspace" || keyc == "BACKSPACE" || keyc == "delete" || keyc == "Delete" || keyc == "DELETE"){
    if(keyPressed){
      if (key == BACKSPACE || key == DELETE){
        return true;
      }
      else return false;
    }
    else return false;
  }
  if(keyc == "tab" || keyc == "Tab" || keyc == "TAB"){
    if(keyPressed){
      if (key == TAB){
        return true;
      }
      else return false;
    }
    else return false;
  }
  if(keyc == "esc" || keyc == "Esc" || keyc == "ESC" || keyc == "escape" || keyc == "Escape" || keyc == "ESCAPE"){
    if(keyPressed){
      if (key == ESC){
        return true;
      }
      else return false;
    }
    else return false;
  }
  if(keyc == "enter" || keyc == "Enter" || keyc == "ENTER" || keyc == "return" || keyc == "Return" || keyc == "RETURN"){
    if(keyPressed){
      if (key == ENTER || key == RETURN){
        return true;
      }
      else return false;
    }
    else return false;
  }
  if(keyc == "space" || keyc == "Space" || keyc == "SPACE"){
    if(keyPressed){
      if(key == ' ') return true;
      else return false;
    } 
    else return false;
  }
  else return false;
}


//SPRITE CLASS / MOST FUNCTIONS
class Sprite {
  boolean saying,thinking,hidden;
  String saystring;
  int width,height,typ,costNo,ssize;
  int x,y;
  ArrayList costumes = new ArrayList();
  Sprite (int xx, int yy, int wid, int hei){
    x=xx;
    y=yy;
    width=wid;
    height=hei;
    typ=1;
    ssize=100;
  }
  Sprite (String im, int xx, int yy){
    x=xx;
    y=yy;
    costumes.add(new Costume(im));
    Costume cost = (Costume) costumes.get(0);
    width=cost.width;
    height=cost.height;
    costNo=0;
    typ=2;
    ssize=100;
  }
  
  void update(){
    if (!hidden){
      if (typ==1){
        fill(255);
        //draw rectangle at given coordinates with set height/width
        rect(x,y,width,height);
      }
      else if (typ==2){
        Costume cost = (Costume) costumes.get(CostumeNumber());
        width  = cost.img.width  + (width  - cost.img.width);
        height = cost.img.height + (height - cost.img.height);
        image(cost.img,x,y,width,height); 
      }
      
      if (saying) {
        fill(255);
        stroke(#000000);
        rect(x + width, (y - height) + (height/2), textWidth(saystring)+20, 35);
        fill(#000000);
        text(saystring, x + width + 10, ((y - height)+(height/2))+(35/2+5));
      }
      else if (thinking) {
        fill(255);
        stroke(#000000);
        rect(x + width, (y - height) + (height/2), textWidth(saystring)+20, 35);
        fill(#000000);
        text(saystring, x + width + 10, ((y - height)+(height/2))+(35/2+5));
      }
    }
  }
  //BLOCKS
  
  //---------------------------
  //------CONTROL--------------
  //---------------------------
  
  void Wait(float wait_time){
    delay(round(wait_time*1000)); 
  }
  void Wait(int wait_time){
    delay(round(wait_time*1000)); 
  }
  void Wait(Variable wait_time){
    delay(round(float(wait_time.toString())*1000)); 
  }
  
  boolean Clicked(){
    if (mousePressed && mouseX>x && mouseX<x+width && mouseY>y && mouseY<y+height){
      return true; 
    }
    else return false;
  }
  
  boolean Received(Broadcast b){
    if (b.sent){
      b.sent = false;
      return true;
    }
    else return false;
  }
  //---------------------------
  //------MOTION---------------
  //---------------------------
  
  int XPosition(){
    return x;
  }
  
  int YPosition(){
    return y;
  }
  
  void GoTo(int xx,int yy){
    x=xx;
    y=yy;
  }
  void GoTo(Variable xx,Variable yy){
    x=int(xx.toString());
    y=int(yy.toString());
  }
  void GoTo(String mouse){
    if (mouse=="mouse"||mouse=="MOUSE"||mouse=="Mouse"){
      x=mouseX;
      y=mouseY;
    } 
  }
  void GoTo(Sprite spr){
    x=spr.x;
    y=spr.y;
  }
  
  //NEED SECONDS/REDO
  void GlideTo(int xx,int yy){
    while(x!=xx){
      if (x>xx){
        x-=1; 
      }
      else {
        x+=1; 
      }
    }
    while(y!=yy){
      if (y>yy){
        y-=1; 
      }
      else {
        y+=1; 
      }
    }
  }
  
  void ChangeXBy(int amt){
    x+=amt;
  }
  void ChangeXBy(Variable amt){
    x+=int(amt.toString());
  }
  
  void ChangeYBy(int amt){
    y-=amt;
  }
  void ChangeYBy(Variable amt){
    y-=int(amt.toString());
  }
  
  void SetXTo(int amt){
    x=amt;
  }
  void SetXTo(Variable amt){
    x=int(amt.toString());
  }
  
  void SetYTo(int amt){
    y=amt;
  }
  void SetYTo(Variable amt){
    y=int(amt.toString());
  }
  
  void MoveSteps(int steps){
    for (int i=0; i<steps; i++){
      x+=5;
    }
  }
  void MoveSteps(Variable steps){
    for (int i=0; i<int(steps.toString()); i++){
      x+=5;
    }
  }
  
  //---------------------------
  //------LOOKS----------------
  //---------------------------
  
  void Say(String vsay){
    saying = true;
    saystring = vsay;
  }
  void Say(Variable vsay){
    saying = true;
    saystring = vsay.toString();
  }
  
  void Think(String vsay){
    thinking = true;
    saystring = vsay;
  }
  void Think(Variable vsay){
    thinking = true;
    saystring = vsay.toString();
  }
  
  void SwitchToCostume(int newCost){
    costNo = newCost; 
  }
  void SwitchToCostume(float newCost){
    costNo = int(newCost); 
  }
  void SwitchToCostume(Variable newCost){
    costNo = int(newCost.toString()); 
  }
  
  void NextCostume(){
    if (CostumeNumber()+1>=costumes.size()) SwitchToCostume(0);
    else costNo++;
  }
  
  void AddCostume(String im){
    costumes.add(new Costume(im)); 
  }
  
  int CostumeNumber(){
    return costNo; 
  }
  
  int Size(){  
    return ssize;
  }
  
  void SetSizeTo(int val){
    Costume cost = (Costume) costumes.get(CostumeNumber());
    width =((val*cost.width)/100);
    height=((val*cost.height)/100);
    ssize = val;
  }
  void SetSizeTo(Variable val){
    Costume cost = (Costume) costumes.get(CostumeNumber());
    width =((int(val.toString())*cost.width)/100);
    height=((int(val.toString())*cost.height)/100);
    ssize = int(val.toString());
  }
  
  void ChangeSizeBy(int val){
    SetSizeTo(Size()+val);
  }
  void ChangeSizeBy(Variable val){
    SetSizeTo(Size()+int(val.toString()));
  }
  
  void Show(){
    hidden = false; 
  }
  
  void Hide(){
    hidden = true; 
  }
  
  //---------------------------
  //------SENSING--------------
  //---------------------------
  
  boolean Touching(Sprite spr){
    if ((x>=spr.x && y>=spr.y) || (x+width>=spr.x && y+height>=spr.y)){
      if (x<=spr.x+spr.width && y<=spr.y+spr.height){
        if ((x+width)>=spr.x && (y+height)>=spr.y){
          return true; 
        }
        if ((x+width<=spr.x+spr.width) && (y+width<=spr.y+spr.height)){
          return true;
        }
        else return false;
      }
      else return false;
    }
    else return false;
  }
  
  float Distance(Sprite spr){
    return dist(x,y,spr.x,spr.y);
  }

  class Costume{
    PImage img;
    int width,height;
    Costume (String cIm){
      img = loadImage(cIm);
      width = img.width;
      height = img.height;
    }
  }
}

class Broadcast {
  boolean sent = false;
  Broadcast (){
  }
  void Send(){
    if(!sent){
      sent = true;
    }
    else {
      sent = false;
    }
  }
}

class Variable{
  StringBuffer value;
  Variable(){
    value = new StringBuffer("0");
  }
  Variable(int val){
    value = new StringBuffer(str(val));
  }
  Variable(float val){
    value = new StringBuffer(str(val));
  }
  Variable(String val){
    value = new StringBuffer(val);
  }
  //SETTING VARIABLE VALUES
  void SetTo(int val){
    value.replace(0,value.length(),str(val));
  }
  void SetTo(float val){
    value.replace(0,value.length(),str(val));
  }
  void SetTo(String val){
    value.replace(0,value.length(),val);
  }
  void ChangeBy(int val){
    if (float(value.toString())*0 != 0) SetTo(val); 
    else value.replace(0,value.length(),str(float(value.toString())+val));
  }
  void ChangeBy(float val){
    if (float(value.toString())*0 != 0) SetTo(val); 
    else value.replace(0,value.length(),str(float(value.toString())+val));
  }
  void ChangeBy(Variable val){
    if (float(value.toString())*0 != 0) SetTo(val.value.toString());
    else value.replace(0,value.length(),str(float(value.toString())+float(val.value.toString())));
  }
  
  //CONVERSIONS
  
  int toInt(){
    return int(value.toString());
  }
  float toFloat(){
    return float(value.toString()); 
  }
  boolean toBoolean(){
    if (value.toString() == "1" || value.toString() == "true" || value.toString() == "True" || value.toString() == "TRUE"){
      return true;
    }
    else return false;
  }
  String toString(){
    return value.toString();
  }
}

class List{
  ArrayList values;
  //CONSTRUCTORS
  List(){
    values = new ArrayList();
  }
  List(int ival){
    values = new ArrayList();
    Variable tvar = new Variable(ival);
    values.add(tvar);
  }
  List(float ival){
    values = new ArrayList(); 
    Variable tvar = new Variable(ival);
    values.add(tvar);
  }
  List(String ival){
    values = new ArrayList();
    Variable tvar = new Variable(ival);
    values.add(tvar);
  }
  List(Variable ival){
    values = new ArrayList(); 
    values.add(ival);
  }
  
  //FUNCTIONS
  void AddTo(int val){
    Variable tvar = new Variable(val);
    values.add(tvar);
  }
  void AddTo(float val){
    Variable tvar = new Variable(val);
    values.add(tvar);
  }
  void AddTo(String val){
    Variable tvar = new Variable(val);
    values.add(tvar);
  }
  void AddTo(Variable val){
    values.add(val);
  }
  
  void DeleteOf(int val){
    values.remove(val);
  }
  
  void InsertAt(int val,int loc){
    Variable tvar = new Variable(val);
    values.add(loc,tvar);
  }
  void InsertAt(float val,int loc){
    Variable tvar = new Variable(val);
    values.add(loc,tvar);
  }
  void InsertAt(String val,int loc){
    Variable tvar = new Variable(val);
    values.add(loc,tvar);
  }
  void InsertAt(Variable val,int loc){
    values.add(loc,val);
  }
  
  void ReplaceWith(int loc, int val){
    Variable tvar = new Variable(val);
    values.remove(loc);
    values.add(loc,tvar);
  }
  void ReplaceWith(int loc, float val){
    Variable tvar = new Variable(val);
    values.remove(loc);
    values.add(loc,tvar);
  }
  void ReplaceWith(int loc, String val){
    Variable tvar = new Variable(val);
    values.remove(loc);
    values.add(loc,tvar);
  }
  void ReplaceWith(int loc, Variable val){
    values.remove(loc);
    values.add(loc,val);
  }
  
  Variable Item(int loc){
    return (Variable) values.get(loc); 
  }
  
  int Length(){
    return values.size(); 
  }
  
  boolean Contains(String val){
    for (int i=0; i<values.size(); i++){
      Variable tvar = (Variable) values.get(i);
      if (tvar.value.toString().equals(val)){
        return true;
      }
    }
    return false;
  }
  boolean Contains(int val){
    for (int i=0; i<values.size(); i++){
      Variable tvar = (Variable) values.get(i);
      if (int(tvar.value.toString()) == val){
        return true;
      }
    }
    return false;
  }
  boolean Contains(float val){
    for (int i=0; i<values.size(); i++){
      Variable tvar = (Variable) values.get(i);
      if (float(tvar.value.toString()) == val){
        return true;
      }
    }
    return false;
  }
  boolean Contains(Variable val){
    for (int i=0; i<values.size(); i++){
      Variable tvar = (Variable) values.get(i);
      if ((Variable) values.get(i) == val){
        return true;
      }
    }
    return false;
  }
}

class Stage{
  ArrayList backgrounds = new ArrayList();
  int bckNo;
  
  Stage(String im){
    backgrounds.add(new Background(im));
  }
  Stage(color clr){
    backgrounds.add(new Background(clr)); 
  }
  
  void update(){
    translate(width/2,height/2);
    imageMode(CENTER);
    Background bck = (Background) backgrounds.get(BackgroundNumber());
    if (bck.img != null) background(bck.img);
    else background(bck.colour);
  }
  
  class Background{
    PImage img;
    color colour;
    int w,h;
    Background (String im){
      img = loadImage(im);
      w = width;
      h = height;
    }
    Background (color clr){
      colour = clr;
      w = width;
      h = height;
    }
  }
  
  void NextBackground(){
    if (BackgroundNumber()+1>=backgrounds.size()) SwitchToBackground(0);
    else bckNo++;
  }
  
  void SwitchToBackground(int newbck){
    bckNo = newbck;
  }
  void SwitchToBackground(float newbck){
    bckNo = int(newbck);
  }
  void SwitchToBackground(String newbck){
    bckNo = int(newbck);
  }
  void SwitchToBackground(Variable newbck){
    bckNo = int(newbck.value.toString());
  }
  
  void AddBackground(String im){
    backgrounds.add(new Background(im)); 
  }
  void AddBackground(color clr){
    backgrounds.add(new Background(clr));
  }
  
  int BackgroundNumber(){
    return bckNo; 
  } 
}

ArrayList sounds = new ArrayList();

//SOUND CLASS
class Sound{
  AudioPlayer player;
  Sound(String sndlnk){
    player = minim.loadFile(sndlnk);
    sounds.add(this);
  }
  Sound(Variable sndlnk){
    player = minim.loadFile(sndlnk.toString());
    sounds.add(this);
  }
  
  //SOUND FUNCTIONS
  float Volume(){
    return player.getGain();
  }
  
  void SetVolumeTo(int val){
    player.setGain(val);
  }
  void SetVolumeTo(float val){
    player.setGain(val);
  }
  void SetVolumeTo(Variable val){
    player.setGain(float(val.value.toString()));
  }
  
  void ChangeVolumeBy(int val){
    SetVolumeTo(Volume()+val);
  }
  void ChangeVolumeBy(float val){
    SetVolumeTo(Volume()+val);
  }
  void ChangeVolumeBy(Variable val){
    SetVolumeTo(Volume()+float(val.value.toString()));
  }
  
  void Play(){
    player.play();
  }
  
  void Pause(){
    player.pause(); 
  }
  
  void Stop(){
    player.rewind();
    player.pause();
  }
}

void StopAllSounds(){
  for (int i = 0; i<sounds.size(); i++){
    Sound fsnd = (Sound) sounds.get(i);
    if (fsnd.player.isPlaying()){
      fsnd.Stop(); 
    }
  }
}

class Microphone{
  AudioInput mic;
  Microphone(){
    if (minim.getLineIn() != null){
      mic = minim.getLineIn();
    }
    //println(mic);
  }
  
  int ln=-1;
  int Loudness(){
    if (mic != null){ ln++; if (ln==1024) ln=0; return int(map(mic.mix.get(ln),-1,1,0,100)); }
    else return 0;
  }
  
  boolean Loud(){
    if (Loudness()>30) return true;
    else return false;
  }
}

void SoundCleanse(){
  for (int i = 0; i<sounds.size(); i++){
    Sound fsnd = (Sound) sounds.get(i);
    fsnd.player.close();
  }
  minim.stop();
}
