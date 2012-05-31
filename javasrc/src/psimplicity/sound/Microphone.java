package psimplicity.sound;

import psimplicity.core.*;
import processing.core.*;
import ddf.minim.*;

public class Microphone {
	public AudioInput mic;
	private static PApplet parent;
	  public Microphone(){
	    if (Project.minim.getLineIn() != null){
	      mic = Project.minim.getLineIn();
	      Project.mics.add(this);
	    }
	    parent = Project.parent;
	  }
	  private int ln=-1;
	  public int Loudness(){
	    if (mic != null){ ln++; if (ln==1024) ln=0; return (int)(parent.map(parent.abs(mic.mix.get(ln)),0,1,0,100)); }
	    else return 0;
	  }
	  public boolean Loud(){
	    if (Loudness()>30) return true;
	    else return false;
	  }
}