//Simplicity
//in-development alpha
//5/29/2012
//code by veggieman
//with contributions from transparent
//and countless thanks to scratch wiki
//and the squeak code of scratch itself

//minim for sound
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

public Minim minim = new Minim(this);
private int MouseX,MouseY;
private boolean asking;
private color askcolour;
private String askstring,finalResponse;
private Variable response = new Variable("");
public final static float E = exp(1);
public final static int COLOR = 632;
public final static int EDGE = 226;
public final static int MOUSE = 227;
public final static int LEFTBTN = 520;
public final static int CENTERBTN = 521;
public final static int RIGHTBTN = 522;
public final static int TOPEDGE = 117;
public final static int BOTTOMEDGE = 118;
public final static int LEFTEDGE = 119;
public final static int RIGHTEDGE = 120;
private int lastreset;
private float timer,lasttimer;
private PGraphics penarea;

public void Stop(){
  noLoop();
}

public void Exit(){
  exit(); 
}

public float Sin(float val){
  return degrees(sin(val)); 
}
public float Sin(int val){
  return degrees(sin(val)); 
}
public float Sin(Variable val){
  return degrees(sin(float(val.toString()))); 
}

public float Cos(float val){
  return degrees(cos(val)); 
}
public float Cos(int val){
  return degrees(cos(val)); 
}
public float Cos(Variable val){
  return degrees(cos(float(val.toString()))); 
}

public float Tan(float val){
  return degrees(tan(val)); 
}
public float Tan(int val){
  return degrees(tan(val)); 
}
public float Tan(Variable val){
  return degrees(tan(float(val.toString()))); 
}

public float Asin(float val){
  return degrees(asin(val)); 
}
public float Asin(int val){
  return degrees(asin(val)); 
}
public float Asin(Variable val){
  return degrees(asin(float(val.toString()))); 
}

public float Acos(float val){
  return degrees(acos(val)); 
}
public float Acos(int val){
  return degrees(acos(val)); 
}
public float Acos(Variable val){
  return degrees(acos(float(val.toString()))); 
}

public float Atan(float val){
  return degrees(atan(val)); 
}
public float Atan(int val){
  return degrees(atan(val)); 
}
public float Atan(Variable val){
  return degrees(atan(float(val.toString()))); 
}

public float PickRandom(float low,float high){
  return random(low, high);
}
public int PickRandom(int low,int high){
  return int(random(low, high));
}
public float PickRandom(float low,int high){
  return random(low, high);
}
public float PickRandom(int low,float high){
  return random(low, high);
}
public float PickRandom(Variable low,Variable high){
  return random(float(low.value.toString()), float(high.value.toString()));
}
public float PickRandom(Variable low, int high){
  return random(float(low.value.toString()), high);
}
public float PickRandom(int low, Variable high){
  return random(low, float(high.value.toString()));
}
public float PickRandom(Variable low, float high){
  return random(float(low.value.toString()), high);
}
public float PickRandom(float low, Variable high){
  return random(low, float(high.value.toString()));
}

public int Round(int dec){
  return round(dec);
}
public int Round(float dec){
  return round(dec); 
}
public int Round(Variable dec){
  return round(dec.toFloat());  
}

public int LengthOf(int val){
  return str(val).length(); 
}
public int LengthOf(float val){
  return str(val).length(); 
}
public int LengthOf(String val){
  return val.length(); 
}
public int LengthOf(Variable val){
  return val.value.length(); 
}

public void ResetTimer() {
  lastreset = millis();
}

public float Timer(){
  return timer; 
}

public String Join(Variable vval,String sval){
  return vval.toString()+sval;
}
public String Join(String sval,Variable vval){
  return sval+vval.toString();
}
public String Join(Variable vval,Variable vval2){
  return vval.toString()+vval2.toString();
}
public String Join(String sval,String sval2){
  return sval+sval2;
}

public String LetterOf(int loc,String val){
  return str(val.charAt(loc));
}
public String LetterOf(int loc,Variable val){
  return str(val.value.charAt(loc));
}
public String LetterOf(Variable loc,String val){
  return str(val.charAt(loc.toInt()));
}
public String LetterOf(Variable loc,Variable val){
  return str(val.value.charAt(loc.toInt()));
}

