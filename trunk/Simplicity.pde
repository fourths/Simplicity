//Simplicity
//code by veggieman and transparent

//minim for sound
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim = new Minim(this);
int MouseX,MouseY;
boolean asking;
color askcolour;
String askstring,finalResponse;
Variable response = new Variable("");
final static float E = exp(1);
final static int COLOR = 632;
final static int EDGE = 226;
final static int MOUSE = 227;
final static int LEFTBTN = 520;
final static int CENTERBTN = 521;
final static int RIGHTBTN = 522;
final static int TOPEDGE = 117;
final static int BOTTOMEDGE = 118;
final static int LEFTEDGE = 119;
final static int RIGHTEDGE = 120;
int timer,lastreset;
PGraphics penarea;


//palette definition
//color[] palette = {
//color(255,0,0),color(255,7,0),color(255,15,0),color(255,23,0),color(255,30,0),color(255,38,0),
//color(255,46,0),color(255,53,0),color(255,61,0),color(255,69,0),color(255,76,0),color(255,84,0),
//color(255,92,0),color(255,99,0),color(255,107,0),color(255,115,0),color(255,122,0),color(255,130,0),
//color(255,138,0),color(255,145,0),color(255,153,0),color(255,161,0),color(255,168,0),color(255,176,0),
//color(255,184,0),color(255,191,0),color(255,199,0),color(255,207,0),color(255,207,0),color(255,214,0),
//color(255,222,0),color(255,230,0),color(255,230,0),color(255,237,0),color(255,245,0),color(255,253,0),
//color(250,255,0),color(243,255,0),color(235,255,0),color(227,255,0),color(220,255,0),color(220,255,0),
//color(212,255,0),color(204,255,0),color(204,255,0),color(197,255,0),color(189,255,0),color(181,255,0),
//color(174,255,0),color(166,255,0),color(158,255,0),color(151,255,0),color(143,255,0),color(135,255,0),
//color(128,255,0),color(120,255,0),color(112,255,0),color(104,255,0),color(97,255,0),color(89,255,0),
//color(81,255,0),color(74,255,0),color(66,255,0),color(58,255,0),color(51,255,0),color(43,255,0),
//color(35,255,0),color(28,255,0),color(20,255,0),color(12,255,0),}; 

void Stop(){
  noLoop();
}

void Exit(){
  exit(); 
}

float Sin(float val){
  return degrees(sin(val)); 
}
float Sin(int val){
  return degrees(sin(val)); 
}
float Sin(Variable val){
  return degrees(sin(float(val.toString()))); 
}

float Cos(float val){
  return degrees(cos(val)); 
}
float Cos(int val){
  return degrees(cos(val)); 
}
float Cos(Variable val){
  return degrees(cos(float(val.toString()))); 
}

float Tan(float val){
  return degrees(tan(val)); 
}
float Tan(int val){
  return degrees(tan(val)); 
}
float Tan(Variable val){
  return degrees(tan(float(val.toString()))); 
}

float Asin(float val){
  return degrees(asin(val)); 
}
float Asin(int val){
  return degrees(asin(val)); 
}
float Asin(Variable val){
  return degrees(asin(float(val.toString()))); 
}

