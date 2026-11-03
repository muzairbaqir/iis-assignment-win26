# Integrated Intelligent Systems: Tutorial 1 – Foundations

**Course:** Integrated Intelligent Systems (IIS)  
**Assignment:** Tutorial 1 – Foundations  
**Author:** Muhammad Uzair Baqir  

---

## Overview

This directory contains the submission for **Tutorial 1: Foundations**. The assignment focuses on the fundamental concepts, physical constraints, and architecture of cognition-enabled robot agents.

The completed work is organized across three main sections inside the Jupyter notebook [`L01_Foundations_Tutorial.ipynb`](L01_Foundations_Tutorial.ipynb):

1. **Part 1: The Unified Theoretical Exercise (E1–E6)**
   - **E1 (Data vs. Competence):** Distinguishing episode verdicts from generalized competence claims.
   - **E2 (Physical Bounds):** Predicting fluid slosh dynamics and identifying untested freeboard margin assumptions.
   - **E3 (Warrant Gate Commitment):** Justifying the decision to *Ask* when user acceptance of an object is unconfirmed.
   - **E4 (The Five Questions of Understanding):** Formulating Explain ($\text{T1}$), Predict ($\text{T2}$), Design ($\text{T3}$), Bound ($\text{T4}$), and Check ($\text{T5}$) questions under changed physical conditions.
   - **E5 (System Decomposition):** Mapping the 7 core cognitive modules into the architectural block diagram.
   - **E6 (Transfer & Exit Ticket):** Dynamic adaptation when Eva stands up (`PAUSE_AND_REGROUND`, inertia-aware deceleration, physical failure mechanisms, and exact Warrant Gate evidence criteria).

2. **Part 2: Interactive Virtual Lab & Cognitive Architecture (Tasks 1–5)**
   - **Task 1:** System 1 Action Proposer using a bounded Gaussian distribution ($\mu = 0.40\text{ m/s}, \sigma = 0.12\text{ m/s}$) mapped to architectural blocks.
   - **Task 2:** Dual-stage non-linear contact mechanics with an exponential bottoming-out threshold ($1.8\times$) intercepting excessive gripper forces ($40.17\text{ N} > 4.5\text{ N}$).
   - **Task 3:** Fluid dynamics viscosity-temperature coupling ($1\%/^\circ\text{C}$ drop above $20^\circ\text{C}$) detecting safety slosh violations at $28^\circ\text{C}$ ($6.75\text{ mm} > 1.5\text{ mm}$).
   - **Task 4:** Extending the Warrant Gate with an `energetically_viable` 7th criterion, implementing an automatic redirection workflow to `NAVIGATE_TO_CHARGING_DOCK` under low battery.
   - **Task 5:** Post-hoc epistemic audit analyzer (`audit_analyzer`) calculating approval rates, failure breakdown, and sim-to-real force prediction variance.

3. **Part 3: Robot Anatomy**
   - Identification of mechanical and sensing hardware from the PR2 diagram (`robot-body.jpg`): links, joints, actuators, parallel-jaw gripper, wheeled base, RGB-D head camera, and base LiDAR.
   - Detailed conceptual distinctions: Links vs. Joints, Actuators vs. Sensors, Effectors vs. Bases vs. Torsos vs. Heads, Wheels vs. Legs vs. Grippers, and Proprioception vs. Exteroception vs. Interoception.
   - Concrete mapping showing how each physical component directly supports sensing, modeling, warranting, and execution in the cognitive architecture.

---

## Directory Contents

| File | Description |
| :--- | :--- |
| [`L01_Foundations_Tutorial.ipynb`](L01_Foundations_Tutorial.ipynb) | Main Jupyter notebook containing all theoretical answers, Python architecture implementations, executed outputs, and anatomy solutions. |
| [`coffee-task-photo.png`](coffee-task-photo.png) | Reference photo for the Eva coffee delivery scenario in Part 1. |
| [`robot-body.jpg`](robot-body.jpg) | Reference diagram showing the PR2 robot anatomy and sensor callouts for Part 3. |
| [`README.md`](README.md) | This documentation file. |

---

## Requirements & Execution

All Python implementations in the notebook use the standard library and do not require external third-party packages:
- Python 3.10+ (tested on Python 3.13 / 3.14)
- Standard library modules used: `json`, `math`, `random`, `dataclasses`, `typing`, `copy`, `time`

To run the notebook:
```bash
jupyter notebook L01_Foundations_Tutorial.ipynb
```
or run directly via VS Code / Jupyter Lab. All cells execute sequentially from top to bottom.
