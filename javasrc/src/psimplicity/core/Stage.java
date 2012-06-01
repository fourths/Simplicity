package psimplicity.core;

import java.util.ArrayList;
import processing.core.*;

public class Stage {
	public static ArrayList backgrounds = new ArrayList();
	  int bckNo;
	  static PApplet parent;
	  public Stage(){
		parent = Project.parent;
	    Project.penarea = parent.createGraphics(parent.width,parent.height,parent.P2D);
	    backgrounds.add(new Background(0xFFFFFF)); 
	    Project.stages.add(this);
	  }
	  public Stage(String im){
		parent = Project.parent;
	    Project.penarea = parent.createGraphics(parent.width,parent.height,parent.P2D);
	    backgrounds.add(new Background(im));
	    Project.stages.add(this);
	  }
	  public Stage(int clr){
		parent = Project.parent;
	    Project.penarea = parent.createGraphics(parent.width,parent.height,parent.P2D);
	    backgrounds.add(new Background(clr)); 
	    Project.stages.add(this);
	  }
	  
	  public void update(){
		  parent.translate(parent.width/2,parent.height/2);
	    parent.imageMode(parent.CENTER);
	    Background bck = (Background) backgrounds.get(BackgroundNumber());
	    if (bck.img != null && bck.img.width == parent.width && bck.img.height == parent.height) parent.background(bck.img);
	    else parent.background(bck.colour);
	    Project.MouseX=parent.mouseX-(parent.width/2);
	    Project.MouseY=parent.mouseY-(parent.height/2);
	    Project.timer = (parent.millis()/100f)-Project.lastreset;
	    Project.penarea.beginDraw();
	    Project.penarea.endDraw();
	    if (Project.penarea != null) parent.image(Project.penarea,0,0);
	    if (Project.asking) {
	    	parent.fill(255);
	    	parent.stroke(0x0494dc);
	    	parent.rect((-parent.width/2)+10,parent.height/2-30,parent.width-20,20);
	    	parent.stroke(0);
	    	parent.strokeWeight(3);
	    	parent.strokeJoin(parent.ROUND);
	    	parent.fill(Project.askcolour);
	    	parent.text(Project.askstring,(-parent.width/2)+10,parent.height/2-32);
	    	parent.fill(0);
	    	parent.text(Project.response.toString(),(-parent.width/2)+12,parent.height/2-15);
	    }
	  }
	  
	  public class Background{
	    public PImage img;
	    public int colour;
	    public int w,h;
	    Background (String im){
	      img = parent.loadImage(im);
	      colour = parent.color(0xFFFFFF);
	      w = parent.width;
	      h = parent.height;
	      img.resize(w,h);
	      //parent.println(w + h);
	    }
	    Background (int clr){
	      colour = clr;
	      w = parent.width;
	      h = parent.height;
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
	    bckNo = (int) newbck;
	  }
	  public void SwitchToBackground(String newbck){
	    bckNo = Integer.parseInt(newbck);
	  }
	  public void SwitchToBackground(Variable newbck){
	    bckNo = Integer.parseInt(newbck.value.toString());
	  }
	  
	  public void AddBackground(String im){
	    backgrounds.add(new Background(im)); 
	  }
	  public void AddBackground(int clr){
	    backgrounds.add(new Background(clr));
	  }
	  
	  public int BackgroundNumber(){
	    return bckNo; 
	  } 
}
