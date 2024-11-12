<details>
<summary>## Table of Contents</summary>

- [Overview](#overview)
- [Team Members](#team-members)
- [1. Context](#1-context)
- [2. Goal / Scope](#2-goal--scope)
  - [MVP Scope](#mvp-scope)
  - [Future Vision Scope](#future-vision-scope)
  - [Priority objectives](#priority-objectives)
- [3. Functional requirements](#3-functional-requirements)
  - [Gameplay mechanics](#gameplay-mechanics)
  - [UI components](#ui-components)
  - [Player interactions](#player-interactions)
- [4. Dependencies and Priorities](#4-dependencies-and-priorities)
- [5. Acceptance criteria](#5-acceptance-criteria)
- [6. Design specifications](#6-design-specifications)
- [7. Non-functional requirements](#7-non-functional-requirements)
- [8. Win/Lose Conditions](#8-winlose-conditions)
- [9. Impact of Management on Gameplay](#9-impact-of-management-on-gameplay)
- [10. Out of scope](#10-out-of-scope)
- [11. Security](#11-security)
- [12. Glossary](#12-glossary)

</details>

<details>
<summary>## Overview</summary>

The climate change game project is a serious game aimed at educating players about sustainable city management and the environmental consequences of their decisions. Developed in [Godot 4.3](#glossary) by a team of six from Algosup, the project is part of a seven-week educational program. The game includes features such as resource management, pollution tracking, and city-building, with a focus on creating an engaging yet informative experience.

</details>

# Team Members

| Role              | Member Name |
| ----------------- | ----------- |
| Project Manager   | [Name]      |
| Program Manager   | [Name]      |
| Technical Lead    | [Name]      |
| Software Engineer | [Name]      |
| Software Engineer | [Name]      |
| QA Tester         | [Name]      |
| Technical Writer  | [Name]      |

# Green City: Functional Specification Template

# 1. Context

- **Current situation**: The team, composed of six members from Algosup, is developing a serious game using [Godot 4.3](#glossary). This project is part of a seven-week educational program to evaluate both technical skills and understanding of sustainable practices. The game aims to educate players about [sustainable city management](#glossary) and the consequences of [climate-related decisions](#glossary).

- **Background**: Players will engage in [city-building](#glossary) and management to understand how their decisions impact the environment. The target audience includes those interested in sustainability and city management, as well as potential buyers and stakeholders. The game must be fun, engaging, and convey important sustainability lessons effectively.

- **Initial MVP Focus**: The [MVP](#glossary) will focus on core gameplay, including [resource management](#glossary), [pollution tracking](#glossary), and city-building. The goal is to lay a foundation that can be expanded to achieve the full game vision. The MVP will act as a proof of concept demonstrating key sustainable city-building mechanics.

## 2. Goal / Scope

- **Primary goal**: Develop a game that simulates environmental challenges to educate users on sustainability, focusing on balancing economic growth with environmental responsibility.

- **Scope of work**:

  ### MVP Scope
  - **Resource management**: Players allocate renewable (e.g., [solar energy](#glossary)) and non-renewable (e.g., fossil fuel) resources while managing the city’s finances.
  - **Pollution tracking**: Pollution levels will be visually represented to show the city's health and the impact of player decisions over time.
  - **Educational feedback**: Visual feedback (pollution indicators, health bars) helps players understand the consequences of their actions.
  - **Simple decision-making**: Players make straightforward decisions regarding renewable energy, waste management, and city expansion.

  ### Future Vision Scope
  - **Advanced resource management**: Introduce more complex resource types (e.g., food, advanced energy systems).
  - **Pollution mitigation**: Advanced tools to reduce pollution, like tree planting, public transit, and waste management systems.
  - **Complex decision-making**: Balancing industrial growth, environmental sustainability, and citizen satisfaction.

  ### Priority objectives
  - **Promote Renewable Energy**: Encourage players to prioritize renewable energy to minimize the carbon footprint.
  - **Emphasize Waste Management**: Highlight managing waste through recycling, composting, and waste-to-energy plants.
  - **Foster Public Awareness**: Include public campaigns to raise awareness about sustainability.

- **Game complexity**: The game will be simple to grasp, with intuitive mechanics suitable for all ages. The MVP will focus on core features like resource allocation and pollution tracking, while future versions will expand these features for more depth.

- **Target outcomes**:
  - Players understand the importance of balancing city growth with sustainable practices.
  - Players learn the impact of resource choices on pollution, quality of life, and growth.
  - Players develop a sense of responsibility regarding environmental impacts.

## 3. Functional requirements

- **Gameplay mechanics**:

  ### MVP
  - **Building placement**: Players place basic structures (e.g., residential buildings, power plants, parks).
  - **Resource management**: Players allocate energy resources and manage budgets effectively.
  - **Pollution control**: Pollution levels are visually represented through indicators like smog and reduced greenery.

  ### Future Vision
  - **Building upgrades**: Players upgrade buildings to improve efficiency (e.g., reducing energy consumption).
  - **Dynamic pollution control**: Advanced tools like public transit and green technologies reduce pollution levels.

- **UI components**:
  ### MVP
  - **Simple dashboard**: Displays essential metrics like energy consumption, financial status, and pollution levels.
  ### Future Vision
  - **Detailed notifications**: Prompts and messages guide players through complex decisions.
  - **Advanced visual indicators**: Charts and graphs provide comprehensive feedback.

- **Player interactions**:
  ### MVP
  - **Construction**: Players place and remove basic buildings.
  - **Basic decision-making**: Players decide on energy use, construction, and waste management.
  - **Feedback mechanisms**: Visual cues (e.g., changes in city aesthetics) help players understand their impact.
  ### Future Vision
  - **Advanced construction**: Players upgrade buildings for increased efficiency.
  - **Complex decision-making**: Players balance economic growth, environmental health, and citizen satisfaction.
  - **Enhanced feedback**: Audio cues and detailed notifications provide deeper insights.

## 4. Dependencies and Priorities

- **Feature dependencies**:
  - **Building upgrades** require basic building placement and resource allocation.
  - **Dynamic pollution control** requires basic pollution tracking.

- **Feature priorities**:
  - **High priority**: Building placement, resource management, pollution tracking, and educational feedback.
  - **Medium priority**: Building upgrades, complex decision-making.
  - **Low priority**: Dynamic pollution control, enhanced feedback.

## 5. Acceptance criteria

- **Gameplay verification**:
  - Players can place buildings, allocate resources, and track pollution.
  - Players achieve varying levels of success based on management of resources and pollution.

- **User interface**:
  - **MVP**: The UI must be intuitive, with responsive elements like buttons and dashboards.
  - **Future Vision**: The UI must provide advanced feedback and clear indicators.

- **Educational content**:
  - Players receive relevant information about environmental impacts.

## 6. Design specifications

- **UI layout**: Mockups or design prototypes should illustrate MVP and future UI versions. The MVP should have a clean layout focusing on ease of navigation.

- **UX elements**: The user experience should prioritize accessibility and engagement. The MVP will offer a linear flow, while the future version may include branching decisions and tutorials.

- **Visual style**: Use a consistent theme representing sustainability. Green and blue tones dominate the palette, with red for pollution and warnings. Icons should intuitively represent buildings, energy, and pollution.

## 7. Non-functional requirements

- **Performance**: Ensure the game runs smoothly at 60 FPS on mid-range devices.

- **Scalability**: The game must handle large-scale city data without issues. The MVP introduces base data management, while future versions implement optimizations.

- **Accessibility**: Adjustable text sizes, colorblind-friendly palettes, and simplified UI modes for younger audiences or those with impairments.

## 8. Win/Lose Conditions

- **Win Condition**:
  ### MVP
  - Players win by maintaining pollution below a threshold and providing enough renewable energy for 5 in-game years.
  ### Future Vision
  - Players achieve milestones in sustainable growth, public awareness, and resource efficiency.

- **Lose Condition**:
  ### MVP
  - Players lose if pollution exceeds a critical threshold for more than one in-game year, leading to city collapse.
  ### Future Vision
  - Players lose due to resource depletion, public dissatisfaction, or financial collapse.

## 9. Impact of Management on Gameplay

- **Good Management**:
  - **Steady Growth**: Players receive more income for further development.
  - **Positive Feedback**: The city becomes greener, with visual indicators of progress.
  - **Citizen Satisfaction**: Higher satisfaction translates to bonuses, like increased tax revenue.

- **Poor Management**:
  - **Deterioration**: Rising pollution levels lead to resource scarcity and visible degradation.
  - **Negative Feedback**: Pollution indicators, such as smog, increase, showing declining sustainability.
  - **Citizen Dissatisfaction**: Reduced productivity, abandoned buildings, and city decline.

## 10. Out of scope

- **Features not included**:
  - Multiplayer modes.
  - Detailed analytics or third-party integration.
  - Complex AI behavior beyond basic interactions.

## 11. Security

- **Data security**: Implement data protection protocols. All saved data must be secure to prevent unauthorized access.

- **Authentication**: Outline player identification mechanisms if needed, such as profile creation or save encryption.

## 12. Glossary

- **[Resource management](#glossary)**: Allocation and monitoring of resources like energy and money. ([Wikipedia](https://en.wikipedia.org/wiki/Resource_management))
- **[Pollution metric](#glossary)**: A numerical representation of pollution levels that affect gameplay. ([Wikipedia](https://en.wikipedia.org/wiki/Pollution))
- **[Citizen satisfaction](#glossary)**: A metric that reflects the happiness of the city's population, influenced by pollution, resources, and quality of life. ([Wikipedia](https://en.wikipedia.org/wiki/Happiness_economics))
- **[Climate change](#glossary)**: A long-term change in the average weather patterns that define Earth's local, regional, and global climates. These changes have been attributed largely to human activities, particularly the burning of fossil fuels. ([Wikipedia](https://en.wikipedia.org/wiki/Climate_change))
- **[Godot 4.3](#glossary)**: An open-source game engine used for creating 2D and 3D games, known for its flexibility and lightweight design. ([Wikipedia](https://en.wikipedia.org/wiki/Godot_\(game_engine\)))
- **[Sustainable city management](#glossary)**: Urban planning strategies that aim to promote sustainable development, reducing resource consumption and negative environmental impact. ([Wikipedia](https://en.wikipedia.org/wiki/Sustainable_city))
