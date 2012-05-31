package psimplicity.core;

public class Broadcast {
		  public boolean sent = false;
		  public Broadcast (){
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
