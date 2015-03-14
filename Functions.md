_**Note:** This page is in progress._

_**Note:** These examples are only code snippets and will not run on their own._

## Global functions ##

### Update() ###
```
void draw(){
  Update();
}
```
Call this function in `draw()` to draw all the sprites and the stage. Otherwise, nothing will be drawn unless you call each `Sprite` and `Stage` object's `update()` function individually (although this will ignore layers and draw in the order they're called in).

### SoundCleanse() ###
```
void stop(){
  SoundCleanse();
}
```
Call this function in `stop()` when using `Microphone` or `Sound` objects in a program. Don't use `stop()` otherwise unless you're an advanced user and understand how, because it won't close the program properly.

### Stop() ###
```
void keyPressed(){
  if (KeyPressed('s')) Stop();
}
```

Stops the program. Same as `noLoop()` for advanced users; program can be started again with `loop()`.

### Exit() ###
```
void keyPressed(){
  if (KeyPressed('e')) Exit();
}
```

Closes the program window.

### Trig functions ###
`Sin()`, `Cos()`, `Tan()`, `Asin()`, `Acos()`, and `Atan()` are the available trigonometric functions. They use degrees, as opposed to their Processing lowercase counterparts (like `sin()`) which use radians. They can take integers, decimals, and variables.
```
void keyPressed(){
  if (KeyPressed(LEFT)) MoveSteps(Tan(112)+5);
}
```

### PickRandom() ###
```
Sprite frog;
Variable maxY;
void setup(){
  maxY = new Variable(55);
  frog = new Sprite("http://www.majhost.com/gallery/veggieman/scans/frog.png",0,PickRandom(0,maxY));
}
```
This function chooses a random number in between the values given and returns it. It will return a decimal unless given two integers. It takes two values, minimum and maximum, which can be ints, floats, or Variables.

### Round() ###
```
Sprite frog;
Variable spriteX;
void setup(){
  spriteX = new Variable(20.47);
  frog = new Sprite("http://www.majhost.com/gallery/veggieman/scans/frog.png",Round(spriteX),0)
}
```
This function returns its input rounded to the the nearest whole number. It takes an int, a float, or a Variable.

### LengthOf() ###
```
void keyPressed(){
  if(KeyPressed(UP)) frog.ChangeYBy(LengthOf("robots"));
}
```
This function returns the length of any String, int, float, or Variable that it is given.

### ResetTimer() ###
```
void draw(){
  frog.SetXTo(Timer());
  if(Timer() == 100) ResetTimer();
}
```
This function sets the timer to 0.

### Timer() ###
```
void draw(){
  frog.SetXTo(Timer());
  if(Timer() == 100) ResetTimer();
}
```
This function returns the value of the timer, which is the amount of time elapsed in seconds since the program has been opened or the timer has been reset.

### Join() ###
```
Variable var1 = new Variable("Hello ");
String str1 = "World!";
Variable helloworld = new Variable(Join(var1,str1));
```
This function returns a string with its two inputs combined. It can only take Variables and Strings, so any integers or floats must be converted before being joined with this function.

### LetterOf() ###
```
Variable word = new Variable("wryness");
Variable letter = new Variable(LetterOf(3,word));
```
This function returns a string with the specified letter of a String or Variable. It currently only allows an int to specify the letter number, but Variable support is planned.

### MouseDown() ###
```
void draw(){
  if (MouseDown()) frog.Stamp();
}
```
```
void draw(){
  if (MouseDown(LEFTBTN)) frog.Stamp();
  else if (MouseDown(RIGHTBTN) Clear();
}
```
This function returns a boolean of whether the mouse is down or not. It can also take `LEFTBTN`, `RIGHTBTN`, or `CENTERBTN` to specify which button it should specifically sense for.

### KeyPressed() ###
```
void keyPressed(){
  if (KeyPressed('s')) frog.Stamp();
  if (KeyPressed(BACKSPACE) || KeyPressed(DELETE)) Clear();
}
```
This function returns a boolean of whether the specified key is pressed. If it is a displaying character like a letter, number, punctuation, or space, put that character in between single quotes, like `KeyPressed('m');` Otherwise, type the key's name in all caps, like CONTROL, ALT, SHIFT, TAB, etc.

_**Note:** For cross-platform compatibility between Macs and PCs, remember to use_ `if (KeyPressed(ENTER) || KeyPressed(RETURN))` _for the enter/return key and_ `if (KeyPressed(DELETE) || KeyPressed(BACKSPACE))` _for the backspace/delete key._

### Ask() ###
```
void keyPressed(){
  if (KeyPressed(TAB)) Ask("What is the meaning of life?");
}
```
This function will display a white text box with a blue outline and the String or Variable given prompted above it. It can take one input, the question as a String or Variable, or two with the second being the colour of the prompt text (the default is black). The user's answer can be accessed with `Answer()`.

### Answer() ###
```
Variable name;
void setup(){
  Ask("What's your name?");
  name = new Variable(Answer());
}
```
This function returns a string with the most recent answer given after the enter key is pressed after using `Ask()`.