public boolean MouseDown(){
  if (mousePressed) return true;
  else return false;
}
public boolean MouseDown(int btn){
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
public boolean KeyPressed(char lpkey){
  if(keyPressed){
    if (key == lpkey || key == str(lpkey).toUpperCase().charAt(0)){
      return true;
    }
    else return false;
  }
  else return false;
}
public boolean KeyPressed(int keyc){
  if (keyPressed){
    if (keyCode == keyc) return true;
    else return false; 
  }
  else return false;
}

//SPRITE CLASS / MOST FUNCTIONS
private ArrayList sprites = new ArrayList();
class Sprite {
  private boolean saying,thinking,hidden,draggable,pendown,waiting;
  private String saystring;
  private int wids,heis,typ,costNo,ssize,cureffect,penshade,layer;
  private float x,y,effectamt,waitamt,wx,wy,wd,wh,ww,wc;
  private color pencolor;
  private float penhue=0;
  private float pensat=360;
  private float penbri=360;
  private int pensize = 1;
  private int direction = 90;
  private ArrayList costumes = new ArrayList();
  Sprite (int xx, int yy, int wid, int hei){
    x=xx;
    y=yy;
    wids=wid;
    heis=hei;
    typ=1;
    ssize=100;
    sprites.add(this);
    layer=sprites.size()-1;
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
    sprites.add(this);
    layer=sprites.size()-1;
  }
  public void update(){
    if (!waiting){
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
        if (effectamt!=-87 && (cureffect != INVERT && cureffect != GRAY)) cost.img.filter(cureffect,effectamt);
        else if (cureffect != POSTERIZE && cureffect != ERODE && cureffect != DILATE) cost.img.filter(cureffect);
        image(cost.img,x,y,wids,heis);
        popMatrix();
        //image(cost.cmask,0,0);
      }
      if (pendown){
        penarea.beginDraw();
        penarea.smooth();  
        penarea.translate(width/2,height/2);
        colorMode(HSB,200);
        penhue = (penhue > 360) ? 0 : penhue;
        penbri = (penbri > 360) ? 0 : penbri;
        penarea.fill(color(penhue*200/360,pensat,penbri*200/360));
        penarea.stroke(color(penhue*200/360,pensat,penbri*200/360));
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
  else{
    if (typ==1){
        fill(255);
        pushMatrix();
        translate(wx,wy);
        rotate(radians(wd-90));
        translate(-wx,-wy);
        //draw rectangle at given coordinates with set heis/wids
        rect(wx,wy,ww,wh);
        popMatrix();
      }
      else if (typ==2){
        Costume cost = (Costume) costumes.get(int(wc));
        wids  = cost.img.width  + (int(ww)  - cost.img.width);
        heis = cost.img.height + (int(wh) - cost.img.height);
        pushMatrix();
        translate(wx,wy);
        rotate(radians(wd-90));
        translate(-wx,-wy);  
        if (effectamt!=-87 && (cureffect != INVERT && cureffect != GRAY)) cost.img.filter(cureffect,effectamt);
        else if (cureffect != POSTERIZE && cureffect != ERODE && cureffect != DILATE) cost.img.filter(cureffect);
        image(cost.img,wx,wy,ww,wh);
        popMatrix();
        //image(cost.cmask,0,0);
      }
    if (timer-lasttimer>waitamt){
      waiting = false; 
    }
  }
  }
  //BLOCKS
  
  //---------------------------
  //------CONTROL--------------
  //---------------------------
  
  public void Wait(float wait_time){
    lasttimer = timer;
    waitamt = wait_time;
    waiting = true;
    wx=x;wy=y;ww=wids;wh=heis;wd=direction;wc=CostumeNumber();
  }
  public void Wait(int wait_time){
    lasttimer = timer;
    waitamt = wait_time;
    waiting = true;
    wx=x;wy=y;ww=wids;wh=heis;wd=direction;wc=CostumeNumber();
  }
  public void Wait(Variable wait_time){
    lasttimer = timer; 
    waitamt = wait_time.toFloat();
    waiting = true;
    wx=x;wy=y;ww=wids;wh=heis;wd=direction;wc=CostumeNumber();
  }
  
  public boolean Clicked(){
    if (mousePressed && MouseX>x-wids/2 && MouseX<x+wids/2 && MouseY>y-wids/2 && MouseY<y+heis/2){
      return true; 
    }
    else return false;
  }
  
  public boolean Received(Broadcast b){
    if (b.sent){
      b.sent = false;
      return true;
    }
    else return false;
  }
  //---------------------------
  //------MOTION---------------
  //---------------------------
  
  public int XPosition(){
    return int(x);
  }
  
  public int YPosition(){
    return int(y);
  }
  
  public void GoTo(int xx,int yy){
    x=xx;
    y=yy;
  }
  public void GoTo(float xx,float yy){
    x=xx;
    y=yy;
  }
  public void GoTo(Variable xx,Variable yy){
    x=int(xx.toString());
    y=int(yy.toString());
  }
  public void GoTo(int ms){
    if (ms == MOUSE){
      x=mouseX;
      y=mouseY;
    } 
  }
  public void GoTo(Sprite spr){
    x=spr.x;
    y=spr.y;
  }
  
  //NEED SECONDS/REDO
  public void GlideSecsTo(int secs, int xx,int yy){
    int amt = int(frameRate*50);
    float xspeed = (xx - x)/(secs*amt);
    float yspeed = (yy - y)/(secs*amt);
    //println(xspeed + "; " + yspeed);
    for (int i = 0; i<(secs*amt); i++){
      GoTo(x+xspeed,y+yspeed);
      update();
    }
  }
  
  public void ChangeXBy(int amt){
    x+=amt;
  }
  public void ChangeXBy(Variable amt){
    x+=amt.toFloat();
  }
  public void ChangeXBy(float amt){
    x+=amt;
  }
  
  public void ChangeYBy(int amt){
    y-=amt;
  }
  public void ChangeYBy(Variable amt){
    y-=amt.toFloat();
  }
  public void ChangeYBy(float amt){
    y+=amt;
  }
  
  public void SetXTo(int amt){
    x=amt;
  }
  public void SetXTo(Variable amt){
    x=amt.toFloat();
  }
  public void SetXTo(float amt){
    x=amt;
  }
  
  public void SetYTo(int amt){
    y=amt;
  }
  public void SetYTo(Variable amt){
    y=int(amt.toString());
  }
  public void SetYTo(float amt){
    y=amt;
  }
  
  public void MoveSteps(int steps){
    for (int i=0; i<steps; i++){
      x+=5;
    }
  }
  public void MoveSteps(Variable steps){
    for (int i=0; i<int(steps.toString()); i++){
      x+=5;
    }
  }
  
  public void PointInDirection(int dir){
    direction = dir;
  }
  public void PointInDirection(float dir){
    direction = int(dir);
  }
  public void PointInDirection(Variable dir){
    direction = int(dir.toString());
  }
  
  public void TurnCWDegrees(int amt){
    direction += amt; 
  }
  public void TurnCWDegrees(float amt){
    direction += int(amt); 
  }
  public void TurnCWDegrees(Variable amt){
    direction += int(amt.toString()); 
  }
  public void TurnCCWDegrees(int amt){
    direction -= amt; 
  }
  public void TurnCCWDegrees(float amt){
    direction -= int(amt); 
  }
  public void TurnCCWDegrees(Variable amt){
    direction -= int(amt.toString()); 
  }
  
  public int Direction(){
    direction = direction%360;
    if (direction < 0) direction = 360+direction;
    return direction; 
  }
  
  public void PointTowards(Sprite spr){  
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
  
  //NEEDS WORK
//  public void IfOnEdgeBounce(){
//    if (Touching(EDGE)){
//      ChangeXBy(Sin(Direction())*(-1));
//      if (Touching(EDGE)) PointInDirection(180-Direction()); 
//      else PointInDirection(360-Direction());
//      ChangeXBy(Sin(Direction())*1);
//    } 
//  }
//  
  //---------------------------
  //------LOOKS----------------
  //---------------------------
  
  public void Say(String vsay){
    saying = true;
    saystring = vsay;
  }
  public void Say(Variable vsay){
    saying = true;
    saystring = vsay.toString();
  }
  
  public void Think(String vsay){
    thinking = true;
    saystring = vsay;
  }
  public void Think(Variable vsay){
    thinking = true;
    saystring = vsay.toString();
  }
  
  public void SwitchToCostume(int newCost){
    costNo = newCost; 
  }
  public void SwitchToCostume(float newCost){
    costNo = int(newCost); 
  }
  public void SwitchToCostume(Variable newCost){
    costNo = int(newCost.toString()); 
  }
  
  public void NextCostume(){
    if (CostumeNumber()+1>=costumes.size()) SwitchToCostume(0);
    else costNo++;
  }
  
  public void AddCostume(String im){
    costumes.add(new Costume(im)); 
  }
  
  public int CostumeNumber(){
    return costNo; 
  }
  
  public int Size(){  
    return ssize;
  }
  
  public void SetSizeTo(int val){
    Costume cost = (Costume) costumes.get(CostumeNumber());
    wids =((val*cost.wids)/100);
    heis=((val*cost.heis)/100);
    ssize = val;
  }
  public void SetSizeTo(Variable val){
    Costume cost = (Costume) costumes.get(CostumeNumber());
    wids =((int(val.toString())*cost.wids)/100);
    heis=((int(val.toString())*cost.heis)/100);
    ssize = int(val.toString());
  }
  
  public void ChangeSizeBy(int val){
    SetSizeTo(Size()+val);
  }
  public void ChangeSizeBy(Variable val){
    SetSizeTo(Size()+int(val.toString()));
  }
  
  public void Show(){
    hidden = false; 
  }
  
  public void Hide(){
    hidden = true; 
  }
  
  //NEED FIXING;; BLUR, INVERT, others?
  //ADD COLOR, etc. FROM SCRATCH
  public void SetEffectTo(int effect){
    effectamt = -87;
    cureffect = effect;
  }
  public void SetEffectTo(int effect,int amt){
    effectamt = amt;
    cureffect = effect;
  }
  public void SetEffectTo(int effect,float amt){
    effectamt = amt;
    cureffect = effect;
  }
  public void SetEffectTo(int effect,Variable amt){
    effectamt = amt.toFloat();
    cureffect = effect;
  }
  
  public void ChangeEffectBy(int amt){
    if (effectamt != -87) effectamt += amt;
    if (effectamt<2 && cureffect == THRESHOLD) effectamt = 2;
  }
  
  public void GoToFront(){
    sprites.remove(layer);
    sprites.add(this);
    layer = sprites.size()-1;
  }
  
  public void GoBackLayers(int amt){
    sprites.remove(layer);
    layer = constrain(layer-amt,0,sprites.size()-1);
    sprites.add(layer,this);
  }
  public void GoBackLayers(Variable amt){
    sprites.remove(layer);
    layer = constrain(layer-amt.toInt(),0,sprites.size()-1);
    sprites.add(layer,this);
  }
  
  public void SetLayerTo(int amt){
    sprites.remove(layer);
    layer = constrain(amt,0,sprites.size()-1);
    sprites.add(layer,this);
  }
  public void SetLayerTo(Variable amt){
    sprites.remove(layer);
    layer = constrain(amt.toInt(),0,sprites.size()-1);
    sprites.add(layer,this);
  }
  
  public int Layer(){
    return layer; 
  }
  
  //---------------------------
  //------SENSING--------------
  //---------------------------
  
  public boolean Touching(Sprite spr){
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
  public boolean Touching(int val){ 
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
  
  public float Distance(Sprite spr){
    return dist(x,y,spr.x,spr.y);
  }
  
  public int MouseX(){
    return MouseX; 
  }
  public int MouseY(){
    return MouseY; 
  }
  
  // PEN FUNCTIONS pls
  public void PenDown(){
    pendown = true; 
  }
  
  public void PenUp(){
    pendown = false;
  }
  
  public void SetPenSizeTo(int amt){
    pensize = amt;
  }
  public void SetPenSizeTo(float amt){
    pensize = int(amt);
  }
  public void SetPenSizeTo(Variable amt){
    pensize = amt.toInt();
  }
  
  public void ChangePenSizeBy(int amt){
    pensize += amt;
  }
  public void ChangePenSizeBy(float amt){
    pensize += int(amt);
  }
  public void ChangePenSizeBy(Variable amt){
    pensize += amt.toInt();
  }
  
  public void SetPenColorTo(int amt){
    penhue = amt;
  }
  public void SetPenColorTo(float amt){
    penhue = amt;
  }
  public void SetPenColorTo(Variable amt){
    penhue = amt.toFloat();
  }
  public void ChangePenColorBy(int amt){
    penhue+=amt;
  }
  public void ChangePenColorBy(float amt){
    penhue+=amt;
  }
  public void ChangePenColorBy(Variable amt){
    penhue+=amt.toFloat();
  }  
  public void SetPenColourTo(int amt){
    penhue = amt;
  }
  public void SetPenColourTo(float amt){
    penhue = amt;
  }
  public void SetPenColourTo(Variable amt){
    penhue = amt.toFloat();
  }
  public void ChangePenColourBy(int amt){
    penhue+=amt;
  }
  public void ChangePenColourBy(float amt){
    penhue+=amt;
  }
  public void ChangePenColourBy(Variable amt){
    penhue+=amt.toFloat();
  }
  
  public void SetPenShadeTo(int amt){
    penbri = amt;
  }
  public void SetPenShadeTo(float amt){
    penbri = amt;
  }
  public void SetPenShadeTo(Variable amt){
    penbri = amt.toFloat();
  }
  public void ChangePenShadeBy(int amt){
    penbri-=amt;
  }
  public void ChangePenShadeBy(float amt){
    penbri-=amt;
  }
  public void ChangePenShadeBy(Variable amt){
    penbri-=amt.toFloat();
  }
  
  public void Stamp(){
    Costume cost = (Costume) costumes.get(CostumeNumber());
    penarea.beginDraw();
    penarea.pushMatrix();
    penarea.imageMode(CENTER);
    penarea.translate(width/2,height/2);
    penarea.image(cost.img,int(x),int(y));
    penarea.popMatrix();
    penarea.endDraw();
  }

  private class Costume{
    public PImage img,cmask;
    public int wids,heis;
    Costume (String cIm){
      img = loadImage(cIm);
      wids = img.width;
      heis = img.height;
      cmask = createImage(img.width,img.height,RGB);
      cmask.loadPixels();img.loadPixels();
      for (int i = 0; i < img.pixels.length; i++){
        if (img.pixels[i] == 60896) cmask.pixels[i] = color(#FFFFFF);
        else cmask.pixels[i] = color(#000000);
      }
    }
  }
}

public class Broadcast {
  private boolean sent = false;
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

public class Variable{
  public StringBuffer value;
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
  
  public int toInt(){
    return int(value.toString());
  }
  public float toFloat(){
    return float(value.toString()); 
  }
  public boolean toBoolean(){
    if (value.toString() == "1" || value.toString() == "true" || value.toString() == "True" || value.toString() == "TRUE"){
      return true;
    }
    else return false;
  }
  public String toString(){
    return value.toString();
  }
  
  public boolean equals(int eq){
    if (eq == int(value.toString())) return true;
    else return false;
  }
  public boolean equals(float eq){
    if (eq == float(value.toString())) return true;
    else return false;
  }
  public boolean equals(boolean eq){
    if (eq == boolean(value.toString())) return true;
    else return false;
  }
  public boolean equals(String eq){
    if (eq.equals(value.toString())) return true;
    else return false;
  }
  public boolean equals(Variable eq){
    if (eq.value.toString().equals(value.toString())) return true;
    else return false;
  }
}

public class List{
  public ArrayList values;
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
  public void AddTo(int val){
    Variable tvar = new Variable(val);
    values.add(tvar);
  }
  public void AddTo(float val){
    Variable tvar = new Variable(val);
    values.add(tvar);
  }
  public void AddTo(String val){
    Variable tvar = new Variable(val);
    values.add(tvar);
  }
  public void AddTo(Variable val){
    values.add(val);
  }
  
  public void DeleteOf(int val){
    values.remove(val);
  }
  public void DeleteOf(float val){
    values.remove(int(val));
  }
  public void DeleteOf(Variable val){
    values.remove(val.toInt());
  }
  
  public void InsertAt(int val,int loc){
    Variable tvar = new Variable(val);
    values.add(loc,tvar);
  }
  public void InsertAt(float val,int loc){
    Variable tvar = new Variable(val);
    values.add(loc,tvar);
  }
  public void InsertAt(String val,int loc){
    Variable tvar = new Variable(val);
    values.add(loc,tvar);
  }
  public void InsertAt(Variable val,int loc){
    values.add(loc,val);
  }
  
  public void ReplaceWith(int loc, int val){
    Variable tvar = new Variable(val);
    values.remove(loc);
    values.add(loc,tvar);
  }
  public void ReplaceWith(int loc, float val){
    Variable tvar = new Variable(val);
    values.remove(loc);
    values.add(loc,tvar);
  }
  public void ReplaceWith(int loc, String val){
    Variable tvar = new Variable(val);
    values.remove(loc);
    values.add(loc,tvar);
  }
  public void ReplaceWith(int loc, Variable val){
    values.remove(loc);
    values.add(loc,val);
  }
  
  public Variable Item(int loc){
    return (Variable) values.get(loc); 
  }
  
  public int Length(){
    return values.size(); 
  }
  
  public boolean Contains(String val){
    for (int i=0; i<values.size(); i++){
      Variable tvar = (Variable) values.get(i);
      if (tvar.value.toString().equals(val)){
        return true;
      }
    }
    return false;
  }
  public boolean Contains(int val){
    for (int i=0; i<values.size(); i++){
      Variable tvar = (Variable) values.get(i);
      if (int(tvar.value.toString()) == val){
        return true;
      }
    }
    return false;
  }
  public boolean Contains(float val){
    for (int i=0; i<values.size(); i++){
      Variable tvar = (Variable) values.get(i);
      if (float(tvar.value.toString()) == val){
        return true;
      }
    }
    return false;
  }
  public boolean Contains(Variable val){
    for (int i=0; i<values.size(); i++){
      Variable tvar = (Variable) values.get(i);
      if ((Variable) values.get(i) == val){
        return true;
      }
    }
    return false;
  }
  
  public String strCast(){
    StringBuffer vals = new StringBuffer();
    boolean space = false;
    if (values == null) return "";
    else{
      for (int i = 0; i<values.size(); i++){
        Variable tvar = (Variable) values.get(i);
        for (int j = 0; j<LengthOf(tvar); j++){
          if (LetterOf(j,tvar.toString()).charAt(0) == ' '){ space = true;  break; }
        }
      }
      if (space){
        for (int i = 0; i<values.size(); i++){
          Variable tvar = (Variable) values.get(i);
          vals.append(tvar.toString()+" ");
        }
      }
      else {
        for (int i = 0; i<values.size(); i++){
          Variable tvar = (Variable) values.get(i);
          vals.append(tvar.toString());
        }
      }
    } 
    return vals.toString();
  }
  
  public float numCast(){
    StringBuffer vals = new StringBuffer();
    if (values == null) return 0;
    else{
      for (int i = 0; i<values.size(); i++){
        Variable tvar = (Variable) values.get(i);
        vals.append(tvar.toString());
      }
    }
    return float(vals.toString());
  }
}

private ArrayList stages = new ArrayList();
public class Stage{
  public ArrayList backgrounds = new ArrayList();
  int bckNo;
  
  Stage(){
    penarea = createGraphics(width,height,JAVA2D);
    backgrounds.add(new Background(#FFFFFF)); 
    stages.add(this);
  }
  Stage(String im){
    penarea = createGraphics(width,height,JAVA2D);
    backgrounds.add(new Background(im));
    stages.add(this);
  }
  Stage(color clr){
    penarea = createGraphics(width,height,JAVA2D);
    backgrounds.add(new Background(clr)); 
    stages.add(this);
  }
  
  public void update(){
    translate(width/2,height/2);
    imageMode(CENTER);
    Background bck = (Background) backgrounds.get(BackgroundNumber());
    if (bck.img != null && bck.img.width == WIDTH && bck.img.height == HEIGHT) background(bck.img);
    else background(bck.colour);
    MouseX=mouseX-(width/2);
    MouseY=mouseY-(height/2);
    timer = (millis()/100f)-lastreset;
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
  
  public class Background{
    public PImage img;
    public color colour;
    public int w,h;
    Background (String im){
      img = loadImage(im);
      colour = color(#FFFFFF);
      w = width;
      h = height;
      img.resize(w,h);
    }
    Background (color clr){
      colour = clr;
      w = width;
      h = height;
    }
  }
  
  public void NextBackground(){
    if (BackgroundNumber()+1>=backgrounds.size()) SwitchToBackground(0);
    else bckNo++;
  }
  
  public void SwitchToBackground(int newbck){
    bckNo = newbck;
  }
  public void SwitchToBackground(float newbck){
    bckNo = int(newbck);
  }
  public void SwitchToBackground(String newbck){
    bckNo = int(newbck);
  }
  public void SwitchToBackground(Variable newbck){
    bckNo = int(newbck.value.toString());
  }
  
  public void AddBackground(String im){
    backgrounds.add(new Background(im)); 
  }
  public void AddBackground(color clr){
    backgrounds.add(new Background(clr));
  }
  
  public int BackgroundNumber(){
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

private ArrayList sounds = new ArrayList();
public class Sound{
  private AudioPlayer player;
  Sound(String sndlnk){
    player = minim.loadFile(sndlnk);
    sounds.add(this);
  }
  Sound(Variable sndlnk){
    player = minim.loadFile(sndlnk.toString());
    sounds.add(this);
  }
  
  public float Volume(){
    return player.getGain();
  }
  
  public void SetVolumeTo(int val){
    player.setGain(val);
  }
  public void SetVolumeTo(float val){
    player.setGain(val);
  }
  public void SetVolumeTo(Variable val){
    player.setGain(float(val.value.toString()));
  }
  
  public void ChangeVolumeBy(int val){
    SetVolumeTo(Volume()+val);
  }
  public void ChangeVolumeBy(float val){
    SetVolumeTo(Volume()+val);
  }
  public void ChangeVolumeBy(Variable val){
    SetVolumeTo(Volume()+float(val.value.toString()));
  }
  
  public void Play(){
    if (!player.isPlaying()){
      player.rewind(); 
      player.play();
    }
  }
  
  public void Pause(){
    player.pause(); 
  }
  
  public void Stop(){
    player.rewind();
    player.pause();
  }
}

public void StopAllSounds(){
  for (int i = 0; i<sounds.size(); i++){
    Sound fsnd = (Sound) sounds.get(i);
    if (fsnd.player.isPlaying()){
      fsnd.Stop(); 
    }
  }
}

private ArrayList mics = new ArrayList();
public class Microphone{
  AudioInput mic;
  Microphone(){
    if (minim.getLineIn() != null){
      mic = minim.getLineIn();
      mics.add(this);
    }
  }
  private int ln=-1;
  public int Loudness(){
    if (mic != null){ ln++; if (ln==1024) ln=0; return int(map(abs(mic.mix.get(ln)),0,1,0,100)); }
    else return 0;
  }
  public boolean Loud(){
    if (Loudness()>30) return true;
    else return false;
  }
}

public void SoundCleanse(){
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

public void keyTyped(){
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

public void Ask(String val){
  if (!asking){
    response.value.delete(0,response.value.length());
    asking = true;
    askstring = val;
    askcolour = color(0,0,0);
  }
}
public void Ask(Variable val){
  if (!asking){
    response.value.delete(0,response.value.length());
    asking = true;
    askstring = val.toString();
    askcolour = color(0,0,0);
  }
}
public void Ask(String val, color clr){
  if (!asking){
    response.value.delete(0,response.value.length());
    asking = true;
    askstring = val;
    askcolour = clr;
  }
}
public void Ask(Variable val, color clr){
  if (!asking){
    response.value.delete(0,response.value.length());
    asking = true;
    askstring = val.toString();
    askcolour = clr;
  }
}

public String Answer(){
  return finalResponse; 
}

public void Clear(){
  penarea = createGraphics(width,height,JAVA2D); 
}

public void Update(){
  Stage stage = (Stage) stages.get(0);
  stage.update();
  for (int i = 0; i < sprites.size(); i++){
    Sprite temp = (Sprite) sprites.get(i);
    temp.update(); 
  }
}
private int penimgs = 0;
public void PenScreenshot(){
  String folderpath = selectFolder("Choose a folder to save to..."); 
  if (penarea != null && folderpath != null) penarea.save(folderpath+"\\pen"+penimgs+".png");
}
private int scimgs = 0;
public void Screenshot(){
  String folderpath = selectFolder("Choose a folder to save to..."); 
  if (penarea != null && folderpath != null) save(folderpath+"\\screen"+scimgs+".png");
}
