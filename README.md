# Digital Blood Bank & Transfusion Matching System

A MATLAB-based **Digital Blood Bank & Transfusion Matching System** developed as a group project for **Programming for Engineers**.

The project simulates a hospital blood bank system that uses blood-type compatibility, patient information, urgency, and inventory data to identify an available blood unit and support the transfusion workflow.

> **Academic Project Disclaimer:** This project is an educational simulation and is not intended for real-world clinical decision-making or transfusion management.

---

## 🩸 Project Overview

Blood transfusions are an important part of healthcare and can be necessary during surgery, trauma, cancer treatment, anemia, and severe blood loss. Because incompatible transfusions can cause serious adverse reactions, accurate blood compatibility and inventory management are essential.

Our goal was to design a **digital blood bank system** that combines biological principles with engineering and programming concepts.

The MATLAB program allows a user to:

* Enter patient information
* Select a blood type and medical condition
* Determine compatible donor blood types
* Consider patient urgency and history
* Search a simulated blood bank inventory
* Rank compatible blood units using a scoring algorithm
* Reserve a blood unit
* Update inventory
* Display patient-specific warnings
* Schedule a transfusion appointment

---

## 🧬 Biomedical Engineering Connection

This project connects directly to **biomedical engineering** by combining:

**Medicine + Biology + Computer Programming + Engineering**

Biomedical engineers develop technologies and computational systems that can support patient care, safety, and healthcare efficiency.

Our system uses biological knowledge of **ABO and Rh blood typing** and combines it with an algorithmic approach to simulate blood-unit selection and inventory management.

The project demonstrates how programming can be applied to a healthcare workflow to organize information and automate parts of a simulated decision-support process.

---

## ⚙️ How the System Works

The program follows a series of steps:

```text
Patient Information
        ↓
Blood Type Selection
        ↓
Compatibility Identification
        ↓
Patient History & Urgency
        ↓
Blood Bank Inventory
        ↓
Compatibility & Scoring Algorithm
        ↓
Best Available Blood Unit
        ↓
Inventory Update
        ↓
Patient Warnings
        ↓
Appointment Scheduling
        ↓
Appointment Confirmation
```

---

## 🩺 Patient Information

The system collects several pieces of patient information.

### Blood Type

The program supports:

```text
A+
A-
B+
B-
O+
O-
AB+
AB-
```

A compatibility table determines which donor blood types can be considered for the selected patient blood type.

### Medical Condition

The user can select from several conditions:

* Normal
* Sickle Cell
* Thalassemia
* Anemia
* Cancer
* Autoimmune Disorder

### Additional Patient Factors

The system also collects:

* Urgency level from 1–10
* Number of previous transfusions
* Pregnancy history
* Previous transfusion reactions
* Chronic illness
* Pre-existing conditions

---

## 🏥 Blood Bank Inventory

The program creates a simulated blood bank database containing:

| Variable    | Purpose                      |
| ----------- | ---------------------------- |
| `Type`      | Blood type of the unit       |
| `UnitID`    | Unique identification number |
| `DaysOld`   | Age of the blood unit        |
| `Quantity`  | Number of units available    |
| `Location`  | Storage location             |
| `Available` | Availability status          |

Example storage locations include:

```text
Fridge A
Fridge B
Fridge C
```

The inventory is updated when a unit is reserved.

---

## 🧮 Matching Algorithm

Compatible donor units are evaluated using a rule-based scoring system.

Factors incorporated into the algorithm include:

* Exact blood-type match
* Same ABO group
* Same Rh factor
* Blood-unit age
* Patient urgency
* Inventory quantity
* Previous transfusions
* Previous transfusion reactions
* Pregnancy history
* Chronic illness
* Selected pre-existing conditions
* Preservation of O- inventory for certain emergency scenarios

The system first filters out unavailable or out-of-stock units. Compatible units are then assigned scores based on the programmed criteria.

The highest-scoring available unit is selected by the simulation.

### Simplified scoring logic

```text
Compatible donor
      ↓
Exact blood type?
      ↓
Same ABO group?
      ↓
Same Rh factor?
      ↓
Blood-unit freshness
      ↓
Patient urgency
      ↓
Inventory considerations
      ↓
Patient history factors
      ↓
Final score
      ↓
Selected blood unit
```

---

## 📦 Inventory Management

After a blood unit is selected, the program reserves one unit by decreasing its inventory quantity.

