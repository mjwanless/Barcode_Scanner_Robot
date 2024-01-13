# Group number and team member names

-  Group 20
-  Team members: Kaushal Hemnani, Ranidu Rajasekara, and Malcolm Wanless.

===========================================

## A short description (1 paragraph max) of the project and how your solution addresses the challenge.

-  In this project, our robot was built, and programmed, to take a large number of values that relate to the color values detected by the attached sensor, as it drives over a barcode. It would collect these values in a .txt file, we would convert it to a .csv file, and program a script in MATLAB that would give us the value of the barcode (in this case, a single character), based on the values collected and .csv file passed in. Our robot can detect the color, using a color sensor, drive slowly over the barcode (using a slow driving speed, small wheels, and a gear ratio, using two gears, that are able to slow down the robot enough that enough samples can be collected, from the barcode). The color sensor is, also, partially covered, in order to get a small enough value, as the normal sensor collects data from a larger-than-needed area.

=================================================

## Features: a list of features that your robot supports.

-  Our robot has the following sensors:
   -  Color Senor: To detect the level of reflected light, coming from the image below it, using a self-produced light, on a scale of 0 - 100, where 0 is no light reflected, and 100 is full light reflection
   -  Motor, for forward movement, at a constant rate. Only one is needed, and allows for both wheels to maintain a forward vector in the same direction/velocity.

As there is no reason to have more sensors, no more were added, as to reduce potential functional complexity.

We've also used two gears, in such a way, as to slow the robot down, as the speed needs to be slow enough to get many slices, or data points, and a speed of 1% of the built-in values is still too high to collect enough samples, on a smaller barcode.

================================================

## Constraints: a list of limitations of your solution (maximum speed, smallest barcode size the robot can read, etc.)

-  Due to the gears used, they were less effective as the barcode got smaller, since they could only go a certain minimum speed.
-  Our brick would choose not to save data to the .txt file, depending on the run.
   -  There were times where the brick would run the code, and not go into the correct for-loops or while-loops when run normally, but would work when stepped into.
   -  In addition, if the code ran properly, we would get the same value for every line, regardless of the what the arm is picking up.
      -  We were able to determine this, as we had the arm write out the values that it was picking up, on the screen, beside the sensor data from robotC, and on the physical robot, itself.
      -  The code would, often, generate a .txt file, but would not update, even when we wiped the brick, changed computers, changed the filename append value, restarted robotC, etc...
      -  We showed this to the TA, and they provided new bricks, but those bricks got stuck at "updating" and "starting up" for half an hour before they just stopped working for us, so we were unable to fix some of the issues, and had to finish the assignment with a potentially-malfunctioning brick.

===================================================

## Suggested improvements: a list of improvement that your team recommends to this implementation.

-  As we had technical issues that we were unable to deal with, we don't know, specifically, what we could do from a hardware/software point.
-  However, on the physical design side, we could have slowed the robot down, with a higher gear ratio, than we used, in order to get more values.

===============================================

## Lessons learned: a list showing what could you have been done better on a technical, project-management, and team-management level.

-  All aspects of the project should be worked on, equally, by all members (including coding, physical robot design, building, etc...). As the skill levels and experience levels of the group members can vary, I think that MSE 110 should have a base-level coding pre-requisite, at some level. It's hard to delegate tasks, or break down the assignment, when the levels of experience in this class vary wildly, and can put a lot of pressure on everyone: People who can code, or have experience with robots, will likely have to pull more weight, while students who are less experienced are going to feel overwhelmed and are going to be less able to provide assistance.
