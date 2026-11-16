# Integrated Intelligent Systems: Tutorial 2 – Body Motion Problem & URDF Modeling

**Course:** Integrated Intelligent Systems (IIS)  
**Assignment:** Tutorial 2 – Body Motion Problem (Action Designator & URDF) (3.0 Points)  
**Author:** Muhammad Uzair Baqir  

---

## Overview

This directory contains the complete submission for **Tutorial 2**. The assignment is divided into two parts (3.0 Points total):

1. **Part 1: Action Designator & The Body Motion Problem (E1–E6) (1.5 Pts)**
   - **E1 (The Gap & Whole-Course Judgment):** Explaining why nominal end-state success fails to solve the Body Motion Problem when whole-course constraints (cleanliness/spill prevention and environment restoration) are violated.
   - **E2 (Action Designator & Grounding):** Specifying working interpretation (`:substance coffee-with-milk`), inferred function/means (`:vessel-role liquid-containment-and-support`), and perceptual grounding (`:object Eva-mug-on-counter`).
   - **E3 (Commitment & Asymmetric Failure Costs):** Evaluating the 5 mm test lift against a direct high carry under uncertain surface friction (condensation on Carton A).
   - **E4 (Causal Prediction across Material Variants):** Formulating stopping rules (`:stop-when ...`) for low-viscosity ballistic flow (milk in-flight stream lag) and viscous radial spreading (pancake batter).
   - **E5 (The 7-Stage Reasoning Loop):** Tracing the slip event to `Detect & Revise`, revising grasp to bottom-support, and introducing a prerequisite regrasp transition before pouring.
   - **E6 (Conceptual Ablation & Competence):** Predicting failure cases under an ablated system without test lifts and contrasting single-run lucky success with domain-wide competence.

2. **Part 2: Kino-Dynamic Modeling with URDF / Xacro — The Domestic Assistant Robot (1.5 Pts)**
   - **Base Component (`base.xacro`):** Parameterized cylindrical pedestal base with `${base_radius}` (0.25 m) and `${base_height}` (0.30 m).
   - **Manipulator Arm (`arm.xacro`):** 3-DOF arm with parameterized `${link1_length}` (0.45 m) and `${link2_length}` (0.40 m), featuring shoulder pitch, elbow pitch, and wrist roll (for tilting/pouring).
   - **Parallel Gripper (`gripper.xacro`):** Parameterized 2-finger parallel gripper with `${gripper_span}` (0.14 m), opening wide enough to grasp the 0.10 m milk carton.
   - **Main Assembly (`robot.xacro`):** Top-level modular Xacro composing base, arm, and gripper.
   - **Standalone Model (`robot.urdf`):** Fully compiled, pure XML URDF file validated for simulation in RViz, Gazebo, PyBullet, or MuJoCo.

---

## Directory Contents

| File | Description |
| :--- | :--- |
| [`L02_Body_Motion_Problem_Tutorial.ipynb`](L02_Body_Motion_Problem_Tutorial.ipynb) | Main Jupyter notebook with all theoretical answers (E1–E6), hands-on solution, and verification code. |
| [`robot.xacro`](robot.xacro) | Top-level modular Xacro assembly for the Domestic Assistant Robot. |
| [`base.xacro`](base.xacro) | Modular Xacro macro for the robot base. |
| [`arm.xacro`](arm.xacro) | Modular Xacro macro for the 3-DOF manipulator arm. |
| [`gripper.xacro`](gripper.xacro) | Modular Xacro macro for the 2-finger parallel gripper. |
| [`robot.urdf`](robot.urdf) | Standalone, fully compiled URDF file. |
| [`urdf_background.html`](urdf_background.html) | Interactive HTML background review of URDF. |
| [`urdf_handon.html`](urdf_handon.html) | Interactive HTML specification for the drink serving robot challenge. |
| [`bmp.png`](bmp.png) | Illustration for the Body Motion Problem scenario in Part 1. |
| [`README.md`](README.md) | This documentation file. |

---

## Verification & Kinematic Envelope

```text
[world] (Fixed anchor)
   │
   ▼ [world_to_base_joint: fixed @ (0, 0, 0)]
[base_link] (Pedestal: radius=0.25 m, height=0.30 m, mass=15 kg)
   │
   ▼ [shoulder_pitch_joint: revolute around Y @ (0, 0, 0.30), limits: -1.57 to +1.57 rad]
[upper_arm_link] (Cylinder: length=0.45 m, radius=0.04 m, mass=2.5 kg)
   │
   ▼ [elbow_pitch_joint: revolute around Y @ (0, 0, 0.45), limits: -2.00 to +2.00 rad]
[forearm_link] (Cylinder: length=0.40 m, radius=0.04 m, mass=2.0 kg)
   │
   ▼ [wrist_roll_joint: revolute around Z @ (0, 0, 0.40), limits: -3.14 to +3.14 rad (pouring)]
[wrist_link]
   │
   ▼ [gripper_base_joint: fixed @ (0, 0, 0.04)]
[gripper_palm_link]
   ├── [left_finger_joint: prismatic along +Y, span: 0 to 0.07 m] ──> [left_finger_link]
   └── [right_finger_joint: prismatic along -Y, span: 0 to 0.07 m] ─> [right_finger_link]
```

- **Fridge Shelf Reach ($z = 0.40\text{ m}$):** Arm extends downwards to grasp milk carton cleanly.
- **Counter Pouring Reach ($z = 1.00\text{ - }1.05\text{ m}$):** Arm reaches comfortably above Eva's mug to pour without colliding.
- **Gripper Opening ($0.14\text{ m}$):** Exceeds $0.10\text{ m}$ carton width by $4\text{ cm}$ safety clearance.
