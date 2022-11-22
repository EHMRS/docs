# Track sections

Each track section on the main line uses 24/48v to detect the presence of a
train.

This is done by feeding the voltage into one of the rails (via a large resistor)
, with the other rail connected to ground. By detecting the voltage on the
"live" rail, one can detect the presence of a train by whether the voltage drops
to near-zero. When the voltage drops it is indicative of a train in the section
as the voltage travels through the wheels, across the axle, and to ground via
the other rail.

For points, we detect by energising the entire point to 24/48v and then
detecting the loss of that voltage to the neighbouring section's ground rail.
