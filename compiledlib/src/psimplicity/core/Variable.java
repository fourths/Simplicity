package psimplicity.core;

public class Variable {
	  public StringBuffer value;
	  public Variable(){
	    value = new StringBuffer("0");
	  }
	  public Variable(int val){
	    value = new StringBuffer(""+val);
	  }
	  public Variable(float val){
	    value = new StringBuffer(""+val);
	  }
	  public Variable(String val){
	    value = new StringBuffer(val);
	  }
	  //SETTING VARIABLE VALUES
	  void SetTo(int val){
	    value.replace(0,value.length(),""+val);
	  }
	  void SetTo(float val){
	    value.replace(0,value.length(),""+val);
	  }
	  void SetTo(String val){
	    value.replace(0,value.length(),val);
	  }
	  void ChangeBy(int val){
	    if ((float) Float.valueOf(value.toString())*0 != 0) SetTo(val); 
	    else value.replace(0,value.length(),String.valueOf((Float.valueOf(value.toString())))+val);
	  }
	  void ChangeBy(float val){
	    if ((float) Float.valueOf(value.toString())*0 != 0) SetTo(val); 
	    else value.replace(0,value.length(),String.valueOf((Float.valueOf(value.toString())))+val);
	  }
	  void ChangeBy(Variable val){
	    if ((float) Float.valueOf(value.toString())*0 != 0) SetTo(val.value.toString());
	    else value.replace(0,value.length(),String.valueOf((Float.valueOf(value.toString())))+Float.valueOf(val.value.toString()));
	  }
	  
	  //CONVERSIONS
	  
	  public int toInt(){
	    return Integer.parseInt(value.toString());
	  }
	  public float toFloat(){
	    return Float.valueOf(value.toString()); 
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
	    if (eq == Integer.parseInt(value.toString())) return true;
	    else return false;
	  }
	  public boolean equals(float eq){
	    if (eq == Float.valueOf(value.toString())) return true;
	    else return false;
	  }
	  public boolean equals(boolean eq){
	    if (eq == Boolean.parseBoolean(value.toString())) return true;
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
