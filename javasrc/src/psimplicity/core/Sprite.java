/**
 * ##library.name##
 * ##library.sentence##
 * ##library.url##
 *
 * Copyright ##copyright## ##author##
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place, Suite 330,
 * Boston, MA  02111-1307  USA
 * 
 * @author      ##author##
 * @modified    ##date##
 * @version     ##library.prettyVersion## (##library.version##)
 */

package psimplicity.core;


import java.util.ArrayList;
import processing.core.*;

/**
 * This is a template class and can be used to start a new processing library or tool.
 * Make sure you rename this class as well as the name of the example package 'template' 
 * to your own library or tool naming convention.
 * 
 * @example Hello 
 * 
 * (the tag @example followed by the name of an example included in folder 'examples' will
 * automatically include the example in the javadoc.)
 *
 */

public class Sprite {
	//SPRITE CLASS / MOST FUNCTIONS
	static PApplet parent;
	  private boolean saying,thinking,hidden,draggable,pendown,waiting;
	  private String saystring;
	  private int wids,heis,typ,costNo,ssize,cureffect,penshade,layer;
	  private float x,y,effectamt,waitamt,wx,wy,wd,wh,ww,wc;
	  private int pencolor;
	  private float penhue=0;
	  private float pensat=360;
	  private float penbri=360;
	  private int pensize = 1;
	  private int direction = 90;
	  private ArrayList<Costume> costumes = new ArrayList<Costume>();
	  public Sprite (){
		    x=0;
		    y=0;
		    costNo=0;
		    typ=2;
		    ssize=100;
		    Project.sprites.add(this);
		    layer=Project.sprites.size()-1;
		    parent = Project.parent;
		    //parent.println("test");
		    costumes.add(new Costume("http://www.majhost.com/gallery/veggieman/scans/frog.png"));
		    Costume cost = (Costume) costumes.get(0);
		    wids=cost.wids;
		    heis=cost.heis;
	  }
	  public Sprite (int xx, int yy, int wid, int hei){
	    x=xx;
	    y=yy;
	    wids=wid;
	    heis=hei;
	    typ=1;
	    ssize=100;
	    Project.sprites.add(this);
	    layer=Project.sprites.size()-1;
	    parent = Project.parent;
	    //parent.println("test");
	  }
	  public Sprite (String im, int xx, int yy){
	    x=xx;
	    y=yy;
	    costNo=0;
	    typ=2;
	    ssize=100;
	    Project.sprites.add(this);
	    layer=Project.sprites.size()-1;
	    parent = Project.parent;
	    //parent.println("test");
	    costumes.add(new Costume(im));
	    Costume cost = (Costume) costumes.get(0);
	    wids=cost.wids;
	    heis=cost.heis;
	  }
	  public void update(){
	    if (!waiting){
	    if (!hidden){
	      if (typ==1){
	        parent.fill(255);
	        parent.pushMatrix();
	        parent.translate(x,y);
	        parent.rotate(parent.radians(direction-90));
	        parent.translate(-x,-y);
	        //draw rectangle at given coordinates with set heis/wids
	        parent.rect(x,y,wids,heis);
	        parent.popMatrix();
	      }
	      else if (typ==2){
	        Costume cost = (Costume) costumes.get(CostumeNumber());
	        wids  = cost.img.width  + (wids  - cost.img.width);
	        heis = cost.img.height + (heis - cost.img.height);
	        parent.pushMatrix();
	        parent.translate(x,y);
	        parent.rotate(parent.radians(direction-90));
	        parent.translate(-x,-y);  
	        if (effectamt!=-87 && (cureffect != parent.INVERT && cureffect != parent.GRAY)) cost.img.filter(cureffect,effectamt);
	        else if (cureffect != parent.POSTERIZE && cureffect != parent.ERODE && cureffect != parent.DILATE) cost.img.filter(cureffect);
	        parent.image(cost.img,x,y,wids,heis);
	        parent.popMatrix();
	        //image(cost.cmask,0,0);
	      }
	      if (pendown){
	    	Project.penarea.beginDraw();
	    	Project.penarea.smooth();  
	        Project.penarea.translate(parent.width/2,parent.height/2);
	        parent.colorMode(parent.HSB,200);
	        penhue = (penhue > 360) ? 0 : penhue;
	        penbri = (penbri > 360) ? 0 : penbri;
	        Project.penarea.fill(parent.color(penhue*200/360,pensat,penbri*200/360));
	        Project.penarea.stroke(parent.color(penhue*200/360,pensat,penbri*200/360));
	        Project.penarea.ellipse(x,y,pensize,pensize);
	        Project.penarea.endDraw(); 
	      }      
	      if (saying) {
	    	  parent.fill(255);
	    	  parent.stroke(0x000000);
	    	parent.rect(x + wids, (y - heis) + (heis/2), parent.textWidth(saystring)+20, 35);
	    	parent.fill(0x000000);
	    	parent.text(saystring, x + wids + 10, ((y - heis)+(heis/2))+(35/2+5));
	      }
	      else if (thinking) {
	    	  parent.fill(255);
	    	  parent.stroke(0x000000);
	    	  parent.rect(x + wids, (y - heis) + (heis/2), parent.textWidth(saystring)+20, 35);
	        parent.fill(0x000000);
	        parent.text(saystring, x + wids + 10, ((y - heis)+(heis/2))+(35/2+5));
	      }
	    }
	  }
	  else{
	    if (typ==1){
	        parent.fill(255);
	        parent.pushMatrix();
	        parent.translate(wx,wy);
	        parent.rotate(parent.radians(wd-90));
	        parent.translate(-wx,-wy);
	        //draw rectangle at given coordinates with set heis/wids
	        parent.rect(wx,wy,ww,wh);
	        parent.popMatrix();
	      }
	      else if (typ==2){
	        Costume cost = (Costume) costumes.get((int) wc);
	        wids  = cost.img.width  + ((int) ww  - cost.img.width);
	        heis = cost.img.height + ((int) wh - cost.img.height);
	        parent.pushMatrix();
	        parent.translate(wx,wy);
	        parent.rotate(parent.radians(wd-90));
	        parent.translate(-wx,-wy);  
	        if (effectamt!=-87 && (cureffect != parent.INVERT && cureffect != parent.GRAY)) cost.img.filter(cureffect,effectamt);
	        else if (cureffect != parent.POSTERIZE && cureffect != parent.ERODE && cureffect != parent.DILATE) cost.img.filter(cureffect);
	        parent.image(cost.img,wx,wy,ww,wh);
	        parent.popMatrix();
	        //image(cost.cmask,0,0);
	      }
	    if (Project.timer-Project.lasttimer>waitamt){
	      waiting = false; 
	    }
	  }
	  }
	  //BLOCKS
	  