float Acos(float val){
  return degrees(acos(val)); 
}
float Acos(int val){
  return degrees(acos(val)); 
}
float Acos(Variable val){
  return degrees(acos(float(val.toString()))); 
}
float Atan(float val){
  return degrees(atan(val)); 
}
float Atan(int val){
  return degrees(atan(val)); 
}
float Atan(Variable val){
  return degrees(atan(float(val.toString()))); 
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

int Round(int dec){
  return round(dec);
}
int Round(float dec){
  return round(dec); 
}
int Round(Variable dec){
  return round(dec.toFloat());  
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

void ResetTimer() {
  lastreset = millis();
}

int Timer(){
  return timer; 
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
boolean MouseDown(int btn){
  if (mousePressed){
    if (btn == LEFTBTN){
      if (mouseButton == LEFT) return true;
      else return false; 
    }
    if (btn == RIGHTBTN){
      if (mouseButton == RIGHT) return true;
      else return false; 
    }
    if (btn == CENTERBTN){
      if (mouseButton == CENTER) return true;
      else return false; 
    }
    else return false;
  }
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
boolean KeyPressed(int keyc){
  if (keyPressed){
    if (keyCode == keyc) return true;
    else return false; 
  }
  else return false;
}


//SPRITE CLASS / MOST FUNCTIONS
class Sprite {
  boolean saying,thinking,hidden,draggable,pendown;
  String saystring;
  Variable response = new Variable("");
  int wids,heis,typ,costNo,ssize,cureffect,effectamt,penshade;
  float x,y;
  color pencolor;
  float penhue=0;
  float pensat=200;
  float penbri=200;
  int pensize = 1;
  int direction = 90;
  ArrayList costumes = new ArrayList();
  Sprite (int xx, int yy, int wid, int hei){
    x=xx;
    y=yy;
    wids=wid;
    heis=hei;
    typ=1;
    ssize=100;
  }
  Sprite (String im, int xx, int yy){
    x=xx;
    y=yy;
    costumes.add(new Costume(im));
    Costume cost = (Costume) costumes.get(0);
    wids=cost.wids;
    heis=cost.heis;
    costNo=0;
    typ=2;
    ssize=100;
  }
  
  void update(){
    if (!hidden){
      if (typ==1){
        fill(255);
        pushMatrix();
        translate(x,y);
        rotate(radians(direction-90));
        translate(-x,-y);
        //draw rectangle at given coordinates with set heis/wids
        rect(x,y,wids,heis);
        popMatrix();
      }
      else if (typ==2){
        Costume cost = (Costume) costumes.get(CostumeNumber());
        wids  = cost.img.width  + (wids  - cost.img.width);
        heis = cost.img.height + (heis - cost.img.height);
        pushMatrix();
        translate(x,y);
        rotate(radians(direction-90));
        translate(-x,-y);
//        println(cureffect);
//        if (cureffect == COLOR) tint(effectamt,effectamt,effectamt);
        image(cost.img,x,y,wids,heis);
//        if (cureffect != 0 && cureffect != COLOR && effectamt != 0) filter(cureffect,effectamt);
//        else if (cureffect != COLOR) filter(cureffect);
        popMatrix();
      }
      
      if (pendown){
        penarea.beginDraw();
        penarea.smooth();  
        penarea.translate(width/2,height/2);
        colorMode(HSB,200);
        // WORKDpenhue = (
        penarea.fill(color(penhue*200/360,pensat,penbri));
        penarea.stroke(color(penhue*200/360,pensat,penbri));
        penarea.ellipse(x,y,pensize,pensize);
        penarea.endDraw(); 
      }
      
      if (saying) {
        fill(255);
        stroke(#000000);
        rect(x + wids, (y - heis) + (heis/2), textWidth(saystring)+20, 35);
        fill(#000000);
        text(saystring, x + wids + 10, ((y - heis)+(heis/2))+(35/2+5));
      }
      else if (thinking) {
        fill(255);
        stroke(#000000);
        rect(x + wids, (y - heis) + (heis/2), textWidth(saystring)+20, 35);
        fill(#000000);
        text(saystring, x + wids + 10, ((y - heis)+(heis/2))+(35/2+5));
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
    delay(wait_time*1000); 
  }
  void Wait(Variable wait_time){
    delay(round(float(wait_time.toString())*1000)); 
  }
  
  boolean Clicked(){
    if (mousePressed && MouseX>x-wids/2 && MouseX<x+wids/2 && MouseY>y-wids/2 && MouseY<y+heis/2){
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
    return int(x);
  }
  
  int YPosition(){
    return int(y);
  }
  
  void GoTo(int xx,int yy){
    x=xx;
    y=yy;
  }
  void GoTo(float xx,float yy){
    x=xx;
    y=yy;
  }
  void GoTo(Variable xx,Variable yy){
    x=int(xx.toString());
    y=int(yy.toString());
  }
  void GoTo(int ms){
    if (ms == MOUSE){
      x=mouseX;
      y=mouseY;
    } 
  }
  void GoTo(Sprite spr){
    x=spr.x;
    y=spr.y;
  }
  
  //NEED SECONDS/REDO
  void GlideSecsTo(int secs, int xx,int yy){
    int amt = int(frameRate*50);
    float xspeed = (xx - x)/(secs*amt);
    float yspeed = (yy - y)/(secs*amt);
    //println(xspeed + "; " + yspeed);
    for (int i = 0; i<(secs*amt); i++){
      GoTo(x+xspeed,y+yspeed);
      update();
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
  
  void PointInDirection(int dir){
    direction = dir;
  }
  void PointInDirection(float dir){
    direction = int(dir);
  }
  void PointInDirection(Variable dir){
    direction = int(dir.toString());
  }
  
  void TurnCWDegrees(int amt){
    direction += amt; 
  }
  void TurnCWDegrees(float amt){
    direction += int(amt); 
  }
  void TurnCWDegrees(Variable amt){
    direction += int(amt.toString()); 
  }
  void TurnCCWDegrees(int amt){
    direction -= amt; 
  }
  void TurnCCWDegrees(float amt){
    direction -= int(amt); 
  }
  void TurnCCWDegrees(Variable amt){
    direction -= int(amt.toString()); 
  }
  
  int Direction(){
    return direction; 
  }
  
  void PointTowards(Sprite spr){  
    int deltax = spr.XPosition()-XPosition(); 
    int deltay = spr.YPosition()-YPosition();
    if (deltay == 0){
      if (deltax<0) PointInDirection(90);
      else PointInDirection(270);
    }
    else{
      if (deltay<0) PointInDirection((180-(degrees(atan(radians(deltax)/radians(deltay))))));
      else PointInDirection(-(degrees(atan(radians(deltax)/radians(deltay)))));
    }
  }
  
  void IfOnEdgeBounce(){
//i don't know
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
    wids =((val*cost.wids)/100);
    heis=((val*cost.heis)/100);
    ssize = val;
  }
  void SetSizeTo(Variable val){
    Costume cost = (Costume) costumes.get(CostumeNumber());
    wids =((int(val.toString())*cost.wids)/100);
    heis=((int(val.toString())*cost.heis)/100);
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
  
  // 1 - threshold, 2 - gray, 3 - invert, 4 - posterize
  // 5 - blur, 6 - erode, 7 - dilate, 8 - color
  
  void SetEffectTo(int effect){
    if (effect == THRESHOLD){
      cureffect = THRESHOLD;
    }
    if (effect == GRAY){
      cureffect = GRAY;
    }
    if (effect == INVERT){
      cureffect = INVERT;
    }
    if (effect == POSTERIZE){
      cureffect = POSTERIZE;
    }
    if (effect == BLUR){
      cureffect = BLUR;
    }
    if (effect == ERODE){
      cureffect = ERODE;
    }
    if (effect == DILATE){
      cureffect = DILATE;
    }
    if (effect == COLOR){
      cureffect = COLOR;
    }
    //else{ cureffect = 0; effectamt = 0; }
  }
  void SetEffectTo(int effect,int amt){
    effectamt = amt;
    if (effect == THRESHOLD){
      cureffect = THRESHOLD;
    }
    if (effect == GRAY){
      cureffect = GRAY;
    }
    if (effect == INVERT){
      cureffect = INVERT;
    }
    if (effect == POSTERIZE){
      cureffect = POSTERIZE;
    }
    if (effect == BLUR){
      cureffect = BLUR;
    }
    if (effect == ERODE){
      cureffect = ERODE;
    }
    if (effect == DILATE){
      cureffect = DILATE;
    }
    if (effect == COLOR){
      cureffect = COLOR;
    }
    else{ cureffect = 0; effectamt = 0; }
  }
  void SetEffectTo(int effect,float amt){
    effectamt = int(amt);
    if (effect == THRESHOLD){
      cureffect = THRESHOLD;
    }
    if (effect == GRAY){
      cureffect = GRAY;
    }
    if (effect == INVERT){
      cureffect = INVERT;
    }
    if (effect == POSTERIZE){
      cureffect = POSTERIZE;
    }
    if (effect == BLUR){
      cureffect = BLUR;
    }
    if (effect == ERODE){
      cureffect = ERODE;
    }
    if (effect == DILATE){
      cureffect = DILATE;
    }
    if (effect == COLOR){
      cureffect = COLOR;
    }
    else{ cureffect = 0; effectamt = 0; }
  }
  void SetEffectTo(int effect,Variable amt){
    effectamt = amt.toInt();
    if (effect == THRESHOLD){
      cureffect = THRESHOLD;
    }
    if (effect == GRAY){
      cureffect = GRAY;
    }
    if (effect == INVERT){
      cureffect = INVERT;
    }
    if (effect == POSTERIZE){
      cureffect = POSTERIZE;
    }
    if (effect == BLUR){
      cureffect = BLUR;
    }
    if (effect == ERODE){
      cureffect = ERODE;
    }
    if (effect == DILATE){
      cureffect = DILATE;
    }
    if (effect == COLOR){
      cureffect = COLOR;
    }
    else{ cureffect = 0; effectamt = 0; }
  }
  
  void ChangeEffectBy(int amt){
    effectamt+=amt; 
  }
  void ChangeEffectBy(float amt){
    effectamt+=int(amt); 
  }
  void ChangeEffectBy(Variable amt){
    effectamt+=amt.toInt(); 
  }

  void ClearGraphicEffect(){
    cureffect = 0;
    effectamt = 0; 
  }
  
  
  //---------------------------
  //------SENSING--------------
  //---------------------------
  
  boolean Touching(Sprite spr){
    if ((x-(wids/2)>=spr.x-(spr.wids/2) && y-(heis/2)>=spr.y-(spr.heis/2)) || (x+wids/2>=spr.x-(spr.wids/2) && y+heis/2>=spr.y-(spr.heis/2))){
      if (x-(wids/2)<=spr.x+(spr.wids/2) && y-(wids/2)<=spr.y+(spr.heis/2)){
        if ((x+wids/2)>=spr.x-spr.wids/2 && (y+heis/2)>=spr.y-spr.heis/2){
          return true; 
        }
        if ((x+wids/2<=spr.x+spr.wids/2) && (y+wids/2<=spr.y+spr.heis/2)){
          return true;
        }
        else return false;
      }
      else return false;
    }
    else return false;
  }
  boolean Touching(int val){ 
    if (val == MOUSE){
       if (MouseX>=x-wids/2 && MouseY>=y-heis/2 && MouseX<=x+wids/2 && MouseY<=y+heis/2){
         return true; 
       }
       else return false;
    }
    if (val == EDGE){
      if(x-wids/2<=-(width/2) || x+wids/2>=width/2 || y-heis/2<=-(height/2) || y+heis/2>=height/2){
        return true;
      }
      else return false;
    }
    if (val == TOPEDGE){
      if(y-heis/2<=-(height/2)){
        return true;
      }
      else return false;
    }
    if (val == BOTTOMEDGE){
      if(y+heis/2>=height/2){
        return true;
      }
      else return false;
    }
    if (val == LEFTEDGE){
      if(x-wids/2<=-(width/2)){
        return true;
      }
      else return false;
    }
    if (val == RIGHTEDGE){
      if(x+wids/2>=width/2){
        return true;
      }
      else return false;
    }
    else return false;
  }
  
  float Distance(Sprite spr){
    return dist(x,y,spr.x,spr.y);
  }
  
  int MouseX(){
    return MouseX; 
  }
  int MouseY(){
    return MouseY; 
  }
  
  // PEN FUNCTIONS pls
  void PenDown(){
    pendown = true; 
  }
  
  void PenUp(){
    pendown = false;
  }
  
  void SetPenSizeTo(int amt){
    pensize = amt;
  }
  void SetPenSizeTo(float amt){
    pensize = int(amt);
  }
  void SetPenSizeTo(Variable amt){
    pensize = amt.toInt();
  }
  
  void ChangePenSizeBy(int amt){
    pensize += amt;
  }
  void ChangePenSizeBy(float amt){
    pensize += int(amt);
  }
  void ChangePenSizeBy(Variable amt){
    pensize += amt.toInt();
  }
  
  void SetPenColorTo(int amt){
    penhue = amt;
  }
  void SetPenColorTo(float amt){
    penhue = amt;
  }
  void SetPenColorTo(Variable amt){
    penhue = amt.toFloat();
  }
  void ChangePenColorBy(int amt){
    penhue+=amt;
  }
  void ChangePenColorBy(float amt){
    penhue+=amt;
  }
  void ChangePenColorBy(Variable amt){
    penhue+=amt.toFloat();
  }  
  void SetPenColourTo(int amt){
    penhue = amt;
  }
  void SetPenColourTo(float amt){
    penhue = amt;
  }
  void SetPenColourTo(Variable amt){
    penhue = amt.toFloat();
  }
  void ChangePenColourBy(int amt){
    penhue+=amt;
  }
  void ChangePenColourBy(float amt){
    penhue+=amt;
  }
  void ChangePenColourBy(Variable amt){
    penhue+=amt.toFloat();
  }   
  

  class Costume{
    PImage img;
    int wids,heis;
    Costume (String cIm){
      img = loadImage(cIm);
      wids = img.width;
      heis = img.height;
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
  
  boolean equals(int eq){
    if (eq == int(value.toString())) return true;
    else return false;
  }
  boolean equals(float eq){
    if (eq == float(value.toString())) return true;
    else return false;
  }
  boolean equals(boolean eq){
    if (eq == boolean(value.toString())) return true;
    else return false;
  }
  boolean equals(String eq){
    if (eq.equals(value.toString())) return true;
    else return false;
  }
  boolean equals(Variable eq){
    if (eq.value.toString().equals(value.toString())) return true;
    else return false;
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
  void DeleteOf(float val){
    values.remove(int(val));
  }
  void DeleteOf(Variable val){
    values.remove(val.toInt());
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
    penarea = createGraphics(width,height,JAVA2D);
    backgrounds.add(new Background(im));
  }
  Stage(color clr){
    penarea = createGraphics(width,height,JAVA2D);
    backgrounds.add(new Background(clr)); 
  }
  
  void update(){
    translate(width/2,height/2);
    imageMode(CENTER);
    Background bck = (Background) backgrounds.get(BackgroundNumber());
    if (bck.img != null) background(bck.img);
    else background(bck.colour);
    MouseX=mouseX-(width/2);
    MouseY=mouseY-(height/2);
    timer = int((millis()/100f))-lastreset;
    penarea.beginDraw();
    penarea.endDraw();
    if (penarea != null) image(penarea,0,0);
    if (asking) {
      fill(255);
      stroke(#0494dc);
      rect((-width/2)+10,height/2-30,width-20,20);
      stroke(0);
      strokeWeight(3);
      strokeJoin(ROUND);
      fill(askcolour);
      text(askstring,(-width/2)+10,height/2-32);
      fill(0);
      text(response.toString(),(-width/2)+12,height/2-15);
    }
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

///////////////////////
///////////////////////
///////SOUND///////////
//related/functions/&//
//////classes//////////
///////////////////////
///////////////////////

ArrayList sounds = new ArrayList();
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

ArrayList mics = new ArrayList();
class Microphone{
  AudioInput mic;
  Microphone(){
    if (minim.getLineIn() != null){
      mic = minim.getLineIn();
      mics.add(this);
    }
  }
  int ln=-1;
  int Loudness(){
    if (mic != null){ ln++; if (ln==1024) ln=0; return int(map(abs(mic.mix.get(ln)),0,1,0,100)); }
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
  for (int i = 0; i<mics.size(); i++){
    Microphone fmic = (Microphone) mics.get(i);
    fmic.mic.close();
  }
  minim.stop();
  super.stop();
}

void keyTyped(){
  if (key == ENTER || key == RETURN){
    finalResponse = response.toString();
    asking = false; 
  }
  else if (key == BACKSPACE || key == DELETE){
    if (response.value.length()>=1){
      response.value.deleteCharAt(response.value.length()-1); 
    }
  }
  else if (response.value.length()<34 && key != SHIFT && key != CODED && key != ALT && key != CONTROL && key != ESC && key != TAB) response.value.append(key); 
}

void Ask(String val){
  if (!asking){
    response.value.delete(0,response.value.length());
    asking = true;
    askstring = val;
    askcolour = color(0,0,0);
  }
}
void Ask(Variable val){
  if (!asking){
    response.value.delete(0,response.value.length());
    asking = true;
    askstring = val.toString();
    askcolour = color(0,0,0);
  }
}
void Ask(String val, color clr){
  if (!asking){
    response.value.delete(0,response.value.length());
    asking = true;
    askstring = val;
    askcolour = clr;
  }
}
void Ask(Variable val, color clr){
  if (!asking){
    response.value.delete(0,response.value.length());
    asking = true;
    askstring = val.toString();
    askcolour = clr;
  }
}

String Answer(){
  return finalResponse; 
}
