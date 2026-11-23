# Integrated Intelligent Systems: Tutorial 3 – Body Motion Problem (Scientific Object)

**Course:** Integrated Intelligent Systems (IIS)  
**Assignment:** Tutorial 3 – Body Motion Problem (Scientific Object & Description Logics) (3.0 Points)  
**Author:** Muhammad Uzair Baqir  

---

## Overview

This directory contains the complete submission for **Tutorial 3**. The assignment is divided into two parts (3.0 Points total):

1. **Part 1: Robot-World Manipulation System as Scientific Object (E1–E6) (1.5 Pts)**
   - **E1 (Architectural Cut & Subsystem Separation):** Explaining the strict boundary between the Manipulation Executive (`dul:Agent`, controlling subsystem: *reads · decides · commits*) and the coupled Body-World System $[B \bowtie W]$ (`dul:PhysicalObject`, controlled subsystem), interacting exclusively via **action tokens** and **observations**.
   - **E2 (Forward-Branching Time & World Choices):** Visualizing and explaining the forward-branching state tree of physical courses from initial state $x_0$ under non-deterministic **world choices** (seal releases vs. seal holds/slips vs. handle tears).
   - **E3 (Trajectory Classification & Priority Hierarchies):** Grading trajectories under the Problem Standard $P$ (**PROH > NON > REPD > SOL**), classifying Run A (`PROH`, `P4` violation) and Run B (`SOL` / `REPD`), and explaining why full courses are evaluated rather than only end-states.
   - **E4 (Description Logic Partonomy & DUL Constraints):** Explaining how `RWMS = (=1 hasComponent.ManipExecutive) ⊓ (=1 hasComponent.BodyWorldSystem)` and the transitivity of `dul:isPartOf` enable **HermiT** to automatically entail that the PR2's head camera is part of the RWMS.
   - **E5 (Ontological Inconsistency & Entailment Limits):** Formulating a competency question that triggers an ontological inconsistency (`dul:Description ⊓ dul:PhysicalObject ⊑ ⊥`) when classifying the manipulation problem $P$ as a physical component inside $[B \bowtie W]$, and explaining why continuous nonlinear laws like Coulomb friction ($2 \cdot \mu \cdot F \ge m \cdot (g + a)$) are evaluated by the Semantic Digital Twin's causal dynamics model outside DL.
   - **E6 (Strength vs. Truth in Agent Validation):** Comparing the logical **strength** of $\text{K}_0$ (without friction law) vs. $\text{K}_1/\text{K}_2$ (with explicit static/dynamic friction laws) on competency queries, and validating physical **truth** through empirical physical experiments.

2. **Part 2: Robot Motion Problem and Description Logics (E7–E12) (1.5 Pts)**
   - **E7 (Knowledge Base Grounding & Task Requests):** Executing `taskRequest(Request, StateChange).` to map abstract requests (`'open_fridge'`, drawer tasks, `'open_anything'`) to symbolic world state changes (`'open(fridge)'`).
   - **E8 (Extending Queries for Causal Motions & Parameters):** Joining `causes(Motion, StateChange, MotionParam).` to bridge symbolic state changes and continuous Giskard motion parameters (`'envJointGoal'`, `[0.8, b'fridge_door_joint', b'fridge_door_handle']`).
   - **E9 (Integrating Robot Capabilities — `canPerform`):** Adding `canPerform(Robot, Motion, MotionParam).` with `Robot = 'pr2'` to filter candidate trajectories against the robot's kinematic chains, gripper compatibility, and workspace reachability.
   - **E10 (Specializing Request Scope — `open_fridge` vs. `open_anything`):** Pruning the SLD/DL search tree via early unification on `'open_fridge'` to prevent unintended state changes on other kitchen containers.
   - **E11 (Visualization and Simulation Linkage in RViz):** Tracing how `[0.8, b'fridge_door_joint', b'fridge_door_handle']` is resolved via TF/URDF, optimized as a whole-body continuous motion problem in **Giskard**, and executed in RViz (`bmp.rviz`).
   - **E12 (Ontological Limits & Missing Dynamics):** Explaining why symbolic DL/Prolog reasoning cannot verify wet-carton slip dynamics and identifying the Semantic Digital Twin physics simulator and real-time force/tactile feedback controller as the responsible subsystems.

---

## Directory Contents

| File | Description |
| :--- | :--- |
| [`L03_Body_Motion_Problem_Tutorial.ipynb`](L03_Body_Motion_Problem_Tutorial.ipynb) | Main Jupyter notebook containing all questions and student answers for Part 1 (E1–E6) and Part 2 (E7–E12). |
| [`RWMS.png`](RWMS.png) | Diagram of the Robot-World Manipulation System (Controlling Subsystem, Architectural Cut, and Controlled Body-World System $[B \bowtie W]$). |
| [`E2_course_tree.png`](E2_course_tree.png) | State-transition tree diagram for E2 showing forward-branching physical courses from $x_0$ under world and agent choices. |
| [`PR2.png`](PR2.png) | RViz simulation screenshot of the PR2 robot interacting with the fridge door handle in the EASE kitchen environment. |
| [`bmp_rules.pl`](bmp_rules.pl) | Prolog / Description Logic knowledge base rules (`taskRequest/2`, `causes/3`, `canPerform/3`). |
| [`README.md`](README.md) | This documentation file. |
