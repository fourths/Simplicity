package psimplicity.core;
import java.util.ArrayList;

public class VarList{
	  public ArrayList<Variable> values;
	  //CONSTRUCTORS
	  public VarList(){
	    values = new ArrayList<Variable>();
	  }
	  public VarList(int ival){
	    values = new ArrayList<Variable>();
	    Variable tvar = new Variable(ival);
	    values.add(tvar);
	  }
	  public VarList(float ival){
	    values = new ArrayList<Variable>(); 
	    Variable tvar = new Variable(ival);
	    values.add(tvar);
	  }
	  public VarList(String ival){
	    values = new ArrayList<Variable>();
	    Variable tvar = new Variable(ival);
	    values.add(tvar);
	  }
	  public VarList(Variable ival){
	    values = new ArrayList<Variable>(); 
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
	    values.remove((int) val);
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
	      if (Integer.parseInt(tvar.value.toString()) == val){
	        return true;
	      }
	    }
	    return false;
	  }
	  public boolean Contains(float val){
	    for (int i=0; i<values.size(); i++){
	      Variable tvar = (Variable) values.get(i);
	      if (Float.parseFloat(tvar.value.toString()) == val){
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
	        for (int j = 0; j<tvar.toString().length(); j++){
	          if (Project.LetterOf(j,tvar.toString()).charAt(0) == ' '){ space = true;  break; }
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
	    return Float.parseFloat(vals.toString());
	  }
}