	  //---------------------------
	  //------CONTROL--------------
	  //---------------------------
	  
	  public void Wait(float wait_time){
	    Project.lasttimer = Project.timer;
	    waitamt = wait_time;
	    waiting = true;
	    wx=x;wy=y;ww=wids;wh=heis;wd=direction;wc=CostumeNumber();
	  }
	  public void Wait(int wait_time){
	    Project.lasttimer = Project.timer;
	    waitamt = wait_time;
	    waiting = true;
	    wx=x;wy=y;ww=wids;wh=heis;wd=direction;wc=CostumeNumber();
	  }
	  public void Wait(Variable wait_time){
	    Project.lasttimer = Project.timer; 
	    waitamt = wait_time.toFloat();
	    waiting = true;
	    wx=x;wy=y;ww=wids;wh=heis;wd=direction;wc=CostumeNumber();
	  }
	  
	  public boolean Clicked(){
	    if (parent.mousePressed && Project.MouseX>x-wids/2 && Project.MouseX<x+wids/2 && Project.MouseY>y-wids/2 && Project.MouseY<y+heis/2){
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
	    return (int) x;
	  }
	  
	  public int YPosition(){
	    return (int) y;
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
	    x=Integer.parseInt(xx.toString());
	    y=Integer.parseInt(yy.toString());
	  }
	  public void GoTo(int ms){
	    if (ms == Project.MOUSE){
	      x=parent.mouseX;
	      y=parent.mouseY;
	    } 
	  }
	  public void GoTo(Sprite spr){
	    x=spr.x;
	    y=spr.y;
	  }
	  
	  //NEED SECONDS/REDO
	  public void GlideSecsTo(int secs, int xx,int yy){
	    int amt = (int) parent.frameRate*50;
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
	    y=Integer.parseInt(amt.toString());
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
	    for (int i=0; i<Integer.parseInt(steps.toString()); i++){
	      x+=5;
	    }
	  }
	  
	  public void PointInDirection(int dir){
	    direction = dir;
	  }
	  public void PointInDirection(float dir){
	    direction = (int) dir;
	  }
	  public void PointInDirection(Variable dir){
	    direction = Integer.parseInt(dir.toString());
	  }
	  
	  public void TurnCWDegrees(int amt){
	    direction += amt; 
	  }
	  public void TurnCWDegrees(float amt){
	    direction += (int) amt; 
	  }
	  public void TurnCWDegrees(Variable amt){
	    direction += Integer.parseInt(amt.toString()); 
	  }
	  public void TurnCCWDegrees(int amt){
	    direction -= amt; 
	  }
	  public void TurnCCWDegrees(float amt){
	    direction -= (int) amt; 
	  }
	  public void TurnCCWDegrees(Variable amt){
	    direction -= Integer.parseInt(amt.toString()); 
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
	      if (deltay<0) PointInDirection((180-(parent.degrees(parent.atan(parent.radians(deltax)/parent.radians(deltay))))));
	      else PointInDirection(-(parent.degrees(parent.atan(parent.radians(deltax)/parent.radians(deltay)))));
	    }
	  }
	  
