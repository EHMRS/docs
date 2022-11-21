# TIA485 Signalling Interface Cards

The system interfaces with the real world using a series of TIA485 interface
cards. These cards are designed in a flexible manner to allow usage across the
site and the future extension.

Each card has a total of 16 analog inputs, and 16 digital outputs.

## Two part boards
The interface card is split into two discreet boards for ease of maintenance.

### Back board
The back board contains the components that are generally more resilient,
including:

- voltage dividers
- LEDs
- TIA485 bus connectors (in and thru)
- Programming connector
- Additional breakout headers

#### Schematic
[Click here to see the schematic](./SCH_Rear-Card_2022-11-21.pdf)

### Front board
The front board includes all the delicate electronics, and will be easily
swappable. The boards have been designed in such a way as all the configuration
is done on the rear board, meaning when a front board is replaced there are no
additional steps to get the board up and running.

#### Schematic
[Click here to see the schematic](./SCH_Front-Card_2022-11-21.pdf)

## Analog inputs
Analog inputs are provided by a `74HC4067` chip. This allows a single analog pin
to read 16 inputs using a set of four address pins.

### Voltage division
The input to each of the analog mux channels goes through a voltage divider to
bring a potential 50v down to 5v. 50v was chosen to accommodate the highest
voltage expected in the field: 48v.

## Digital Outputs
Digital outputs are provided by `74HC595` chips chained together. The outputs of
the 595s then go through a `TPD2005`, a driver chip, which converts the 5v logic
level to the appropriate output voltage (24v or 48v).

### Monitoring
To provide monitoring of the output chips, a second `74HC4067` analog mux device
is included. This allows the system to detect whether each output of the driver
chips is working as expected.

## Processing
An `ATMega328p` and appropriate support circuitry is included on the board to
read the inputs, write to the outputs, and generally control the board.

## Commmunication
The field boards use Modbus to communicate with the head end device. Modbus is
used over a TIA485 bus. There is an on-board `MAX1487` device to handle the
conversion between TTL (which the ATMega outputs) and TIA485 levels.

### Protocol
The devices use Modbus as a communication protocol on top of the 485 bus.

#### Coils & registers
They are configured with:

- 16 coils for digital output
- 16 input registers for analog input from the field
- 16 input registers for monitoring of digital outputs
- 1 input register to monitor the 24v rail

#### Addressing
The addressing for the device is configured using a 8 channel DIP switch, placed
on the rear board.

Valid addresses are 1 - 247.