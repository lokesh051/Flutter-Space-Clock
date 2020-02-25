# Space Clock
Space Themed Clock for the flutter.dev clock competition. It is an analog clock which shows time in a slightly different manner then the regular clocks.

## Getting Started
Download or clone this repository. To run this project to connect a physical device or a simulator and run the command 
``` 
flutter run 
```

## Resources
Animations used in this app are built using Flare/Rive.

1. [HMS.flr](https://rive.app/a/lokesh/files/flare/hms)
2. [Sun.flr](https://rive.app/a/lokesh/files/flare/sun-2)
3. [Moon.flr](https://rive.app/a/lokesh/files/flare/moon)


## Screenshots

![Space Clock Sun](https://github.com/lokesh051/Flutter-Space-Clock/blob/master/ScreenShots/Space%20Clock%20Moon.png)

![Space Clock Moon](https://github.com/lokesh051/Flutter-Space-Clock/blob/master/ScreenShots/Space%20Clock%20Sun.png)


## Performance Profilling
According to the official [documentation](https://flutter.dev/docs/perf/rendering/ui-performance#the-performance-overlay). The app is able to render animations continuosly with an average of 15ms - 16ms/frame. It displays a vertical green bar on the graphs which means that the app is able to render frames within the limit. Below are some screenshots of performance profling on a real device (Iphone Xs max)

![Performance Profiling 1](https://github.com/lokesh051/Flutter-Space-Clock/blob/master/ScreenShots/IMG_7077.PNG)
![Performance Profiling 2](https://github.com/lokesh051/Flutter-Space-Clock/blob/master/ScreenShots/IMG_7078.PNG)

## Layout
The clock is built on an aspect ratio of 5:3 which is positioned towards the left side. The Sun/Moon is built on top of the clock and displayed separately in the top right corner.

*Visualizing the layout*
![Layout Visual](https://github.com/lokesh051/Flutter-Space-Clock/blob/master/ScreenShots/Visual.png)

Clock Layout Semantics            |  Clock Layout Colorised
:-------------------------:|:-------------------------:
![Clock Layout Semantics](https://github.com/lokesh051/Flutter-Space-Clock/blob/master/ScreenShots/flutter_06.png)  |  ![Clock Layout Color](https://github.com/lokesh051/Flutter-Space-Clock/blob/master/ScreenShots/Layout.png)

Sun/Moon Layout Semantics            |  Sun/Moon Layout Colorised. The Blue portion is where the Sun/Moon will be displayed. Since it is in a stack the overlapping does not matter.
:-------------------------:|:-------------------------:
![Sun/Moon Layout Semantics](https://github.com/lokesh051/Flutter-Space-Clock/blob/master/ScreenShots/flutter_04.png)  |  ![Sun/Moon Color](https://github.com/lokesh051/Flutter-Space-Clock/blob/master/ScreenShots/Aspect.png)

## Customizing
You can customize the follwing in this Space Clock App
1. The Space Particles Backgroud can be customized by adding or reducing more particles in the background
```
SpaceParticles particles = SpaceParticles(height, width, 1500);
```
2. The color of the hour hand, minute hand and second hand of the clock can be changed to any color, the default color is white. Below is an example
```
_clockController = ClockController(
      'seconds',
      hour: hour,
      minute: minute,
      seconds: seconds,
      hourColor: Colors.red,
      minuteColor: Colors.blue,
      secondColor: Colors.pink,
    );
```
**Points to remember:**

**a. The Clock is built using Flare now known as Rive. Therefore a Controller has to be passed if you wish to use the Space Clock.**

**b. The structure of the Class ClockController is 1 postional argument i.e animation name, 3 required arguments i.e. hour, minute, seconds, 3 optional parameters hourColor, minuteColor, secondColor**

3. Differnt Color and Sizes of the space particles can be changed by modifying the space_particles.dart file by editing the respective fields
```
particleColor = [
      Colors.white,
      Colors.purple,
      Colors.white30,
      Colors.green,
      Colors.blue,
      Colors.blueAccent
    ];
particleSizes = [0.004, 0.005, 0.006, 0.007, 0.008]

```
## Accessibility
The app is configured with the screen readers on both iOS & Android
## The App
![Space Clock](https://github.com/lokesh051/Flutter-Space-Clock/blob/master/ScreenShots/space%20clock.gif)

## Performance Test
![Space Clock Performance](https://github.com/lokesh051/Flutter-Space-Clock/blob/master/ScreenShots/performance.gif)


