# Complete Technical Specification Document for *Green City*

---

## Table of Contents
<details>
<summary>Click to expand</summary>

- [Complete Technical Specification Document for *Green City*](#complete-technical-specification-document-for-green-city)
  - [Table of Contents](#table-of-contents)
  - [I. Technical Goals and Approach](#i-technical-goals-and-approach)
    - [1. Translating Functional Requirements into Technical Tasks](#1-translating-functional-requirements-into-technical-tasks)
    - [2. High-Level Architecture](#2-high-level-architecture)
  - [II. Game Architecture](#ii-game-architecture)
    - [1. Core Systems Design](#1-core-systems-design)
      - [a. Building Placement Logic](#a-building-placement-logic)
      - [b. Resource Management](#b-resource-management)
    - [2. Pollution Tracking System](#2-pollution-tracking-system)
    - [3. Gameplay Loop and State Management](#3-gameplay-loop-and-state-management)
    - [4. Win/Lose Conditions](#4-winlose-conditions)
  - [III. User Interface Implementation](#iii-user-interface-implementation)
    - [1. UI Framework and Integration](#1-ui-framework-and-integration)
      - [a. Dashboard Design](#a-dashboard-design)
      - [b. Contextual Menus and Feedback Mechanisms](#b-contextual-menus-and-feedback-mechanisms)
    - [2. Accessibility Features](#2-accessibility-features)
  - [IV. Development Workflow and Pipeline](#iv-development-workflow-and-pipeline)
    - [1. Repository Structure](#1-repository-structure)
    - [2. CI/CD Integration](#2-cicd-integration)
  - [V. Tools, Libraries, and Standards](#v-tools-libraries-and-standards)
    - [1. Overview of Tools](#1-overview-of-tools)
      - [a. Godot Engine](#a-godot-engine)
      - [b. GDScript Overview](#b-gdscript-overview)
    - [2. Supporting Tools](#2-supporting-tools)
    - [3. Coding Standards and Conventions](#3-coding-standards-and-conventions)
  - [VI. Advanced Game Systems](#vi-advanced-game-systems)
    - [1. Pollution Dynamics and Calculation](#1-pollution-dynamics-and-calculation)
    - [2. Resource Balancing Algorithms](#2-resource-balancing-algorithms)
  - [VII. Localization Strategy](#vii-localization-strategy)
  - [VIII. Testing and Debugging Framework](#viii-testing-and-debugging-framework)
    - [1. Unit Testing Plan](#1-unit-testing-plan)
    - [2. Integration Testing Plan](#2-integration-testing-plan)
  - [IX. Timeline and Milestones](#ix-timeline-and-milestones)
  - [X. Glossary](#x-glossary)
    - [Key Terms](#key-terms)

</details>

---

## I. Technical Goals and Approach

### 1. Translating Functional Requirements into Technical Tasks

The functional requirements define **what** the game must achieve, while this document explains **how** to build it technically.

- **Buildings**: Each building will be represented as a scene with predefined attributes (e.g., type, pollution impact, resource cost). These buildings will be dynamically placed and managed during gameplay.
- **Pollution System**: Implemented as a singleton (`PollutionManager.gd`) that collects data from all active buildings and updates visual and mechanical feedback in real-time.
- **Gameplay Feedback**: Real-time updates via Godot's signal system, ensuring UI elements like pollution bars and resource dashboards reflect the player's decisions dynamically.

---

### 2. High-Level Architecture

- **Node-based Structure**: All game elements are represented as nodes in Godot, with a hierarchical organization for modularity and reusability.
- **Scenes and Prefabs**: Buildings, UI elements, and game logic components will be organized into separate scenes, instantiated dynamically as required.
- **Signals**: Event-driven communication between nodes to trigger UI updates, game state transitions, and gameplay effects.
- **Global Systems**:
  - **ResourceManager**: Handles global resources like energy, finances, and pollution limits.
  - **GameStateManager**: Manages game states (e.g., `BUILD`, `SIMULATE`, `EVALUATE`).

---

## II. Game Architecture

### 1. Core Systems Design

#### a. Building Placement Logic
- **Grid Management**: Use Godot's `TileMap` node to manage the city grid, ensuring efficient placement and removal of buildings.
- **Placement Rules**:
  - Validate if the tile is empty and the player has enough resources.
  - Dynamically deduct resources and update pollution after placement:
    ```gdscript
    func place_building(position: Vector2, building_type: String):
        if tilemap.get_cellv(position) == -1 and resources_available(building_type):
            tilemap.set_cellv(position, building_id)
            update_resources(building_type)
            emit_signal("building_placed", position)
    ```
- **Building Removal**:
  - Allow players to demolish buildings and refund partial resources.

---

#### b. Resource Management
- **Singleton Implementation**: `ResourceManager.gd` manages all resource-related calculations, including energy usage, finances, and pollution.
- **Dynamic Updates**: Resources are updated when buildings are placed or removed:
    ```gdscript
    func update_resources(building_type: String):
        if building_type == "solar":
            renewable_energy -= 10
        elif building_type == "coal":
            non_renewable_energy -= 20
            pollution += 15
    ```
- **Tracking UI**: Emit signals to update dashboard components like energy meters and pollution bars.

---

### 2. Pollution Tracking System
- **Global Pollution Data**: Aggregate pollution levels from all active buildings using a signal-driven approach.
- **Feedback Mechanisms**:
  - Update pollution bar:
    ```gdscript
    func update_pollution_bar():
        PollutionBar.value = total_pollution
    ```
  - Trigger visual effects like smog overlays when thresholds are reached.

---

### 3. Gameplay Loop and State Management
- **Finite State Machine**: Implemented in `GameStateManager.gd` with defined states like `BUILD`, `SIMULATE`, and `EVALUATE`.
- **State Transitions**: Signals are used to transition between states and update relevant game logic.

---

### 4. Win/Lose Conditions
- **Win Condition**: Maintain pollution below critical levels and meet energy requirements for a specified period.
- **Lose Condition**: Exceed pollution thresholds for too long, causing the city to collapse.

---

## III. User Interface Implementation

### 1. UI Framework and Integration

#### a. Dashboard Design
- **Metrics Display**: Energy levels, finances, and pollution are displayed using `Label` and `ProgressBar` nodes.
- **Real-time Updates**: Signal-based updates from resource and pollution managers.

#### b. Contextual Menus and Feedback Mechanisms
- **Building Context Menus**:
  - Right-click menus provide options like upgrading or demolishing buildings.
- **Tooltip Feedback**:
  - Hover over buildings to display stats like pollution impact and energy cost.

---

### 2. Accessibility Features
- **Adjustable Text Sizes**: Modify font sizes using theme files.
- **Colorblind-Friendly Palettes**: Apply shaders or alternate color schemes.

---

## IV. Development Workflow and Pipeline

### 1. Repository Structure

'''
GreenCity/
├── Assets/
├── Scenes/
├── Scripts/
├── Docs/
└── Tests/
'''
### 2. CI/CD Integration
- **Automated Testing**: Use GDUnit for unit tests on each commit.
- **Deployment**: Export to supported platforms using GitHub Actions.

---

## V. Tools, Libraries, and Standards

### 1. Overview of Tools

#### a. Godot Engine
- Open-source game engine ideal for 2D projects.
- Node-based structure for modular design.

#### b. GDScript Overview
- Python-like scripting language for Godot, optimized for game logic.

---

### 2. Supporting Tools
- **GDUnit**: For unit and integration testing.
- **Kenney Assets**: Free placeholders for rapid prototyping.

---

### 3. Coding Standards and Conventions
- **Naming**: Use `snake_case` for variables and `PascalCase` for class names.
- **Comments**: Document all methods and important logic blocks.

---

## VI. Advanced Game Systems

### 1. Pollution Dynamics and Calculation
- Calculate pollution as a weighted average of all buildings.

---

### 2. Resource Balancing Algorithms
- Dynamic algorithms for balancing energy production and pollution control.

---

## VII. Localization Strategy
- Store text in JSON files for multi-language support.

---

## VIII. Testing and Debugging Framework

### 1. Unit Testing Plan
- Isolated tests for pollution and resource managers.

---

### 2. Integration Testing Plan
- Validate end-to-end workflows, e.g., placing a building and updating the UI.

---

## IX. Timeline and Milestones
| Phase              | Deadline | Deliverables                         |
|--------------------|----------|--------------------------------------|
| Technical Spec     | 11/29    | Finalized document and repo setup    |
| Prototype          | 12/06    | Game loop and UI integration         |
| MVP Implementation | 12/13    | Core systems and resource balancing  |
| QA and Delivery    | 12/20    | Final build and testing              |

---

## X. Glossary

### Key Terms
- **Godot Engine**: Game development engine used for 2D/3D projects.
- **GDScript**: Python-like language for Godot.
- **TileMap**: A grid-based system for placing objects.
- **Singleton**: A global, persistent node for shared data.

---