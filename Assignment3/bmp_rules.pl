% ============================================================================
% Integrated Intelligent Systems - Tutorial 3: Body Motion Problem (BMP)
% Knowledge Base Rules (Prolog / Description Logic Grounding)
% ============================================================================

% ----------------------------------------------------------------------------
% 1. Task Requests -> Desired Discrete State Changes (E7, E10)
% ----------------------------------------------------------------------------
taskRequest(open_fridge, open(fridge)).
taskRequest(close_fridge, closed(fridge)).
taskRequest(open_drawer_sink, open(drawer_sink)).
taskRequest(close_drawer_sink, closed(drawer_sink)).
taskRequest(open_drawer_oven, open(drawer_oven)).

% General category request matching any opening state change (E10)
taskRequest(open_anything, StateChange) :-
    taskRequest(SpecificRequest, StateChange),
    SpecificRequest \= open_anything,
    StateChange = open(_).

% ----------------------------------------------------------------------------
% 2. Causal Motion Rules: State Changes <- Parameterized Motions (E8, E11)
%    MotionParam = [TargetAngleRad, EnvironmentJoint, GraspHandle]
% ----------------------------------------------------------------------------
causes(envJointGoal, open(fridge),       [0.8,  'fridge_door_joint',       'fridge_door_handle']).
causes(envJointGoal, closed(fridge),     [0.0,  'fridge_door_joint',       'fridge_door_handle']).
causes(envJointGoal, open(drawer_sink),  [0.45, 'sink_drawer_top_joint',   'sink_drawer_top_handle']).
causes(envJointGoal, closed(drawer_sink),[0.0,  'sink_drawer_top_joint',   'sink_drawer_top_handle']).
causes(envJointGoal, open(drawer_oven),  [0.4,  'oven_drawer_joint',       'oven_drawer_handle']).

% ----------------------------------------------------------------------------
% 3. Robot Capability Constraints: Hardware Feasibility Filter (E9)
% ----------------------------------------------------------------------------
robot(pr2).
hasKinematicChain(pr2, left_arm_chain).
hasKinematicChain(pr2, right_arm_chain).
hasEndEffector(pr2, parallel_gripper).

reachableWorkspace(pr2, 'fridge_door_handle').
reachableWorkspace(pr2, 'sink_drawer_top_handle').
reachableWorkspace(pr2, 'oven_drawer_handle').

withinJointLimits('fridge_door_joint', 0.8).
withinJointLimits('fridge_door_joint', 0.0).
withinJointLimits('sink_drawer_top_joint', 0.45).
withinJointLimits('sink_drawer_top_joint', 0.0).
withinJointLimits('oven_drawer_joint', 0.4).

canPerform(Robot, envJointGoal, [TargetAngle, Joint, Handle]) :-
    robot(Robot),
    hasEndEffector(Robot, parallel_gripper),
    reachableWorkspace(Robot, Handle),
    withinJointLimits(Joint, TargetAngle).
