<div align="center">

---

# Test Cases | Team 3
| Document Type  | Specification           |
| -------------- | ----------------------- |
| Document Owner | Habi CAILLEAU           |
| Issue date     | 06/12/2024              |
| Document Name  | Test Cases              |


<br>

Test case status : [Google sheet](https://docs.google.com/spreadsheets/d/1o72AQQnd1AdfZWMCfOFAuP_46ZYQdUdQIkkkEWEdWik/edit?gid=0#gid=0)

</div>

---

<details>
<summary> 📖 Table of contents </summary>

- [Test Cases | Team 3](#test-cases--team-3)
  - [Overview](#overview)
  - [Gameplay test cases](#gameplay-test-cases)
  - [Educational feedback test cases](#educational-feedback-test-cases)
  - [Performance test cases](#performance-test-cases)
  - [User interface (UI) and user experience (UX) test cases](#user-interface-ui-and-user-experience-ux-test-cases)
  - [Integration and system test cases](#integration-and-system-test-cases)

</details> 

---

## Overview

A test case is a structured document outlining specific scenarios or procedures to be tested within a software or system. Its purpose is to ensure that the software functions correctly and reliably, allowing for seamless production use without encountering significant bugs. In this document five types of test will be executed : 

- Gameplay Test Cases
- Educational Feedback Test Cases
- Performance Test Cases
- User Interface (UI) and User Experience (UX) Test Cases
- Integration and System Test Cases

## Gameplay test cases

| Test Case ID | 001 |
| --- | --- |
| name | Validate building placement on invalid tiles |
| description | Ensure players cannot place buildings on invalid tiles (e.g., water, existing buildings). |
| pre-conditions | Select a building and attempt placement on an invalid tile. |
| steps | 1. Select a building. <br> 2. Attempt to place it on water or an already occupied tile. |
| expected result | Placement is denied with appropriate feedback. |
| importance | High |

<br>

| Test Case ID | 002 |
| --- | --- |
| name | Verify resource deduction on building placement |
| description | Check if resources are deducted correctly after building placement. |
| pre-conditions | Have enough resources to place a building. |
| steps | 1. Place a building. <br> 2. Check the resource count. |
| expected result | Resources are deducted as per building cost. |
| importance | High |

<br>

| Test Case ID | 003 |
| --- | --- |
| name | Validate resource production by buildings |
| description | Ensure resource-producing buildings (e.g., wind turbines) generate resources correctly. |
| pre-conditions | Place a resource-producing building. |
| steps | 1. Monitor resource production for 5 game minutes. <br> 2. Confirm production matches expected rates. |
| expected result | Resource production matches expected rates. |
| importance | Medium |

<br>

| Test Case ID | 004 |
| --- | --- |
| name | Test resource alerts for shortages |
| description | Ensure the game notifies the player when resources are critically low. |
| pre-conditions | Have resources deplete below the critical threshold. |
| steps | 1. Build resource-draining structures. <br> 2. Observe alerts or warnings. |
| expected result | The game should alert the player when resources are critically low. |
| importance | High |

<br>

| Test Case ID | 005 |
| --- | --- |
| name | Validate pollution accumulation over time |
| description | Ensure pollution levels increase with specific actions. |
| pre-conditions | Place pollution-generating buildings. |
| steps | 1. Observe pollution after building factories or power plants. |
| expected result | Pollution levels increase as expected with the construction of pollution-generating buildings. |
| importance | High |

<br>

| Test Case ID | 006 |
| --- | --- |
| name | Validate pollution mitigation |
| description | Confirm pollution decreases when trees or mitigation actions are added. |
| pre-conditions | Have high pollution levels. |
| steps | 1. Add pollution-mitigating structures. |
| expected result | Pollution decreases as a result of mitigation actions. |
| importance | High |

<br>

| Test Case ID | 007 |
| --- | --- |
| name | Test building upgrades |
| description | Ensure buildings upgrade correctly when conditions are met. |
| pre-conditions | Meet the requirements for upgrading. |
| steps | 1. Upgrade a building. |
| expected result | The building should upgrade successfully when the conditions are met. |
| importance | Medium |

<br>

| Test Case ID | 008 |
| --- | --- |
| name | Validate energy balancing |
| description | Ensure the city remains operational with enough energy. |
| pre-conditions | Place energy-producing and consuming buildings. |
| steps | 1. Reduce energy levels to critical thresholds. |
| expected result | The game should indicate an energy shortage or failure to power buildings. |
| importance | High |

<br>

| Test Case ID | 009 |
| --- | --- |
| name | Test win condition for sustainability goals |
| description | Verify the game ends when sustainability goals are achieved. |
| pre-conditions | Have all conditions for win state met. |
| steps | 1. Complete all sustainability goals. |
| expected result | The game should end with a win condition when sustainability goals are achieved. |
| importance | High |

<br>

| Test Case ID | 010 |
| --- | --- |
| name | Test lose condition due to pollution |
| description | Verify game ends when pollution exceeds maximum levels. |
| pre-conditions | Pollution exceeds the maximum allowed threshold. |
| steps | 1. Let pollution levels exceed the maximum. |
| expected result | The game should end with a loss condition when pollution exceeds the maximum. |
| importance | High |


## Educational feedback test cases


| Test Case ID | 011 |
| --- | --- |
| name | Validate feedback on positive actions |
| description | Ensure the game highlights the benefits of sustainable actions. |
| pre-conditions | The player performs positive sustainability actions. |
| steps | 1. Perform a sustainable action (e.g., place a green building). |
| expected result | The game should provide positive feedback on the sustainable action. |
| importance | Medium |

<br>

| Test Case ID | 012 |
| --- | --- |
| name | Validate feedback on negative actions |
| description | Confirm the game informs players of the adverse effects of actions like overbuilding. |
| pre-conditions | The player performs an unsustainable or harmful action. |
| steps | 1. Perform a negative action (e.g., overbuilding). |
| expected result | The game should provide negative feedback on the harmful action. |
| importance | High |

<br>

| Test Case ID | 013 |
| --- | --- |
| name | Test tooltip accuracy |
| description | Ensure tooltips provide accurate information on buildings and resources. |
| pre-conditions | Hover over a building or resource in the game. |
| steps | 1. Hover over a building or resource. |
| expected result | The tooltip should provide correct and accurate information. |
| importance | Medium |

<br>

| Test Case ID | 014 |
| --- | --- |
| name | Test educational content accessibility |
| description | Confirm all educational content is easily accessible. |
| pre-conditions | Ensure educational content exists in the game. |
| steps | 1. Access the educational content. |
| expected result | The content should be easily accessible and clearly presented. |
| importance | Medium |

<br>

| Test Case ID | 015 |
| --- | --- |
| name | Test sustainability lesson delivery |
| description | Verify players learn concepts through gameplay. |
| pre-conditions | The player engages in gameplay. |
| steps | 1. Play the game with sustainability in mind. |
| expected result | The player should learn concepts of sustainability through gameplay. |
| importance | Medium |

<br>

## Performance test cases

| Test Case ID | 016 |
| --- | --- |
| name | Test frame rate stability |
| description | Ensure frame rate remains stable during gameplay. |
| pre-conditions | The game is running and all performance settings are configured. |
| steps | 1. Play the game and observe the frame rate over time. |
| expected result | The frame rate should remain stable and without noticeable drops. |
| importance | High |

<br>

| Test Case ID | 017 |
| --- | --- |
| name | Stress test for maximum buildings |
| description | Validate game stability with the maximum number of buildings. |
| pre-conditions | Ensure the game allows the maximum number of buildings. |
| steps | 1. Build the maximum number of buildings. |
| expected result | The game should remain stable and responsive. |
| importance | High |

<br>

| Test Case ID | 018 |
| --- | --- |
| name | Test performance under heavy loads |
| description | Check game responsiveness with multiple actions in quick succession. |
| pre-conditions | Perform multiple actions simultaneously. |
| steps | 1. Perform actions like building, resource management, etc., quickly in succession. |
| expected result | The game should maintain responsiveness even under heavy loads. |
| importance | High |

<br>

| Test Case ID | 019 |
| --- | --- |
| name | Test save/load performance |
| description | Ensure saving and loading work correctly. |
| pre-conditions | Save the current state of the game. |
| steps | 1. Save the game. <br> 2. Load the saved game. |
| expected result | The game should save and load without issues. |
| importance | High |

<br>

| Test Case ID | 020 |
| --- | --- |
| name | Validate responsiveness of UI elements |
| description | Confirm smooth interaction with UI components. |
| pre-conditions | The game interface is active. |
| steps | 1. Interact with various UI elements (buttons, menus, etc.). |
| expected result | UI elements should respond quickly and accurately. |
| importance | High |


## User interface (UI) and user experience (UX) test cases

| Test Case ID | 021 |
| --- | --- |
| name | Validate button functionality |
| description | Ensure all buttons function as expected. |
| pre-conditions | The game UI is fully loaded and interactive. |
| steps | 1. Click on all buttons within the UI (e.g., start, settings, pause). |
| expected result | All buttons should perform the intended actions correctly. |
| importance | High |

<br>

| Test Case ID | 022 |
| --- | --- |
| name | Test dashboard layout |
| description | Confirm dashboard elements are properly aligned. |
| pre-conditions | The game is in progress and the dashboard is visible. |
| steps | 1. Inspect the alignment of all dashboard elements. |
| expected result | Dashboard elements should be properly aligned and displayed without overlap. |
| importance | Medium |

<br>

| Test Case ID | 023 |
| --- | --- |
| name | Test accessibility features |
| description | Verify accessibility options, such as colorblind mode. |
| pre-conditions | Ensure accessibility features are enabled. |
| steps | 1. Enable colorblind mode or other accessibility features. |
| expected result | All accessibility options should function as intended and provide a clear user experience. |
| importance | Medium |

<br>

| Test Case ID | 024 |
| --- | --- |
| name | Validate navigation intuitiveness |
| description | Confirm players can navigate the game easily. |
| pre-conditions | The game is running and the player is actively playing. |
| steps | 1. Navigate through different sections of the game (menus, settings, gameplay). |
| expected result | Navigation should be intuitive, with no confusion about where to go next. |
| importance | High |

<br>

| Test Case ID | 025 |
| --- | --- |
| name | Validate language localization |
| description | Ensure all text appears correctly in supported languages. |
| pre-conditions | The game should support multiple languages. |
| steps | 1. Change the game language. <br> 2. Verify that all text is displayed correctly in the selected language. |
| expected result | All text should be correctly translated and formatted in the selected language. |
| importance | Medium |

<br>

## Integration and system test cases

| Test Case ID | 026 |
| --- | --- |
| name | Validate module interactions |
| description | Confirm smooth interaction between resource and pollution systems. |
| pre-conditions | The game is running and all relevant modules are active. |
| steps | 1. Interact with resources and pollution-generating modules. <br> 2. Monitor how they interact with each other. |
| expected result | Resources and pollution systems should interact as expected without conflicts. |
| importance | High |

<br>

| Test Case ID | 027 |
| --- | --- |
| name | Test compatibility with different devices |
| description | Ensure the game works on all target devices. |
| pre-conditions | The game should be compatible with various devices. |
| steps | 1. Test the game on different devices (PC, tablet, mobile). |
| expected result | The game should work seamlessly on all target devices. |
| importance | High |

<br>

| Test Case ID | 028 |
| --- | --- |
| name | Validate end-to-end gameplay flow |
| description | Confirm all features work together during extended play. |
| pre-conditions | Ensure the player has progressed through the game. |
| steps | 1. Play the game from start to end. <br> 2. Ensure all features work together without breaking the gameplay flow. |
| expected result | The gameplay should flow seamlessly from start to finish with no technical issues. |
| importance | High |

<br>

| Test Case ID | 029 |
| --- | --- |
| name | Test error handling for resource overload |
| description | Ensure proper handling of excessive resource production. |
| pre-conditions | Produce an excessive amount of resources. |
| steps | 1. Generate an overload of resources through buildings or actions. |
| expected result | The game should handle the overload properly, either by capping the resources or notifying the player. |
| importance | Medium |

<br>

| Test Case ID | 030 |
| --- | --- |
| name | Validate behavior on exiting mid-game |
| description | Ensure the game saves correctly when exited abruptly. |
| pre-conditions | The game is in progress and not at a save point. |
| steps | 1. Exit the game abruptly (e.g., close the app or shut down the device). <br> 2. Reopen the game. |
| expected result | The game should load to the last saved state or provide an autosave feature to recover progress. |
| importance | High |