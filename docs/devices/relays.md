# Relays

The relays with which the system interacts can be broadly split into two
catagories:

- Input relays
- Output relays

The input relays allow the system to detect the state of something, i.e. the
system is detecting across the contacts

The output relays allow the system to output a state to a device, i.e. the
system is wired across the coil.

Relays generally are used for safety-related items. We currently have the
following relays:

## Emergency Stop (e-stop)

This relay is wired through all the e-stop buttons on-site, as well as the
software e-stop relay (to allow the system to trigger an emergency stop).

## Software e-stop

This output relay allows the system to trigger an emergency stop by breaking
the e-stop chain.

## e-stop reset

This output relay allows the system to reset the e-stop relay to a closed state.

## Power on

This relay triggers the power-on procedure, which includes building the
reservoir in the compressor, and turning on power to auxiliary systems.

## Power off

Similar to the power on relay, but for the power-off procedure. This includes
triggering a dump of the compressor's reservoir.

## Auxiliary contactor

This allows the system to detect whether the auxiliary system contactor is
closed, and therefore whether the power-on or power-off procedure is complete.

## AC contactor

This allows the system to detect a mains power feed AC loss. Although the system
runs on UPS for a number of hours, this contactor allows the system to alert
engineers to an AC loss, allowing them to restore mains power before the system
has to enter a shutdown state.