	  //NEEDS WORK
	//  public void IfOnEdgeBounce(){
//	    if (Touching(EDGE)){
//	      ChangeXBy(Sin(Direction())*(-1));
//	      if (Touching(EDGE)) PointInDirection(180-Direction()); 
//	      else PointInDirection(360-Direction());
//	      ChangeXBy(Sin(Direction())*1);
//	    } 
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
	    costNo = (int) newCost; 
	  }
	  public void SwitchToCostume(Variable newCost){
	    costNo = Integer.parseInt(newCost.toString()); 
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
	    wids =(Integer.parseInt(val.toString())*cost.wids)/100;
	    heis=(Integer.parseInt(val.toString())*cost.heis)/100;
	    ssize = Integer.parseInt(val.toString());
	  }
	  
	  public void ChangeSizeBy(int val){
	    SetSizeTo(Size()+val);
	  }
	  public void ChangeSizeBy(Variable val){
	    SetSizeTo(Size()+Integer.parseInt(val.toString()));
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
	    if (effectamt<2 && cureffect == parent.THRESHOLD) effectamt = 2;
	  }
	  
	  public void GoToFront(){
	    Project.sprites.remove(layer);
	    Project.sprites.add(this);
	    layer = Project.sprites.size()-1;
	  }
	  
	  public void GoBackLayers(int amt){
		  Project.sprites.remove(layer);
	    layer = parent.constrain(layer-amt,0,Project.sprites.size()-1);
	    Project.sprites.add(layer,this);
	  }
	  public void GoBackLayers(Variable amt){
		  Project.sprites.remove(layer);
	    layer = parent.constrain(layer-amt.toInt(),0,Project.sprites.size()-1);
	    Project.sprites.add(layer,this);
	  }
	  
	  public void SetLayerTo(int amt){
		  Project.sprites.remove(layer);
	    layer = parent.constrain(amt,0,Project.sprites.size()-1);
	    Project.sprites.add(layer,this);
	  }
	  public void SetLayerTo(Variable amt){
		  Project.sprites.remove(layer);
	    layer = parent.constrain(amt.toInt(),0,Project.sprites.size()-1);
	    Project.sprites.add(layer,this);
	  }
	  
	  public int Layer(){
	    return layer; 
	  }
	  
	  //---------------------------
	  //------SENSING--------------
	  //---------------------------
	  
	  public boolean Touching( Sprite spr /*PImage img1, PImage img2, PVector pos1, PVector pos2, int nAlphaThreshold*/ ) {
	      // Find image indices of overlap between two image rectangles.
	      // Indices are zero-based, from top-left corners:      
	      int ixLow1,  ixLow2; 
	      int iyLow1,  iyLow2; 
	      int ixHigh1, ixHigh2; 
	      int iyHigh1, iyHigh2;           
	      if ( x <= spr.x ) { ixLow1 = parent.round( spr.x - x ); ixLow2 = 0;                        }
	      else                    { ixLow1 = 0;                        ixLow2 = parent.round( x - spr.x ); }      
	      if ( x + wids - 1 >= spr.x ) ixHigh1 = parent.round( parent.min( wids - 1, spr.x + spr.wids - 1 - x ) );
	      else                                     ixHigh1 = parent.round( spr.x - (x + wids) ); 
	      if ( y <= spr.y ) { iyLow1 = parent.round( spr.y - y ); iyLow2 = 0;                        }
	      else                    { iyLow1 = 0;                        iyLow2 = parent.round( y - spr.y ); }      
	      if ( y + heis - 1 >= spr.y ) iyHigh1 = parent.round( parent.min( heis - 1, spr.y + spr.heis - 1 - y ) );
	      else                                      iyHigh1 = parent.round( spr.y - (y + heis) );  
	      // If there is any overlap between images:
	      if (   ixHigh1 - ixLow1 > 0
	          && iyHigh1 - iyLow1 > 0 ) {
	          
	          int ix2, iy2;
	          
	          iy2 = iyLow2 - 1;
	          for ( int iy1 = iyLow1; iy1 <= iyHigh1; iy1++ ){
	              
	              iy2++;
	                  
	              ix2 = ixLow2 - 1;
	              for ( int ix1 = ixLow1; ix1 <= ixHigh1; ix1++ ){
	                  
	                  ix2++;
	                  
	                  // If either alpha channel ( (hex >> 24) & 0xFF) of an overlapping pixel is larger than some low threshold:
	                  Costume cost1 = (Costume) costumes.get(CostumeNumber());
	                  Costume cost2 = (Costume) spr.costumes.get(spr.CostumeNumber());
	                  cost1.img.loadPixels();
	                  cost2.img.loadPixels();
	                  if (   ( ( cost1.img.pixels[ ix1 + wids * iy1 ] >> 24 ) & 0xFF ) > 0 && ( ( cost2.img.pixels[ ix2 + spr.wids * iy2 ] >> 24 ) & 0xFF ) > 0 ) {
	                      return true;
	                  }
	              }
	          }
	      }
	      
	      return false;  
	  }
	  public boolean Touching(int val){ 
	    if (val == Project.MOUSE){
	       if (Project.MouseX>=x-wids/2 && Project.MouseY>=y-heis/2 && Project.MouseX<=x+wids/2 && Project.MouseY<=y+heis/2){
	         return true; 
	       }
	       else return false;
	    }
	    if (val == Project.EDGE){
	      if(x-wids/2<=-(parent.width/2) || x+wids/2>=parent.width/2 || y-heis/2<=-(parent.height/2) || y+heis/2>=parent.height/2){
	        return true;
	      }
	      else return false;
	    }
	    if (val == Project.TOPEDGE){
	      if(y-heis/2<=-(parent.height/2)){
	        return true;
	      }
	      else return false;
	    }
	    if (val == Project.BOTTOMEDGE){
	      if(y+heis/2>=parent.height/2){
	        return true;
	      }
	      else return false;
	    }
	    if (val == Project.LEFTEDGE){
	      if(x-wids/2<=-(parent.width/2)){
	        return true;
	      }
	      else return false;
	    }
	    if (val == Project.RIGHTEDGE){
	      if(x+wids/2>=parent.width/2){
	        return true;
	      }
	      else return false;
	    }
	    else return false;
	  }
	  
	  public float Distance(Sprite spr){
	    return parent.dist(x,y,spr.x,spr.y);
	  }
	  
	  public int MouseX(){
	    return Project.MouseX; 
	  }
	  public int MouseY(){
	    return Project.MouseY; 
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
	    pensize = (int) amt;
	  }
	  public void SetPenSizeTo(Variable amt){
	    pensize = amt.toInt();
	  }
	  
	  public void ChangePenSizeBy(int amt){
	    pensize += amt;
	  }
	  public void ChangePenSizeBy(float amt){
	    pensize += (int) amt;
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
	    Project.penarea.beginDraw();
	    Project.penarea.pushMatrix();
	    Project.penarea.imageMode(parent.CENTER);
	    Project.penarea.translate(parent.width/2,parent.height/2);
	    Project.penarea.image(cost.img,(int) x,(int) y);
	    Project.penarea.popMatrix();
	    Project.penarea.endDraw();
	  }

	  private class Costume{
		public PImage img,cmask;
	    public int wids,heis;
	    Costume (String cIm){
	      img = parent.loadImage(cIm);
	      //parent.println("test");
	      wids = img.width;
	      heis = img.height;
//	      cmask = parent.createImage(img.width,img.height,parent.RGB);
//	      cmask.loadPixels();img.loadPixels();
//	      for (int i = 0; i < img.pixels.length; i++){
//	        if (img.pixels[i] == 60896) cmask.pixels[i] = parent.color(0xFFFFFF);
//	        else cmask.pixels[i] = parent.color(0x000000);
//	      }
	    }
	  }
}

