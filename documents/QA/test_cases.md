# Test Cases

[Google sheet](https://docs.google.com/spreadsheets/d/1o72AQQnd1AdfZWMCfOFAuP_46ZYQdUdQIkkkEWEdWik/edit?gid=0#gid=0)

## Overview

### Gameplay Test Cases

| Test Case ID | 001 |
| --- | --- |
| Name | Validate Building Placement on Invalid Tiles |
| Description | Ensure players cannot place buildings on invalid tiles (e.g., water, existing buildings). |
| Pre-conditions | Select a building and attempt placement on an invalid tile. |
| Steps | 1. Select a building. <br> 2. Attempt to place it on water or an already occupied tile. |
| Expected Result | Placement is denied with appropriate feedback. |
| Importance | High |

<br>

| Test Case ID | 002 |
| --- | --- |
| Name | Verify Resource Deduction on Building Placement |
| Description | Check if resources are deducted correctly after building placement. |
| Pre-conditions | Have enough resources to place a building. |
| Steps | 1. Place a building. <br> 2. Check the resource count. |
| Expected Result | Resources are deducted as per building cost. |
| Importance | High |

<br>

| Test Case ID | 003 |
| --- | --- |
| Name | Validate Resource Production by Buildings |
| Description | Ensure resource-producing buildings (e.g., wind turbines) generate resources correctly. |
| Pre-conditions | Place a resource-producing building. |
| Steps | 1. Monitor resource production for 5 game minutes. <br> 2. Confirm production matches expected rates. |
| Expected Result | Resource production matches expected rates. |
| Importance | Medium |

<br>

| Test Case ID | 004 |
| --- | --- |
| Name | Test Resource Alerts for Shortages |
| Description | Ensure the game notifies the player when resources are critically low. |
| Pre-conditions | Have resources deplete below the critical threshold. |
| Steps | 1. Build resource-draining structures. <br> 2. Observe alerts or warnings. |
| Expected Result | The game should alert the player when resources are critically low. |
| Importance | High |

<br>

| Test Case ID | 005 |
| --- | --- |
| Name | Validate Pollution Accumulation Over Time |
| Description | Ensure pollution levels increase with specific actions. |
| Pre-conditions | Place pollution-generating buildings. |
| Steps | 1. Observe pollution after building factories or power plants. |
| Expected Result | Pollution levels increase as expected with the construction of pollution-generating buildings. |
| Importance | High |

<br>

| Test Case ID | 006 |
| --- | --- |
| Name | Validate Pollution Mitigation |
| Description | Confirm pollution decreases when trees or mitigation actions are added. |
| Pre-conditions | Have high pollution levels. |
| Steps | 1. Add pollution-mitigating structures. |
| Expected Result | Pollution decreases as a result of mitigation actions. |
| Importance | High |

<br>

| Test Case ID | 007 |
| --- | --- |
| Name | Test Building Upgrades |
| Description | Ensure buildings upgrade correctly when conditions are met. |
| Pre-conditions | Meet the requirements for upgrading. |
| Steps | 1. Upgrade a building. |
| Expected Result | The building should upgrade successfully when the conditions are met. |
| Importance | Medium |

<br>

| Test Case ID | 008 |
| --- | --- |
| Name | Validate Energy Balancing |
| Description | Ensure the city remains operational with enough energy. |
| Pre-conditions | Place energy-producing and consuming buildings. |
| Steps | 1. Reduce energy levels to critical thresholds. |
| Expected Result | The game should indicate an energy shortage or failure to power buildings. |
| Importance | High |

<br>

| Test Case ID | 009 |
| --- | --- |
| Name | Test Win Condition for Sustainability Goals |
| Description | Verify the game ends when sustainability goals are achieved. |
| Pre-conditions | Have all conditions for win state met. |
| Steps | 1. Complete all sustainability goals. |
| Expected Result | The game should end with a win condition when sustainability goals are achieved. |
| Importance | High |

<br>

| Test Case ID | 010 |
| --- | --- |
| Name | Test Lose Condition Due to Pollution |
| Description | Verify game ends when pollution exceeds maximum levels. |
| Pre-conditions | Pollution exceeds the maximum allowed threshold. |
| Steps | 1. Let pollution levels exceed the maximum. |
| Expected Result | The game should end with a loss condition when pollution exceeds the maximum. |
| Importance | High |

### Educational Feedback Test Cases

| Test Case ID | 011 |
| --- | --- |
| Name | Validate Feedback on Positive Actions |
| Description | Ensure the game highlights the benefits of sustainable actions. |
| Pre-conditions | The player performs positive sustainability actions. |
| Steps | 1. Perform a sustainable action (e.g., place a green building). |
| Expected Result | The game should provide positive feedback on the sustainable action. |
| Importance | Medium |

<br>

| Test Case ID | 012 |
| --- | --- |
| Name | Validate Feedback on Negative Actions |
| Description | Confirm the game informs players of the adverse effects of actions like overbuilding. |
| Pre-conditions | The player performs an unsustainable or harmful action. |
| Steps | 1. Perform a negative action (e.g., overbuilding). |
| Expected Result | The game should provide negative feedback on the harmful action. |
| Importance | High |

<br>

| Test Case ID | 013 |
| --- | --- |
| Name | Test Tooltip Accuracy |
| Description | Ensure tooltips provide accurate information on buildings and resources. |
| Pre-conditions | Hover over a building or resource in the game. |
| Steps | 1. Hover over a building or resource. |
| Expected Result | The tooltip should provide correct and accurate information. |
| Importance | Medium |

<br>

| Test Case ID | 014 |
| --- | --- |
| Name | Test Educational Content Accessibility |
| Description | Confirm all educational content is easily accessible. |
| Pre-conditions | Ensure educational content exists in the game. |
| Steps | 1. Access the educational content. |
| Expected Result | The content should be easily accessible and clearly presented. |
| Importance | Medium |

<br>

| Test Case ID | 015 |
| --- | --- |
| Name | Test Sustainability Lesson Delivery |
| Description | Verify players learn concepts through gameplay. |
| Pre-conditions | The player engages in gameplay. |
| Steps | 1. Play the game with sustainability in mind. |
| Expected Result | The player should learn concepts of sustainability through gameplay. |
| Importance | Medium |

### Performance Test Cases

| Test Case ID | 016 |
| --- | --- |
| Name | Test Frame Rate Stability |
| Description | Ensure frame rate remains stable during gameplay. |
| Pre-conditions | The game is running and all performance settings are configured. |
| Steps | 1. Play the game and observe the frame rate over time. |
| Expected Result | The frame rate should remain stable and without noticeable drops. |
| Importance | High |

<br>

| Test Case ID | 017 |
| --- | --- |
| Name | Stress Test for Maximum Buildings |
| Description | Validate game stability with the maximum number of buildings. |
| Pre-conditions | Ensure the game allows the maximum number of buildings. |
| Steps | 1. Build the maximum number of buildings. |
| Expected Result | The game should remain stable and responsive. |
| Importance | High |

<br>

| Test Case ID | 018 |
| --- | --- |
| Name | Test Performance Under Heavy Loads |
| Description | Check game responsiveness with multiple actions in quick succession. |
| Pre-conditions | Perform multiple actions simultaneously. |
| Steps | 1. Perform actions like building, resource management, etc. quickly in succession. |
| Expected Result | The game should maintain responsiveness even under heavy loads. |
| Importance | High |

<br>

| Test Case ID | 019 |
| --- | --- |
| Name | Test Save/Load Performance |
| Description | Ensure saving and loading work correctly. |
| Pre-conditions | Save the current state of the game. |
| Steps | 1. Save the game. <br> 2. Load the saved game. |
| Expected Result | The game should save and load without issues. |
| Importance | High |

<br>

| Test Case ID | 020 |
| --- | --- |
| Name | Validate Responsiveness of UI Elements |
| Description | Confirm smooth interaction with UI components. |
| Pre-conditions | The game interface is active. |
| Steps | 1. Interact with various UI elements (buttons, menus, etc.). |
| Expected Result | UI elements should respond quickly and accurately. |
| Importance | High |

### User Interface (UI) and User Experience (UX) Test Cases


| Test Case ID | 021 |
| --- | --- |
| Name | Validate Button Functionality |
| Description | Ensure all buttons function as expected. |
| Pre-conditions | The game UI is fully loaded and interactive. |
| Steps | 1. Click on all buttons within the UI (e.g., start, settings, pause). |
| Expected Result | All buttons should perform the intended actions correctly. |
| Importance | High |

<br>

| Test Case ID | 022 |
| --- | --- |
| Name | Test Dashboard Layout |
| Description | Confirm dashboard elements are properly aligned. |
| Pre-conditions | The game is in progress and the dashboard is visible. |
| Steps | 1. Inspect the alignment of all dashboard elements. |
| Expected Result | Dashboard elements should be properly aligned and displayed without overlap. |
| Importance | Medium |

<br>

| Test Case ID | 023 |
| --- | --- |
| Name | Test Accessibility Features |
| Description | Verify accessibility options, such as colorblind mode. |
| Pre-conditions | Ensure accessibility features are enabled. |
| Steps | 1. Enable colorblind mode or other accessibility features. |
| Expected Result | All accessibility options should function as intended and provide a clear user experience. |
| Importance | Medium |

<br>

| Test Case ID | 024 |
| --- | --- |
| Name | Validate Navigation Intuitiveness |
| Description | Confirm players can navigate the game easily. |
| Pre-conditions | The game is running and the player is actively playing. |
| Steps | 1. Navigate through different sections of the game (menus, settings, gameplay). |
| Expected Result | Navigation should be intuitive, with no confusion about where to go next. |
| Importance | High |

<br>

| Test Case ID | 025 |
| --- | --- |
| Name | Validate Language Localization |
| Description | Ensure all text appears correctly in supported languages. |
| Pre-conditions | The game should support multiple languages. |
| Steps | 1. Change the game language. <br> 2. Verify that all text is displayed correctly in the selected language. |
| Expected Result | All text should be correctly translated and formatted in the selected language. |
| Importance | Medium |

### Integration and System Test Cases

| Test Case ID | 026 |
| --- | --- |
| Name | Validate Module Interactions |
| Description | Confirm smooth interaction between resource and pollution systems. |
| Pre-conditions | The game is running and all relevant modules are active. |
| Steps | 1. Interact with resources and pollution-generating modules. <br> 2. Monitor how they interact with each other. |
| Expected Result | Resources and pollution systems should interact as expected without conflicts. |
| Importance | High |

<br>

| Test Case ID | 027 |
| --- | --- |
| Name | Test Compatibility with Different Devices |
| Description | Ensure the game works on all target devices. |
| Pre-conditions | The game should be compatible with various devices. |
| Steps | 1. Test the game on different devices (PC, tablet, mobile). |
| Expected Result | The game should work seamlessly on all target devices. |
| Importance | High |

<br>

| Test Case ID | 028 |
| --- | --- |
| Name | Validate End-to-End Gameplay Flow |
| Description | Confirm all features work together during extended play. |
| Pre-conditions | Ensure the player has progressed through the game. |
| Steps | 1. Play the game from start to end. <br> 2. Ensure all features work together without breaking the gameplay flow. |
| Expected Result | The gameplay should flow seamlessly from start to finish with no technical issues. |
| Importance | High |

<br>

| Test Case ID | 029 |
| --- | --- |
| Name | Test Error Handling for Resource Overload |
| Description | Ensure proper handling of excessive resource production. |
| Pre-conditions | Produce an excessive amount of resources. |
| Steps | 1. Generate an overload of resources through buildings or actions. |
| Expected Result | The game should handle the overload properly, either by capping the resources or notifying the player. |
| Importance | Medium |

<br>

| Test Case ID | 030 |
| --- | --- |
| Name | Validate Behavior on Exiting Mid-Game |
| Description | Ensure the game saves correctly when exited abruptly. |
| Pre-conditions | The game is in progress and not at a save point. |
| Steps | 1. Exit the game abruptly (e.g., close the app or shut down the device). <br> 2. Reopen the game. |
| Expected Result | The game should load to the last saved state or provide an autosave feature to recover progress. |
| Importance | High |

