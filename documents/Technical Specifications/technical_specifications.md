# Technical Specification for Green City

| Role               | Name                            | Signature | Date          |
| ------------------ | ------------------------------- | --------- | ------------- |
| Project Manager    | Vivien Bistrel TSANGUE CHOUNGOU |           | [Insert Date] |
| Program Manager    | Guillaume DERAMCHI              |           | [Insert Date] |
| Tech Lead          | Lucas AUBARD                    |           | [Insert Date] |
| Software Developer | Victor LEROY                    |           | [Insert Date] |
| Software Developer | Manech LAGUENS                  |           | [Insert Date] |
| Quality Assurance  | Habi CAILLEAU                   |           | [Insert Date] |
| Technical Writer   | Jason GROSSO                    |           | [Insert Date] |

<details>
<summary>

## Table of Contents

</summary>

- [Technical Specification for Green City](#technical-specification-for-green-city)
  - [Table of Contents](#table-of-contents)
  - [I. Introduction](#i-introduction)
    - [1. Project Brief](#1-project-brief)
    - [2. Overview](#2-overview)
    - [3. Game Specifications](#3-game-specifications)
    - [4. Objective](#4-objective)
    - [5. Requirements](#5-requirements)
    - [6. Hardware \& Software Requirements](#6-hardware--software-requirements)
      - [a. Hardware](#a-hardware)
      - [b. Software](#b-software)
    - [7. Target Audience](#7-target-audience)
  - [II. System Overview](#ii-system-overview)
    - [1. System Architecture](#1-system-architecture)
    - [2. Software Design Setup](#2-software-design-setup)
      - [a. Setting Up the Software Environment](#a-setting-up-the-software-environment)
      - [b. Design](#b-design)
  - [III. Project Requirements](#iii-project-requirements)
    - [1. Key Concepts](#1-key-concepts)
      - [a. Binary](#a-binary)
      - [b. Logic Gates](#b-logic-gates)
      - [c. The Clock](#c-the-clock)
      - [d. LUTs](#d-luts)
      - [e. Flip-flops](#e-flip-flops)
    - [2. Gameplay Requirements](#2-gameplay-requirements)
      - [a. Player Movement](#a-player-movement)
      - [b. Obstacle Movement](#b-obstacle-movement)
      - [c. Levels of Difficulty](#c-levels-of-difficulty)
    - [3. Display Requirements](#3-display-requirements)
      - [a. VGA Display](#a-vga-display)
      - [b. Sprite Graphics](#b-sprite-graphics)
    - [4. Debouncing Logic](#4-debouncing-logic)
      - [a. Implementation Steps](#a-implementation-steps)
      - [b. Debouncing in Gameplay](#b-debouncing-in-gameplay)
    - [5. Game States](#5-game-states)
      - [a. Initialization](#a-initialization)
      - [b. Gameplay](#b-gameplay)
      - [c. Game Over or Level Completion](#c-game-over-or-level-completion)
    - [6. Timing and Synchronization](#6-timing-and-synchronization)
    - [7. Folder Structure](#7-folder-structure)
  - [IV. Module Breakdown](#iv-module-breakdown)
    - [1. Top-Level Module](#1-top-level-module)
    - [2. Modules and Submodules](#2-modules-and-submodules)
  - [V. Implementation Details](#v-implementation-details)
    - [1. Finite State Machines (FSMs)](#1-finite-state-machines-fsms)
      - [a. IDLE](#a-idle)
      - [b. INIT (Initialization)](#b-init-initialization)
      - [c. PLAYING](#c-playing)
      - [d. LEVEL\_COMPLETE](#d-level_complete)
      - [e. GAME\_OVER](#e-game_over)
      - [f. Clock Synchronization and Timing](#f-clock-synchronization-and-timing)
  - [VI. Testing and Validation](#vi-testing-and-validation)
    - [1. Testbench Design](#1-testbench-design)
      - [a. Structure of a Testbench](#a-structure-of-a-testbench)
      - [b. Modular Testing](#b-modular-testing)
      - [c. Edge Case Testing](#c-edge-case-testing)
      - [d. Execution Tools](#d-execution-tools)
  - [VII. Conclusion](#vii-conclusion)
  - [VIII. Glossary](#viii-glossary)

</details>

## I. Introduction

### 1. Project Brief

We have been assigned to develop a serious game using Godot Engine. The game is called Green City and it is city builder game where the player has to manage a city and make it more sustainable

### 2. Overview

[Describe the core gameplay and technical systems being implemented.]

### 3. Game Specifications

[List the technical details such as resolutions, mechanics, and performance expectations.]

### 4. Objective

[Summarize the primary goals of the technical implementation.]

### 5. Requirements

[Highlight technical and hardware requirements.]

### 6. Hardware & Software Requirements

#### a. Hardware

[List hardware requirements.]

#### b. Software

[List software tools and versions.]

### 7. Target Audience

[Define the target user base for the technical document.]

---

## II. System Overview

### 1. System Architecture

[Provide a high-level diagram or description of the architecture.]

### 2. Software Design Setup

#### a. Setting Up the Software Environment

[Detail the development environment and setup process.]

#### b. Design

[Describe the overarching design principles.]

---

## III. Project Requirements

### 1. Key Concepts

#### a. Binary

[Explain binary logic usage.]

#### b. Logic Gates

[Describe the specific gates used.]

#### c. The Clock

[Describe the clock signal usage.]

#### d. LUTs

[Explain Look-Up Tables.]

#### e. Flip-flops

[Describe the flip-flops' role.]

### 2. Gameplay Requirements

#### a. Player Movement

[Describe player movement requirements.]

#### b. Obstacle Movement

[Detail obstacle behaviors.]

#### c. Levels of Difficulty

[Explain how levels and difficulty are implemented.]

### 3. Display Requirements

#### a. VGA Display

[Describe VGA setup.]

#### b. Sprite Graphics

[Explain sprite integration.]

### 4. Debouncing Logic

#### a. Implementation Steps

[Provide step-by-step debounce logic.]

#### b. Debouncing in Gameplay

[Explain debounce integration.]

### 5. Game States

#### a. Initialization

[Define initialization requirements.]

#### b. Gameplay

[Describe gameplay logic.]

#### c. Game Over or Level Completion

[Explain game end conditions.]

### 6. Timing and Synchronization

[Detail timing mechanisms.]

### 7. Folder Structure

[Provide folder structure overview.]

---

## IV. Module Breakdown

### 1. Top-Level Module

[Describe the top-level module and its responsibilities.]

### 2. Modules and Submodules

[List all modules and submodules with descriptions.]

---

## V. Implementation Details

### 1. Finite State Machines (FSMs)

#### a. IDLE

[Describe idle state.]

#### b. INIT (Initialization)

[Describe initialization state.]

#### c. PLAYING

[Detail playing state.]

#### d. LEVEL_COMPLETE

[Explain level completion.]

#### e. GAME_OVER

[Define game over logic.]

#### f. Clock Synchronization and Timing

[Describe timing mechanisms.]

---

## VI. Testing and Validation

### 1. Testbench Design

#### a. Structure of a Testbench

[Describe testbench design principles.]

#### b. Modular Testing

[Explain module-specific testing.]

#### c. Edge Case Testing

[Detail edge case scenarios.]

#### d. Execution Tools

[Specify tools for validation.]

---

## VII. Conclusion

[Summarize the document and implementation goals.]

---

## VIII. Glossary

[Provide definitions for all technical terms.]
