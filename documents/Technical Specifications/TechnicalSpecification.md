# Technical Specification for _Green City_

---

<details>
<summary>Table Of Content</summary>

## Table of Contents

- [Technical Specification for _Green City_](#technical-specification-for-green-city)
  - [Table of Contents](#table-of-contents)
  - [I. Introduction](#i-introduction)
  - [II. Game Architecture](#ii-game-architecture)
    - [1. Core Systems Design](#1-core-systems-design)
      - [a. Building Placement Logic](#a-building-placement-logic)
      - [b. Resource Management](#b-resource-management)
    - [2. Pollution Tracking System](#2-pollution-tracking-system)
      - [a. Overview](#a-overview)
      - [b. Features](#b-features)
    - [c. Example Code](#c-example-code)
    - [3. Gameplay Loop and State Management](#3-gameplay-loop-and-state-management)
      - [a. Finite State Machine](#a-finite-state-machine)
    - [4. Win/Lose Conditions](#4-winlose-conditions)
  - [III. User Interface Implementation](#iii-user-interface-implementation)
    - [1. Dashboard Design](#1-dashboard-design)
    - [2. Accessibility Features](#2-accessibility-features)
  - [IV. Tools, Libraries, and File Architecture](#iv-tools-libraries-and-file-architecture)
    - [1. Tools and Libraries](#1-tools-and-libraries)
    - [2. File Architecture](#2-file-architecture)
    - [3. Detailed Explanation of File Architecture](#3-detailed-explanation-of-file-architecture)
      - [Assets Directory](#assets-directory)
      - [Scenes Directory](#scenes-directory)
      - [Scripts Directory](#scripts-directory)
      - [Tests Directory](#tests-directory)
      - [Docs Directory](#docs-directory)
    - [4. Guidelines for Expansion](#4-guidelines-for-expansion)
  - [V. Testing Strategy](#v-testing-strategy)
    - [1. Unit Testing](#1-unit-testing)
    - [2. Integration Testing](#2-integration-testing)
    - [3. End-to-End Testing](#3-end-to-end-testing)
    - [4. Automation in Testing](#4-automation-in-testing)
  - [VI. Development Workflow](#vi-development-workflow)
  - [VII. Timeline and Milestones](#vii-timeline-and-milestones)
  - [VIII. Optimizing Performance for Larger City Grids and Complex Simulations](#viii-optimizing-performance-for-larger-city-grids-and-complex-simulations)
  - [IX. In-Game Tutorial System](#ix-in-game-tutorial-system)
    - [Objective](#objective)
    - [Features](#features)
    - [Implementation Plan](#implementation-plan)
  - [X. Reward System and Achievements](#x-reward-system-and-achievements)
    - [Objective](#objective-1)
    - [Features](#features-1)
    - [Implementation](#implementation)
  - [XI. Dynamic Weather Effects](#xi-dynamic-weather-effects)
    - [Objective](#objective-2)
    - [Features](#features-2)
    - [Implementation](#implementation-1)
  - [XII. Save/Load System](#xii-saveload-system)
    - [Objective](#objective-3)
    - [Features](#features-3)
    - [Implementation](#implementation-2)
  - [XIV. Building Animations and UI Transitions](#xiv-building-animations-and-ui-transitions)
    - [Objective](#objective-4)
    - [Features](#features-4)
    - [Implementation](#implementation-3)
  - [XV. Glossary](#xv-glossary)

</details>

---

## I. Introduction

This technical specification defines the architecture and implementation plan for _Green City_, an educational city-building game that explores sustainability. The game is developed using **Godot Engine (v4.3)** and emphasizes modular, scalable design. This document translates functional requirements into actionable technical details and includes a roadmap for development and testing.

---

## II. Game Architecture

### 1. Core Systems Design

#### a. Building Placement Logic

- **Purpose**: Allow players to place, upgrade, and remove buildings on a city grid.
- **Implementation**:
  - Use a `TileMap` node to represent the city grid.
  - Each building type has associated metadata, including cost, pollution impact, and resource consumption.
  - Validate placement based on tile availability and player resources.
- **Building Removal**:
  - Deduct energy for demolition.
  - Refund a portion of resources.
- **Example Code**:
  ```gdscript
  func place_building(position: Vector2, building_type: String):
      if tilemap.get_cellv(position) == -1 and resources_available(building_type):
          tilemap.set_cellv(position, building_id)
          update_resources(building_type)
          emit_signal("building_placed", position)
  ```

#### b. Resource Management

- **Singleton Design**: `ResourceManager.gd` manages:
  - Renewable and non-renewable energy.
  - Financial resources.
  - Pollution levels.
- **Dynamic Updates**:
  - Resource and pollution levels are recalculated when buildings are placed or removed.
- **Signal-Based UI Updates**:
  - Example:
    ```gdscript
    func update_resources(building_type: String):
        match building_type:
            "solar":
                renewable_energy -= 10
            "coal":
                non_renewable_energy -= 20
                pollution += 15
        emit_signal("resources_updated")
    ```

---

### 2. Pollution Tracking System

#### a. Overview

Tracks the total pollution caused by player actions, visualized using the pollution bar and city aesthetics.

#### b. Features

- **Global Pollution Manager**: Aggregates pollution data.
- **Feedback**:
  - Changes the appearance of the city (e.g., smog effects).
  - Displays real-time pollution levels on the dashboard.

### c. Example Code

```gdscript
func calculate_total_pollution():
    total_pollution = sum(building.pollution for building in active_buildings)
    emit_signal("pollution_updated", total_pollution)
```

---

### 3. Gameplay Loop and State Management

#### a. Finite State Machine

- **States**:
  - `BUILD`: Place or remove buildings.
  - `SIMULATE`: Process environmental and economic effects.
  - `EVALUATE`: Reflect on success or failure.
- **Transitions**:
  - Signals trigger transitions between states.
- **Example Code**:
  ```gdscript
  func switch_state(new_state: String):
      current_state = new_state
      emit_signal("state_changed", new_state)
  ```

---

### 4. Win/Lose Conditions

- **Win Condition**:
  - Maintain pollution below thresholds for five in-game years.
  - Sustain energy and financial goals.
- **Lose Condition**:
  - Pollution exceeds critical levels, or resources are depleted.

---

## III. User Interface Implementation

### 1. Dashboard Design

- **Key Components**:
  - Energy, finances, and pollution indicators.
  - Hover tooltips for detailed building stats.
- **Dynamic Feedback**:
  - Signals update UI elements based on game state.

### 2. Accessibility Features

- Adjustable text sizes.
- Colorblind-friendly color schemes.

---

## IV. Tools, Libraries, and File Architecture

### 1. Tools and Libraries

- **Godot Engine**: Open-source engine for 2D/3D games.
- **GDScript**: Lightweight, Python-like scripting language.
- **Kenney Assets**: Free asset library for placeholders.

### 2. File Architecture

```text
GreenCity/
├── Assets/
│   ├── Graphics/
│   ├── Audio/
│   └── Fonts/
├── Scenes/
│   ├── UI/
│   │   ├── Dashboard.tscn
│   │   └── ContextMenus.tscn
│   ├── Game/
│   │   ├── MainScene.tscn
│   │   └── TileMap.tscn
├── Scripts/
│   ├── Core/
│   │   ├── ResourceManager.gd
│   │   ├── PollutionManager.gd
│   │   └── GameStateManager.gd
│   ├── UI/
│   │   ├── Dashboard.gd
│   │   └── ContextMenu.gd
│   └── Gameplay/
│       ├── Building.gd
│       └── CityLogic.gd
├── Tests/
│   ├── Unit/
│   ├── Integration/
│   └── EndToEnd/
├── Docs/
│   ├── FunctionalSpecification.md
│   └── TechnicalSpecification.md
```

---

### 3. Detailed Explanation of File Architecture

The file architecture ensures modularity and maintainability by categorizing assets, scenes, scripts, and documentation into distinct directories. Each section has a specific purpose:

#### Assets Directory

- **Purpose**: Contains all graphical, audio, and font files used in the game.
- **Structure**:
  - `Graphics/`: Stores image files, including sprites and UI elements.
  - `Audio/`: Includes sound effects and background music.
  - `Fonts/`: Holds font files for text-based UI elements.

#### Scenes Directory

- **Purpose**: Houses all Godot scene files (`.tscn`), representing the game’s UI, game world, and mechanics.
- **Structure**:
  - `UI/`: Contains user interface scenes like `Dashboard.tscn` and `ContextMenus.tscn`.
  - `Game/`: Stores primary game scenes, such as the `MainScene.tscn` (entry point) and `TileMap.tscn` (grid-based game area).

#### Scripts Directory

- **Purpose**: Stores all scripts used for game logic, organized into functional categories for clarity.
- **Structure**:
  - `Core/`: Contains essential scripts for game state and resource management, including:
    - `ResourceManager.gd`: Tracks energy, finances, and pollution levels.
    - `PollutionManager.gd`: Manages pollution calculations and visual feedback.
    - `GameStateManager.gd`: Implements the finite state machine for game flow.
  - `UI/`: Includes scripts for UI behavior and interactivity, such as:
    - `Dashboard.gd`: Updates dashboard components with real-time data.
    - `ContextMenu.gd`: Handles contextual menus for building interactions.
  - `Gameplay/`: Holds scripts for gameplay mechanics, such as:
    - `Building.gd`: Manages building attributes and actions.
    - `CityLogic.gd`: Contains core logic for city management.

#### Tests Directory

- **Purpose**: Includes unit, integration, and end-to-end test cases for verifying game functionality.
- **Structure**:
  - `Unit/`: Tests individual modules, such as resource and pollution managers.
  - `Integration/`: Validates interactions between components, like building placement and resource updates.
  - `EndToEnd/`: Simulates complete gameplay scenarios to ensure a seamless experience.

#### Docs Directory

- **Purpose**: Stores all project documentation, ensuring easy reference for developers and stakeholders.
- **Structure**:
  - `FunctionalSpecification.md`: Details the functional requirements of the game.
  - `TechnicalSpecification.md`: Provides the technical implementation plan.

---

### 4. Guidelines for Expansion

The file structure is designed to accommodate future enhancements. Developers should adhere to the following principles when adding new files or features:

1. **Categorize**: Place new files in the appropriate directory based on functionality.
2. **Reuse**: Leverage existing scripts and scenes to minimize redundancy.
3. **Document**: Update the documentation in the `Docs/` folder to reflect changes or additions.
4. **Testing**: Ensure all new features are accompanied by relevant test cases in the `Tests/` directory.

---

## V. Testing Strategy

### 1. Unit Testing

- **Objective**: Validate the functionality of individual scripts, such as `ResourceManager.gd` and `PollutionManager.gd`.
- **Example Test**:

  ```gdscript
  extends "res://addons/Gut/test.gd"

  func test_pollution_calculation():
      var pollution_manager = PollutionManager.new()
      pollution_manager.add_pollution(10)
      pollution_manager.add_pollution(20)
      assert_eq(pollution_manager.total_pollution, 30, "Pollution calculation failed")
  ```

### 2. Integration Testing

- **Objective**: Test interactions between components, ensuring that changes in one system (e.g., building placement) reflect correctly in others (e.g., resource updates).
- **Example Scenario**:
  - Place a building.
  - Verify that resources are deducted and the pollution bar updates.

### 3. End-to-End Testing

- **Objective**: Simulate complete gameplay scenarios to identify potential issues in the user experience.
- **Example Workflow**:
  - Start the game.
  - Place various buildings.
  - Monitor energy, finances, and pollution levels.
  - Trigger win/lose conditions and validate outcomes.

---

### 4. Automation in Testing

- **Tools**: Use GDUnit for automated testing of GDScript code.
- **Continuous Integration**:
  - Integrate tests with GitHub Actions to automate test execution on each commit.

---

## VI. Development Workflow

1. **Version Control**:

   - Use GitHub for source control.
   - Branching Strategy:
     - `main`: Stable, production-ready code.
     - `dev`: Active development branch.
     - Feature branches: For individual features or fixes.

2. **Coding Standards**:

   - Use `snake_case` for variables and functions.
   - Use `PascalCase` for class names.
   - Include comments for methods and significant logic.

3. **CI/CD Pipeline**:
   - **Testing**: Automatically run unit and integration tests on new commits.
   - **Deployment**: Use Godot’s export templates for platform-specific builds.

---

## VII. Timeline and Milestones

| Phase                 | Deadline | Deliverables                         |
| --------------------- | -------- | ------------------------------------ |
| Technical Spec        | 11/29    | Complete technical documentation     |
| Prototype Development | 12/06    | Core game loop and UI integration    |
| MVP Completion        | 12/13    | Key mechanics and resource balancing |
| QA and Final Delivery | 12/20    | Fully tested and polished product    |

---

## VIII. Optimizing Performance for Larger City Grids and Complex Simulations

As the complexity of the game increases with larger city grids or intricate simulations, performance optimization becomes crucial. Below are strategies to ensure the game remains efficient and responsive:

1. **Efficient Data Structures**:

   - Use lightweight and scalable data structures for managing city elements, such as hash maps for quick lookups of buildings and zones.

   ```gdscript
   # Example: Using a dictionary for efficient building management
   var buildings = {}

   func add_building(id: int, building_data: Dictionary):
       buildings[id] = building_data

   func get_building(id: int) -> Dictionary:
       return buildings.get(id, null)
   ```

2. **Resource Prioritization**:
   - Prioritize rendering only visible sections of the city grid to reduce computational load.

```gdscript
# Example: Culling non-visible city sections
func update_visible_grid(viewport_rect: Rect2):
  for cell_position in city_grid.keys():
      if viewport_rect.has_point(cell_position):
          show_cell(cell_position)
      else:
          hide_cell(cell_position)
```

- Implement level-of-detail (LOD) techniques to render objects at varying levels of detail based on distance from the camera.

1. **Parallel Processing**:

   - Offload computationally intensive tasks (e.g., pollution simulation or traffic pathfinding) to separate threads or cores if supported by the platform.

```gdscript
# Example: Running pathfinding on a separate thread
var pathfinding_thread = Thread.new()

func start_pathfinding():
    pathfinding_thread.start(self, "_calculate_paths", traffic_data)

func _calculate_paths(data):
    # Pathfinding logic
    pass

```

2. **Dynamic Updates**:

   - Update game state in smaller increments rather than attempting to compute everything in a single frame.

3. **Performance Testing and Profiling**:
   - Regularly test and profile the game for bottlenecks using performance analysis tools.
   - Optimize critical sections of the code to reduce resource consumption.

---

## IX. In-Game Tutorial System

### Objective

The tutorial system aims to guide players through the mechanics and gameplay practices, ensuring a smooth onboarding experience.

### Features

1. **Interactive Walkthrough**:

   - The tutorial provides step-by-step guidance for essential gameplay elements, such as zoning areas, managing resources, and controlling pollution.

```gdscript
# Example: Highlighting UI elements during the tutorial
func highlight_element(ui_element: Control):
    ui_element.add_color_override("font_color", Color(1, 0, 0)) # Red highlight

```

2. **Contextual Tips**:

   - Display tooltips dynamically based on player actions or when they hover over game elements.

```gdscript
# Example: Showing contextual tooltips
func show_tooltip(message: String, position: Vector2):
    var tooltip = Tooltip.new()
    tooltip.text = message
    tooltip.position = position
    add_child(tooltip)

```

3. **Progressive Learning**:
   - Introduce mechanics progressively as players advance in the game, ensuring they are not overwhelmed.

### Implementation Plan

1. Use a finite state machine (FSM) to track the player's progress through the tutorial stages.
2. Include visual cues (e.g., highlighting buttons or zones) to direct player attention.

---

## X. Reward System and Achievements

### Objective

The reward system encourages player engagement by setting concrete goals and milestones.

### Features

1. **Achievements**:

   - Example: "Low Pollution for 5 Years," "1000 Population Milestone," etc.
   - Achievements unlock badges and in-game rewards.

```gdscript
# Example: Achievement system
var achievements = {"low_pollution_5_years": false}

func unlock_achievement(name: String):
    if name in achievements:
        achievements[name] = true
        display_achievement(name)

```

2. **Dynamic Feedback**:

   - Display rewards and achievements prominently to motivate players.

3. **Milestone Notifications**:
   - Notify players of significant achievements with pop-ups or animations.

```gdscript
# Example: Milestone notification
func display_achievement(name: String):
    print("Achievement unlocked: %s" % name)

```

### Implementation

1. Maintain a tracking system to monitor conditions for unlocking achievements.
2. Use the UI layer to display rewards and badges.

---

## XI. Dynamic Weather Effects

### Objective

Dynamic weather (e.g., rain, fog) enhances gameplay immersion and affects pollution levels.

### Features

1. **Visual Effects**:

   - Rain and fog animations for aesthetic enhancement.
   - Weather transitions based on in-game conditions.

```gdscript
# Example: Weather transition
func set_weather(weather_type: String):
    if weather_type == "rain":
        enable_rain_effect()
    elif weather_type == "fog":
        enable_fog_effect()

```

2. **Gameplay Impact**:
   - Rain reduces pollution temporarily but increases traffic slowdowns.
   - Fog decreases visibility, affecting traffic efficiency.

```gdscript
# Example: Adjusting gameplay impact based on weather
func adjust_pollution(weather_type: String):
    if weather_type == "rain":
        pollution_level *= 0.9  # 10% reduction

```

### Implementation

1. Implement particle systems for rain and fog effects.
2. Use a weather simulation module to control transitions and their impact.

---

## XII. Save/Load System

### Objective

The save/load system allows players to preserve their progress and resume gameplay at a later time.

### Features

1. **Auto-Save**:

   - Save game state automatically at regular intervals or upon completing key actions.

2. **Manual Save/Load**:

   - Provide players with the option to save/load from multiple slots.

3. **Compatibility**:
   - Ensure save files are version-compatible with future updates.

### Implementation

1. Serialize game state (city layout, player progress, achievements) into a save file.
2. Implement a robust save/load manager to handle file operations.

```gdscript
# Example: Save and load system
func save_game(file_path: String):
    var save_data = {"buildings": buildings, "resources": resources}
    var file = File.new()
    file.open(file_path, File.WRITE)
    file.store_var(save_data)
    file.close()

func load_game(file_path: String):
    var file = File.new()
    if file.file_exists(file_path):
        file.open(file_path, File.READ)
        var save_data = file.get_var()
        file.close()
        apply_save_data(save_data)

```

---

## XIV. Building Animations and UI Transitions

### Objective

Enhance the user experience through smooth animations and transitions.

### Features

1. **Building Construction Animations**:

   - Animate the building process to provide visual feedback when players place structures.

```gdscript
# Example: Building construction animation
func animate_building_construction(building: Sprite):
    var tween = Tween.new()
    add_child(tween)
    tween.interpolate_property(building, "scale", Vector2(0, 0), Vector2(1, 1), 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
    tween.start()

```

2. **UI Transitions**:

   - Use fade-ins, slide-ins, and other transitions for menus and notifications.

```gdscript
# Example: Sliding menu transition
func slide_in_menu(menu: Control):
    menu.rect_position.x = -menu.rect_size.x
    menu.visible = true
    menu.move_local_x(menu.rect_size.x, 0.5, Tween.TRANS_LINEAR, Tween.EASE_OUT)

```

3. **Real-Time Feedback**:
   - Display dynamic effects, such as progress bars, during ongoing actions.

### Implementation

1. Leverage animation libraries or custom scripts for smooth transitions.
2. Optimize animations to minimize performance impact.

## XV. Glossary

- **Godot Engine**: A cross-platform, open-source game engine for 2D and 3D projects.
- **TileMap**: A node in Godot that facilitates grid-based layouts for games.
- **Singleton**: A design pattern where a script or node is globally accessible across the game.
- **GDScript**: Godot’s native scripting language, resembling Python, for implementing game logic.
- **Finite State Machine (FSM)**: A model for managing states and transitions, ensuring structured game flow.
- **Pollution Manager**: A system script that tracks, aggregates, and visualizes pollution metrics based on player actions.
- **Resource Manager**: A centralized system managing resources like energy, finances, and pollution.
- **Progress Bar**: A UI element used to display numerical data as a visual gauge.
- **GDUnit**: A testing framework for GDScript, enabling unit and integration tests.
- **Continuous Integration (CI)**: A development practice where automated tests run frequently to ensure code stability.

---
