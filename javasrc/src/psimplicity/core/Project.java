package psimplicity.core;

import java.util.ArrayList;

import arb.soundcipher.*;

import processing.core.*;

import ddf.minim.*;

import psimplicity.sound.*;

public class Project {
	@SuppressWarnings("unused")
	private static final long serialVersionUID = 1L;
	public static int MouseX,MouseY;
	public static boolean asking;
	public static int askcolour;
	public static String askstring,finalResponse;
	public static Variable response = new Variable("");
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
	public static int lastreset;
	public static float timer;
	public static float lasttimer;
	public static PGraphics penarea;
	public static PApplet parent;
	public Project (PApplet p){
		parent = p; 
	}
	public final static float E = (float) Math.E;
	public static Minim minim = new Minim(parent);
	public static SoundCipher sc = new SoundCipher(parent);
	/**
	 * Stops the draw() function from running with Processing's noLoop() function.
	 * The program can then be restarted with Processing's loop() if desired.
	 * It doesn't prevent functions outside of draw() (e.g. keyPressed()) from
	 * running, nor does it close the window.
	 *
	 * @see Exit()
	 */
	public static void Stop(){
		parent.noLoop();
	}

	public static void Exit(){
		parent.exit(); 
	}

	public static float Sin(float val){
	  return PApplet.degrees(PApplet.sin(val)); 
	}
	public static float Sin(int val){
	  return PApplet.degrees(PApplet.sin(val)); 
	}
	public static float Sin(Variable val){
	  return PApplet.degrees(PApplet.sin(val.toFloat())); 
	}

	public static float Cos(float val){
	  return PApplet.degrees(PApplet.cos(val)); 
	}
	public static float Cos(int val){
	  return PApplet.degrees(PApplet.cos(val)); 
	}
	public static float Cos(Variable val){
	  return PApplet.degrees(PApplet.cos(val.toFloat())); 
	}

	public static float Tan(float val){
	  return PApplet.degrees(PApplet.tan(val)); 
	}
	public static float Tan(int val){
	  return PApplet.degrees(PApplet.tan(val)); 
	}
	public static float Tan(Variable val){
	  return PApplet.degrees(PApplet.tan(val.toFloat())); 
	}

	public static float Asin(float val){
	  return PApplet.degrees(PApplet.asin(val)); 
	}
	public static float Asin(int val){
	  return PApplet.degrees(PApplet.asin(val)); 
	}
	public static float Asin(Variable val){
	  return PApplet.degrees(PApplet.asin(val.toFloat())); 
	}

	public static float Acos(float val){
	  return PApplet.degrees(PApplet.acos(val)); 
	}
	public static float Acos(int val){
	  return PApplet.degrees(PApplet.acos(val)); 
	}
	public static float Acos(Variable val){
	  return PApplet.degrees(PApplet.acos(val.toFloat())); 
	}

	public static float Atan(float val){
	  return PApplet.degrees(PApplet.atan(val)); 
	}
	public static float Atan(int val){
	  return PApplet.degrees(PApplet.atan(val)); 
	}
	public static float Atan(Variable val){
	  return PApplet.degrees(PApplet.atan(val.toFloat())); 
	}

	public static float PickRandom(float low,float high){
	  return parent.random(low, high);
	}
	public static int PickRandom(int low,int high){
	  return (int) parent.random(low, high);
	}
	public static float PickRandom(float low,int high){
	  return parent.random(low, high);
	}
	public static float PickRandom(int low,float high){
	  return parent.random(low, high);
	}
	public static float PickRandom(Variable low,Variable high){
	  return parent.random(Float.parseFloat(low.value.toString()), Float.parseFloat(high.value.toString()));
	}
	public static float PickRandom(Variable low, int high){
	  return parent.random(Float.parseFloat(low.value.toString()), high);
	}
	public static float PickRandom(int low, Variable high){
	  return parent.random(low, Float.parseFloat(high.value.toString()));
	}
	public static float PickRandom(Variable low, float high){
	  return parent.random(Float.parseFloat(low.value.toString()), high);
	}
	public static float PickRandom(float low, Variable high){
	  return parent.random(low, Float.parseFloat(high.value.toString()));
	}

	public static int Round(int dec){
	  return PApplet.round(dec);
	}
	public static int Round(float dec){
	  return PApplet.round(dec); 
	}
	public static int Round(Variable dec){
	  return PApplet.round(dec.toFloat());  
	}

	public static int LengthOf(int val){
	  return String.valueOf(val).length(); 
	}
	public static int LengthOf(float val){
	  return String.valueOf(val).length(); 
	}
	public static int LengthOf(String val){
	  return val.length(); 
	}
	public static int LengthOf(Variable val){
	  return val.value.length(); 
	}

	public static void ResetTimer() {
	  lastreset = parent.millis();
	}

	public static float Timer(){
	  return timer; 
	}

	public static String Join(Variable vval,String sval){
	  return vval.toString()+sval;
	}
	public static String Join(String sval,Variable vval){
	  return sval+vval.toString();
	}
	public static String Join(Variable vval,Variable vval2){
	  return vval.toString()+vval2.toString();
	}
	public static String Join(String sval,String sval2){
	  return sval+sval2;
	}

	public static String LetterOf(int loc,String val){
	  return Character.toString((val.charAt(loc)));
	}
	public static String LetterOf(int loc,Variable val){
	  return Character.toString(val.value.charAt(loc));
	}
	public static String LetterOf(Variable loc,String val){
	  return Character.toString(val.charAt(loc.toInt()));
	}
	public static String LetterOf(Variable loc,Variable val){
	  return Character.toString(val.value.charAt(loc.toInt()));
	}

