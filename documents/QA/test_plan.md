<div align="center">

---

# Test Plan | Team 3
| Document Type  | Specification           |
| -------------- | ----------------------- |
| Document Owner | Habi CAILLEAU           |
| Issue date     | 06/12/2024              |
| Document Name  | Test Plan               |

<br>

---

## Test Plan approval
| Role                      | Name                    | Signature | Date        |
| --------------------------| ----------------------- | --------- | ----------  |
| Project Manager           | Bistrel TSANGUE         |           | 05/12/2024  |
| Program Manager           | Guillaume DERAMCHI      |           | 05/12/2024  |
| Technical Lead            | Lucas AUBARD            |           | 05/12/2024  |
| Senior Software Engineer  | Manech LAGUENS          |           | 05/12/2024  |
| Junior Software Engineer  | Manech LAGUENS          |           | 05/12/2024  |
| Technical Writer          | Jason GROSSO            |           | 05/12/2024  |
| Quality Assurance         | Habi CAILLEAU           |           | 05/12/2024  |

<br>

</div>

---

<br>
<details>
<summary> 📖 Table of contents </summary>
<br>


- [Test Plan | Team 3](#test-plan--team-3)
  - [Test Plan approval](#test-plan-approval)
  - [I.Introduction](#iintroduction)
    - [1. Overview](#1-overview)
    - [2. Purpose](#2-purpose)
    - [3. Scope](#3-scope)
    - [4. Test objectives](#4-test-objectives)
  - [II.Test Environment](#iitest-environment)
    - [1. Software Configuration](#1-software-configuration)
    - [2. Tools and Libraries](#2-tools-and-libraries)
  - [III.Test strategy](#iiitest-strategy)
    - [1. Test principles](#1-test-principles)
    - [2. Test levels](#2-test-levels)
    - [3. Test types](#3-test-types)
    - [Manual Testing:](#manual-testing)
    - [Automated Testing:](#automated-testing)
    - [Other Testing Types :](#other-testing-types-)
  - [IV. Test Execution](#iv-test-execution)
    - [1. Testing phases](#1-testing-phases)
    - [2. Test case Execution](#2-test-case-execution)
    - [3. GitHub issue management](#3-github-issue-management)
    - [V. Testing outcomes](#v-testing-outcomes)
      - [1. Suspension criteria](#1-suspension-criteria)
      - [2. Exit criteria](#2-exit-criteria)
  - [VI.Measure testing](#vimeasure-testing)
  - [VII. Conclusion](#vii-conclusion)
  - [VIII. Glossary](#viii-glossary)




</details> 
<br>

---


## I.Introduction 

### 1. Overview

Green City is an innovative serious game designed to educate players about climate change and sustainability through engaging city-building mechanics. 
Developed on the robust Godot 4.3 engine, the game blends education and entertainment, offering an immersive experience where players make critical decisions to balance economic 
growth and environmental health.


### 2. Purpose

The primary purpose of the test plan is to ensure that Green City meets its educational, functional, and performance goals by identifying, documenting, and validating the game's 
requirements through systematic testing. This ensures that the game delivers a reliable, engaging, and educational experience aligned with its objectives.


### 3. Scope

The scope of this test plan defines the key areas and objectives to be addressed during testing, ensuring alignment with the product's goals, 
expectations, and core features. By establishing a clear scope, we create a shared understanding of what will be tested, why, 
and how it aligns with the educational and functional objectives of Green City.


- Key Areas of Focus: <br>
Core Functional Validation:
Verify that the essential gameplay mechanics and educational elements function as intended, supporting the game’s goal of teaching sustainability 
concepts through interactive city-building.

- Educational Integrity: <br>
Ensure that the educational content is accurate, engaging, and effectively integrated into the gameplay. Testing will assess whether players receive clear, 
actionable feedback that reinforces lessons about climate change and sustainable practices.

- User Experience (UX) and Interface (UI): <br>
Confirm that the game’s interface is intuitive, accessible, and user-friendly, providing a seamless experience for the target audience.

- Performance and Stability: <br>
Validate that the game runs smoothly and reliably, delivering a consistent experience on target devices.



### 4. Test objectives

The test objectives for Green City are designed to guide and focus the testing activities, ensuring that the game meets its functional,
educational, and performance goals. These objectives will help verify the game's reliability, effectiveness, and alignment with its core purpose of 
educating players about climate change and sustainability through engaging gameplay.

**a.General Test Objectives:**

Identify and Report Defects:
Detect and document any functional or non-functional issues to maintain the quality and stability of the game.

Validate New Features:
Ensure that each feature functions as intended, particularly those aligned with core educational and gameplay mechanics.

Achieve Comprehensive Test Coverage:
Ensure all critical components and scenarios are tested, focusing on core functionalities, user interactions, and educational content.

**b.Specific Test Objectives:**

These are the key aspects I aim to test and guarantee in our game.


- Functional Objectives:

    - Validate Core Mechanics: <br>
Ensure essential gameplay features such as building placement, resource allocation, and pollution tracking operate correctly.

    - Verify Educational Feedback: <br>
Confirm that players receive accurate, contextually relevant feedback that reflects their in-game decisions and reinforces sustainability lessons.

    - Test Win/Lose Conditions: <br>
Ensure that win and lose criteria trigger correctly based on pollution levels and resource management.

<br>

- Performance Objectives:

    - Assess Game Stability: <br>
Verify that the game runs smoothly under normal and peak usage scenarios without crashes or performance degradation.

    - Evaluate Load Handling: <br>
Ensure the game can handle expected resource and data loads (maximum number of buildings) without lag or errors.

<br>

- Usability Objectives:

    - Validate User Experience: <br> 
Ensure the game’s interface is intuitive, accessible, and easy to navigate for the target audience (ages 15–99).

    - Assess Educational Effectiveness: <br>
Verify that educational messages are clear, engaging, and effectively integrated into the gameplay to enhance learning.

<br>

- Educational Content Objectives:

    - Ensure Accuracy of Information: <br>
Confirm that all educational content and sustainability facts presented in the game are accurate and up-to-date.

    - Validate Learning Outcomes: <br>
Assess whether the game effectively teaches players about climate change, sustainable practices, and the impact of their decisions.



## II.Test Environment

### 1. Software Configuration

Game Engine: Godot Engine v4.3

Importance: All test activities will be performed using this version to avoid compatibility issues.

Scripting Language: GDScript

Importance: All scripts and test automation use GDScript; testers should be proficient in it for debugging and writing test cases.

### 2. Tools and Libraries

Unit Testing: GDUnit

Purpose: Framework for writing and executing unit tests. Ensures individual functions and methods perform as expected.

Version Control: GitHub

Purpose: Version control system to manage code changes and collaborate with team members. Testers will pull the latest code from the dev branch for testing.


## III.Test strategy

### 1. Test principles 

Test principles guide the testing approach, ensuring it is effective, consistent, and aligned with project goals. For Green City, the following principles will be applied:

**Early Testing:** Begin testing early in the development cycle, focusing on core functionalities like resource management and building placement. This helps catch critical issues before they propagate.

**Prioritization:** Prioritize testing critical features such as building logic, pollution management, and user interactions. Focus on areas that impact user experience and game mechanics the most.

**Automation where Appropriate:** Automate repetitive and critical tests (unit and regression tests) to save time and ensure consistent results.

**User-Centric Approach:** Emphasize usability and accessibility testing to ensure the game is intuitive and inclusive for all players.


### 2. Test levels



Test levels define the stages at which different types of testing are performed. For Green City, the primary test levels include:

<br>

- Unit Testing:

**Focus**: Verify individual modules and scripts, such as `ResourceManager.gd` and `PollutionManager.gd`.

**Tools**: GDUnit.

**Responsibility**: QA automation.

**Timing**: Performed during the development phase before code integration.

<br>

- Integration Testing:

**Focus**: Ensure that different modules (building placement interacting with resource management) work together seamlessly.

**Tools**: GDUnit with integration scenarios.

**Responsibility**: QA with support from developers.

**Timing**: Conducted after unit testing and before full system testing.

<br>

- System Testing (End-to-End Testing):

**Focus**: Validate the complete gameplay flow, including win/lose conditions, resource management, and pollution effects.

**Tools**: Manual playthroughs and automated end-to-end scripts.

**Responsibility**: QA .

**Timing**: Performed in a dedicated testing environment before beta release.

<br>

### 3. Test types 


The test types describe the different approaches and methodologies to be used based on the project's needs:

### Manual Testing:

<br>

- Functional Testing:

**Objective**: Ensure that the game functions as intended by verifying features like building placement, resource management, and pollution tracking against defined requirements.

**Scope**: Covers all core functionalities and user workflows, including building placement logic, resource calculations, and win/lose conditions. It ensures each feature operates correctly and meets user expectations.

**Execution**: Manually performed by me using predefined test cases.

<br>

- Smoke Testing:

**Objective** : Ensure that core functionalities (building placement, resource updates) work without critical issues.

**Scope**: Conducted at the beginning of each test cycle or build deployment. Focuses on basic operations to determine system stability.

**Execution**: Manually performed by me using predefined test cases.

<br>

- Usability Testing:

**Objective**: Validate the game’s ease of use, intuitiveness, and accessibility.

**Scope**: New features (dashboard, tooltips).

**Execution**: Carried out manually with input from end-users or focus groups.

<br>

### Automated Testing:

<br>

- Unit Testing:

**Objective**: Verify the functionality of individual scripts and modules.

**Scope**: Critical scripts such as `ResourceManager.gd` and `PollutionManager.gd`.

**Tools**: GDUnit.

**Execution**: Written and maintained by me, integrated into the CI/CD pipeline.

<br>

- Regression Testing:

**Objective**: Ensure that new changes do not negatively affect existing functionality.

**Scope**: Core features, including building placement, resource management, and pollution tracking.

**Execution**: Automated tests run on all builds after new feature integration.

<br>

### Other Testing Types :

<br>

- Performance Testing:

**Objective**: Validate game performance under different conditions (frame rates, resource usage).

**Scope**: Stress tests and frame rate checks during gameplay.

**Tools**: Godot’s built-in profiler.


## IV. Test Execution

### 1. Testing phases

<br> 

**a. Preparation Phase:**

**Objective:** Set up the testing environment and create necessary test data.

**Activities:**
- Configure test environments (Godot engine setup).
- Prepare test cases and scripts for both manual and automated testing (google sheet).
- Review test cases for completeness and accuracy.

<br> 

**b.Execution Phase:**

**Objective:** Run tests and log defects to verify that the application meets its functional and non-functional requirements.

**Activities:**
- Perform manual tests (exploratory, usability).
- Execute automated tests (unit, integration, regression...).
- Record test results and document any identified defects.
- Conduct performance and accessibility tests if applicable.

<br> 

**b.Defect Management Phase:**

**Objective:** Track, analyze, and resolve identified defects.

**Activities:**
- Log defects in the defect-tracking system.
- Prioritize and categorize defects based on severity and impact(High, medium, low).
- After the tests, retest fixed defects to ensure successful resolution.

<br> 

**d. Closure Phase:**

**Objective:** Conclude the testing process and evaluate readiness for release.

**Activities:**
- Ensure all critical defects are resolved.
- Verify test coverage and completion status.
- Conduct a final review meeting with the development team.
- Prepare the final test report, including metrics and findings.

<br> 

### 2. Test case Execution

The following structure will be used for Green City, with a dedicated template for each test case:



| Test Case ID | 28 |
| --- | --- |
| Name | Name of the test case |
| Description | Description of the test case |
| Pre-conditions | Requirements for the test |
| Steps | Steps to go from the current state to the expected result |
| Expected Result |Actual result of the test (could differ from what's expected) |
| Status | Status of the test (To Test , Testing , Tested )  |
| Importance | Defines if a test is important or not. Using symbols : Low / Medium / High |

<br>


After executing each test, its status (implemented, not implemented, non-working) will be documented and stored in a separate 
repository. You can access the detailed results [here](https://docs.google.com/spreadsheets/d/1o72AQQnd1AdfZWMCfOFAuP_46ZYQdUdQIkkkEWEdWik/edit?gid=0#gid=0).


### 3. GitHub issue management

Efficient issue management is crucial for tracking bugs, documenting improvements, and ensuring smooth development workflows. 
In Green City, GitHub's issue management system has been set up with standardized templates to ensure consistency, clarity, and 
efficiency when reporting and addressing issues. This process helps streamline communication between developers, testers, and 
stakeholders, ensuring timely resolution of problems and documentation updates.

**a. Issue Creation:**

- Contributors create an issue using the appropriate template (Bug Report or Documentation Report).
- All fields are filled with detailed, relevant information to provide a clear understanding of the problem or update needed.

<br>

**b. Labeling and Categorization:**

- Issues are tagged with relevant labels (bug, documentation, enhancement) to categorize them.
- Importance levels help prioritize which issues need immediate attention.

<br>

**c. Assignment:**

- Issues are assigned to specific team members based on their expertise or current workload.
- Unassigned issues are reviewed during regular team meetings to ensure they don’t go unnoticed.

<br>

**d. Resolution and Tracking:**

- Developers or documentation specialists work on resolving the issue.
- Updates on the issue’s status (To Do, In Progress, Resolved) are tracked on the GitHub board.
- Automated notifications ensure that all stakeholders stay informed of progress.

<br>

**e. Review and Closure:**

- Once the issue is resolved or the documentation is updated, the solution is reviewed by a peer or QA tester.
- Upon validation, the issue is closed, and any relevant comments or changes are documented for future reference.

<br>

Here are the templates used during the project :

**Bug report template (relate to typos):**
<img src="..\QA\Images\Bug_template.png" alt="Bug Template"/>

**Documentation report template (relate to typos):**
<img src="..\QA\Images\Doc_template.png" alt="Doc Template"/>


### V. Testing outcomes

Test criteria regulate all testing activities, ensuring consistency and quality. In the Green City project, we will use two key types: Suspension Criteria and Exit Criteria.

#### 1. Suspension criteria

Suspension criteria establish the conditions under which all testing activities must be temporarily halted. This prevents wasted effort when critical issues compromise the validity of ongoing tests.

- Testing will be suspended if a critical defect or blocker is found that prevents the execution of further test cases (For Instance, if a core functionality such as building placement causes the game to crash repeatedly, testing will be suspended until the issue is resolved )

- Once the defect is addressed, testing will resume from the point of suspension, ensuring comprehensive coverage without missing crucial steps


#### 2. Exit criteria

Exit criteria are predefined goals or conditions that must be met to conclude a test phase successfully. These criteria ensure that the system meets the necessary quality standards before progressing to the next phase.

- Quantitative Goals: For a feature to move from the testing phase to release, specific benchmarks must be met.
    - 92% of all critical test cases must pass before a feature is deemed suitable for customer release.

- Qualitative Goals: No high-priority bugs should remain unresolved, and all major functionalities ( resource management, pollution tracking) must operate as expected.

- Documentation: All test outcomes must be documented, and the test status must be clearly recorded to ensure transparency.

<br>

|Name|Purpose|Link|
|-:|:-|:-:|
|Test Cases|Ensure the software is working as intended, with all features and functionalities operating correctly.|[TEST CASE](https://github.com/algosup/2024-2025-project-2-serious-game-team-3/blob/main/documents/QA/test_cases.md)|
|Bug Reports|Supply a detailed account of the problems to the development team, aiding in the prompt resolution of the issue|[REPORTS](https://github.com/algosup/2024-2025-project-2-serious-game-team-3/issues?q=is%3Aissue+is%3Aclosed)|


## VI.Measure testing

These metrics ensure that the software quality meets expectations and the development process remains on track :

<br>

1. Defect Density

**Formula:**

$$
\text{Defect Density} = \frac{\text{Total Defect Count}}{\text{Size of the Release (lines of code)}}
$$

Lower defect density indicates higher code quality. This metric helps identify problematic modules or components.

<br>

2. Test Coverage

**Formula:**

$$
\text{Test Coverage ( percent ) } = \frac{\text{Number of Requirements Mapped to Test Cases}}{\text{Total number of requirements}} * 100
$$

Measures the extent to which requirements are tested. Higher test coverage reduces the likelihood of undetected defects.

<br>

3. Defect Detection Efficiency (DDE)

**Formula:**

$$
\text{DDE ( percent ) } = \frac{\text{Defects Detected During Testing}}{\text{Total Number of Defects}} * 100
$$

Indicates the effectiveness of testing in catching defects before release. Higher DDE means fewer defects escape into production.


## VII. Conclusion 

The Green City testing plan outlines a comprehensive approach to ensuring the game's quality, educational value, and performance. By systematically validating core functionalities, educational integrity, and user experience, this plan guarantees that the game effectively meets its goals of teaching sustainability through engaging gameplay.

Key testing metrics such as Defect Density, Test Coverage, and Defect Detection Efficiency (DDE) provide measurable insights into code quality, requirement validation, and testing effectiveness. Establishing clear Suspension and Exit Criteria ensures that critical defects are addressed promptly, and testing phases conclude only when predefined quality standards are met.

Through rigorous manual and automated testing, coupled with efficient defect management via GitHub, Green City aims to deliver a stable, user-friendly, and educational experience, preparing it for a successful launch and positive impact on its audience.


## VIII. Glossary

| Term                  | Definition                                                                 |
|-----------------------|-----------------------------------------------------------------------------|
| **Test Coverage**      | Percentage of requirements covered by test cases.                          |
| **Defect Density**     | Number of defects per size of release (e.g., lines of code).               |
| **Unit Testing**       | Testing individual components of the game.                                 |
| **Integration Testing**| Testing interactions between components.                                   |
| **System Testing**     | End-to-end testing of the game’s functionality as a whole.                 |
| **Regression Testing** | Verifying new changes don’t break existing features.                       |
| **Bug Report**         | Document detailing a defect, including steps to reproduce and expected results. |
| **CI/CD Pipeline**     | Automated process for integrating and deploying code changes.              |
| **Test Case** | A test case is a set of conditions or variables under which a tester will determine if features is working as it was originally established for it to do. |