For example:

```text
Quantity before reservation: 3
                    ↓
               Reserve 1
                    ↓
Quantity after reservation: 2
```

If the remaining quantity reaches zero, the unit is marked as unavailable.

This simulates a basic inventory-management workflow within a digital blood bank.

---

## ⚠️ Patient Warnings

The program displays additional warnings when certain patient factors are present.

For example:

* Multiple previous transfusions → higher antibody-risk notification
* Sickle cell disease → extended antigen-matching recommendation
* Previous transfusion reaction → transfusion-reaction notification

These warnings are intended to demonstrate how patient history can be incorporated into a computational healthcare workflow.

---

## 📅 Appointment Scheduling

The system also includes a simulated appointment-booking component.

Users can select:

### Month

```text
April
May
June
```

### Day

The program checks whether the selected date is listed as unavailable.

### Appointment Time

Available times include:

```text
9:00 AM
10:00 AM
11:00 AM
12:00 PM
1:00 PM
2:00 PM
3:00 PM
4:00 PM
```

The program uses MATLAB's `randi` function to simulate appointment-slot availability.

Once the appointment is successfully selected, the system displays a confirmation containing the appointment date, time, and reserved blood type.

---

## 💻 MATLAB Programming Concepts

This project provided experience with several MATLAB programming concepts, including:

* Variables
* Arrays
* Strings
* Cell arrays
* Structures
* `for` loops
* Conditional statements
* Logical operators
* String comparison
* `listdlg`
* `inputdlg`
* `questdlg`
* `disp`
* `strcmp`
* `contains`
* `erase`
* `extractAfter`
* Random number generation
* Inventory manipulation
* Rule-based algorithms

---

## 🖥️ Demonstration

The demonstration begins by asking the user to select a blood type.

For the example presented in our project:

```text
Patient Blood Type: A+
Condition: Anemia
Urgency: 5
Previous Transfusions: 3
Pregnancy History: No
Previous Transfusion Reaction: No
```

The user then selects an appointment month, day, and time.

The program ultimately produces a confirmation containing the selected blood unit and appointment information.

**Screenshots from the project presentation can be found in the `screenshots` folder.**

---

## 🌎 Real-World Application

A digital blood-bank system could potentially support workflows involving:

* Hospitals
* Blood banks
* Trauma centers
* Surgical departments
* Outpatient clinics

Digital systems can organize blood inventory, patient information, and compatibility-related information in a centralized workflow.

Patients who require repeated transfusions, including individuals with conditions such as thalassemia or sickle cell disease, may require additional blood-matching considerations.

This project demonstrates the concept of using engineering and computational tools to support healthcare workflows.

---

## 🚀 Future Improvements

Our report identified several possible improvements to the system:

### Real Blood Bank Data

Use realistic blood-bank inventory and patient datasets to test the system under more representative conditions.

### Data Visualization

Add interactive graphs and dashboards showing:

* Blood inventory
* Donor rankings
* Stock levels
* Appointment availability

### Graphical User Interface

Develop a more advanced GUI to make the system more professional and user-friendly.

### Advanced Antigen Matching

Expand beyond basic ABO and Rh compatibility to incorporate additional antigen-matching considerations.

### Machine Learning

Explore machine-learning approaches for predicting:

* Blood shortages
* Inventory demand
* Future blood requirements

### Database Integration

Connect the system to a database or electronic health record system to support real-time information management in a hypothetical clinical environment.

---

## 📚 References

Dunbar, N. M. (2020). Does ABO and RhD matching matter for platelet transfusion? *Hematology*.
https://doi.org/10.1182/hematology.2020000135

Gammon, R. R., Rosenbaum, L., Cooke, R., Friedman, M. T., Rockwood, L., Nichols, T., & Vossoughi, S. (2020). Maintaining adequate donations and a sustainable blood supply: Lessons learned. *Transfusion*.
https://doi.org/10.1111/trf.16145

Li, H., & Guo, K. (2022). Blood group testing. *Frontiers in Medicine, 9*, 827619.
https://doi.org/10.3389/fmed.2022.827619

---

## 🎓 Academic Context

**Course:** Programming for Engineers
**Project Type:** Group Project
**Programming Language:** MATLAB
**Application Area:** Biomedical Engineering / Healthcare Technology

This project demonstrates the application of programming, biological principles, and engineering problem-solving to a simulated healthcare system.