	public static boolean MouseDown(){
	  if (parent.mousePressed) return true;
	  else return false;
	}
	public static boolean MouseDown(int btn){
	  if (parent.mousePressed){
	    if (btn == LEFTBTN){
	      if (parent.mouseButton == PApplet.LEFT) return true;
	      else return false; 
	    }
	    if (btn == RIGHTBTN){
	      if (parent.mouseButton == PApplet.RIGHT) return true;
	      else return false; 
	    }
	    if (btn == CENTERBTN){
	      if (parent.mouseButton == PApplet.CENTER) return true;
	      else return false; 
	    }
	    else return false;
	  }
	  if (parent.mousePressed){
	    if (btn == 1){
	      if (parent.mouseButton == PApplet.LEFT) return true;
	      else return false; 
	    }
	    if (btn == 2){
	      if (parent.mouseButton == PApplet.RIGHT) return true;
	      else return false; 
	    }
	    if (btn == 3){
	      if (parent.mouseButton == PApplet.CENTER) return true;
	      else return false; 
	    }
	    else return false;
	  }
	  else return false;  
	}

	//KEY SENSING
	public static boolean KeyPressed(char lpkey){
	  if(parent.keyPressed){
	    if (parent.key == lpkey || parent.key == Character.toString(lpkey).toUpperCase().charAt(0)){
	      return true;
	    }
	    else return false;
	  }
	  else return false;
	}
	public static boolean KeyPressed(int keyc){
	  if (parent.keyPressed){
	    if (parent.keyCode == keyc) return true;
	    else return false; 
	  }
	  else return false;
	}

	public static void StopAllSounds(){
	  for (int i = 0; i<sounds.size(); i++){
	    Sound fsnd = (Sound) sounds.get(i);
	    if (fsnd.player.isPlaying()){
	      fsnd.Stop(); 
	    }
	  }
	}

	public static ArrayList<Microphone> mics = new ArrayList<Microphone>();
	public static ArrayList<Sprite> sprites = new ArrayList<Sprite>();
	public static ArrayList<Stage> stages = new ArrayList<Stage>();
	public static ArrayList<Sound> sounds = new ArrayList<Sound>();

	public static void SoundCleanse(){
	  for (int i = 0; i<sounds.size(); i++){
	    Sound fsnd = (Sound) sounds.get(i);
	    fsnd.player.close();
	  }
	  for (int i = 0; i<mics.size(); i++){
	    Microphone fmic = (Microphone) mics.get(i);
	    fmic.mic.close();
	  }
	  minim.stop();
	}

	public static void keyTyped(){
	  if (parent.key == PApplet.ENTER || parent.key == PApplet.RETURN){
	    finalResponse = response.toString();
	    asking = false; 
	  }
	  else if (parent.key == PApplet.BACKSPACE || parent.key == PApplet.DELETE){
	    if (response.value.length()>=1){
	      response.value.deleteCharAt(response.value.length()-1); 
	    }
	  }
	  else if (response.value.length()<34 && parent.key != PApplet.SHIFT && parent.key != PApplet.CODED && parent.key != PApplet.ALT && parent.key != PApplet.CONTROL && parent.key != PApplet.ESC && parent.key != PApplet.TAB) response.value.append(parent.key); 
	}

	public static void Ask(String val){
	  if (!asking){
	    response.value.delete(0,response.value.length());
	    asking = true;
	    askstring = val;
	    askcolour = parent.color(0,0,0);
	  }
	}
	public static void Ask(Variable val){
	  if (!asking){
	    response.value.delete(0,response.value.length());
	    asking = true;
	    askstring = val.toString();
	    askcolour = parent.color(0,0,0);
	  }
	}
	public static void Ask(String val, int clr){
	  if (!asking){
	    response.value.delete(0,response.value.length());
	    asking = true;
	    askstring = val;
	    askcolour = clr;
	  }
	}
	public static void Ask(Variable val, int clr){
	  if (!asking){
	    response.value.delete(0,response.value.length());
	    asking = true;
	    askstring = val.toString();
	    askcolour = clr;
	  }
	}

	public static String Answer(){
	  return finalResponse; 
	}

	public static void Clear(){
	  penarea = parent.createGraphics(parent.width,parent.height,PApplet.P2D); 
	}

	public static void Update(){
	  Stage stage = (Stage) stages.get(0);
	  stage.update();
	  for (int i = 0; i < sprites.size(); i++){
	    Sprite temp = (Sprite) sprites.get(i);
	    temp.update(); 
	  }
	}
	private static int penimgs = 0;
	public static void PenScreenshot(){
	  String folderpath = parent.selectFolder("Choose a folder to save to..."); 
	  if (penarea != null && folderpath != null) penarea.save(folderpath+"\\pen"+penimgs+".png");
	}
	private static int scimgs = 0;
	public static void Screenshot(){
	  String folderpath = parent.selectFolder("Choose a folder to save to..."); 
	  if (penarea != null && folderpath != null) parent.save(folderpath+"\\screen"+scimgs+".png");
	}
	
    public static void PlayNoteForBeats(int note, float beats){
        sc.playNote(note, 100, beats);
    }

	public static void SetInstrument(int inst){
	        sc.instrument(inst);
	}
	
	public static int Instrument(){
	        return (int) sc.instrument;
	}
	
	public static void RestForBeats(int beats){
	        sc.playNote(0, 0, beats);
	}
	
	public static void SetTempo(int tmpo){
	        sc.tempo(tmpo);
	}
	
	public static void ChangeTempoBy(int amt){
	        sc.tempo(sc.tempo+amt);
	}
	
	public static float Tempo(){
	        return (float) sc.tempo;
	}	
}
