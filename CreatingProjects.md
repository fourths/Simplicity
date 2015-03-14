This is a guide to help people get started making projects with PSimplicity with the source version available on this website.

## Steps ##
### with .pde ###
  1. Open a new Processing sketch.
  1. Add the following code to your sketch as a template, and then save it again.
```
// Name of Project
// Author

Stage stage = new Stage(#FFFFFF);
Sprite mySprite = new Sprite("http://www.majhost.com/gallery/veggieman/scans/frog.png",0,0);

void setup(){
  size(480,360);
}
void draw(){
  Update();
}
void stop(){
  SoundCleanse();
}
```
Customise the comments and size to your liking, and then start programming.
  1. Open a new tab in the same sketch and copy and paste Simplicity into it. The source for the latest version is available [here](http://psimplicity.googlecode.com/svn/trunk/Simplicity.pde).
  1. Start coding!

**Note:** _The function `SoundCleanse()` is only necessary if you will be using the `Microphone` or `Sound` classes in your project._

### with Java ###
**Note:** _You will need to compile yourself or use the compiled library from the SVN, which is usually out of date._
  1. Open a new Processing sketch.
  1. Add the following code to your sketch as a template, and then save it again.
```
// Name of Project
// Author

import ddf.minim.*;
import psimplicity.core.*;
import psimplicity.sound.*;

Project project = new Project(this);
Stage stage = new Stage(#FFFFFF);
Sprite mySprite = new Sprite("http://www.majhost.com/gallery/veggieman/scans/frog.png",0,0);

void setup(){
  size(480,360);
}
void draw(){
  project.Update();
}
void exit(){
  project.SoundCleanse();
}
```
Customise the comments and size to your liking, and then start programming.
  1. Start coding!

**Note:** _Sounds currently don't work with this version. Report bugs on the issues tab of this page._