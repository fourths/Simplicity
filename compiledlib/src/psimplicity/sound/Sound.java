package psimplicity.sound;
import psimplicity.core.*;
import ddf.minim.*;

public class Sound {
	public static AudioPlayer player;
	  public Sound(String sndlnk){
		  try{
	    player = Project.minim.loadFile(sndlnk);
	    Project.sounds.add(this);
		  }
		  catch(NullPointerException e){
			 e.printStackTrace();
		  }
	  }
	  public Sound(Variable sndlnk){
	    player = Project.minim.loadFile(sndlnk.toString());
	    Project.sounds.add(this);
	  }
	  
	  public static float Volume(){
	    return player.getGain();
	  }
	  
	  public static void SetVolumeTo(int val){
	    player.setGain(val);
	  }
	  public static void SetVolumeTo(float val){
	    player.setGain(val);
	  }
	  public static void SetVolumeTo(Variable val){
	    player.setGain(Float.parseFloat(val.value.toString()));
	  }
	  
	  public void ChangeVolumeBy(int val){
	    SetVolumeTo(Volume()+val);
	  }
	  public void ChangeVolumeBy(float val){
	    SetVolumeTo(Volume()+val);
	  }
	  public void ChangeVolumeBy(Variable val){
	    SetVolumeTo(Volume()+Float.parseFloat(val.value.toString()));
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