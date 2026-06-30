# PIC16F627A Running Lights System

## Overview
This project implements a **running lights control system** using a **PIC16F627A** microcontroller. It features **4 push buttons** (Btn1–Btn4) connected to pins RA0–RA3 and **6 LEDs** (LED1–LED6) connected to pins RB0–RB5. The system is programmed in **assembly language** and simulated in **Proteus 7**.

The system responds to button presses as follows:
- **Btn1**: Turns all LEDs OFF.
- **Btn2**: Turns ON LED1, LED3, LED5 (odd LEDs); others OFF.
- **Btn3**: Turns ON LED2, LED4, LED6 (even LEDs); others OFF.
- **Btn4**: Turns all LEDs ON.

At startup, all LEDs are OFF.

---

## Circuit Design
- **Microcontroller**: PIC16F627A
- **Inputs**: 4 push buttons with 10kΩ pull-down resistors (RA0–RA3)
- **Outputs**: 6 LEDs with 100Ω current-limiting resistors (RB0–RB5)
- **Simulation**: Proteus 7

---

## Project Files
- `main.asm` – Assembly source code
- `CAO Project 2025.pdsprj` – Proteus simulation file
- `README.md` – Project documentation

---

## How It Works
1. The program initializes the ports and sets the direction (TRISA = input, TRISB = output).
2. It continuously reads the state of the buttons.
3. Based on the button pressed, it updates the LEDs accordingly.
4. Debouncing is handled via software delays to ensure stable button detection.

---

## Getting Started
### Prerequisites
- **MPLAB IDE** or **MPASM** for assembling the code
- **Proteus 7** for simulation

### Simulation Steps
1. Open the `.pdsprj` file in Proteus 7.
2. Load the hex file generated from the assembly code.
3. Run the simulation and press the buttons to test the behavior.

---

## Pin Mapping
| Button | MCU Pin | LED   | MCU Pin |
|--------|---------|-------|---------|
| Btn1   | RA0     | LED1  | RB0     |
| Btn2   | RA1     | LED2  | RB1     |
| Btn3   | RA2     | LED3  | RB2     |
| Btn4   | RA3     | LED4  | RB3     |
|        |         | LED5  | RB4     |
|        |         | LED6  | RB5     |

---
  
## Author
Ryan Gallant  
GitHub: github.com/KernelRyan
Student of: Tshwane University Of Technology

---

## License
This project is open-source and available under the MIT License.
