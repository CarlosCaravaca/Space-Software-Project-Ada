# Space-Software-Project-Ada
The objective is to build a prototype for reduced onboard software for a satellite. The system
has two parts:
* A main computing hardware system that controls the main tasks.
* A microcontroller subsystem that has a direct access to the sensors and actuators.
Both subsystems communicate using a master/slave message protocol defined for this project.

The main computing hardware (raspberry PI) will be programmed using the Ada programming Language.
The project may be extended to include the programming in Ada of the Arduino as well, which might
be harder in principle due to the fact that a cross-compiler is needed (see https://www.academia.edu/2490736/Integrating_8-bit_AVR_Micro-Controllers_in_Ada),
whereas gnat tools can be directly installed in the raspberry PI and used from there to compile the Ada code.
