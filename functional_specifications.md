# Green City: Functional specification document

## Table of contents

- [Overview](#overview)
- [Team members](#team-members)
- [1. Context](#1-context)
- [2. Goal / scope](#2-goal--scope)
  - [MVP scope](#mvp-scope)
  - [Future vision scope](#future-vision-scope)
  - [Priority objectives](#priority-objectives)
- [3. Functional requirements](#3-functional-requirements)
  - [Gameplay mechanics](#gameplay-mechanics)
  - [UI components](#ui-components)
  - [Player interactions](#player-interactions)
- [4. Dependencies and priorities](#4-dependencies-and-priorities)
- [5. Acceptance criteria](#5-acceptance-criteria)
- [6. Design specifications](#6-design-specifications)
- [7. Non-Functional requirements](#7-non-functional-requirements)
- [8. Win/lose conditions](#8-win--lose-conditions)
- [9. Impact of management on gameplay](#9-impact-of-management-on-gameplay)
- [10. Out of scope](#10-out-of-scope)
- [11. Security](#11-security)
- [12. Glossary](#12-glossary)

## Team members

| Role              | Member Name        | Responsibilities                                                              |
| ----------------- | ------------------ | ----------------------------------------------------------------------------- |
| Project Manager   | Bistrel Tsangue    | Oversees project progress and ensures deadlines are met.                      |
| Program Manager   | Guillaume Deramchi | Manages program implementation, coordinates with stakeholders.                |
| Technical Lead    | Lucas Aubard       | Leads the technical direction and supervises the development team.            |
| Software Engineer | Victor Leroy       | Develops game features and ensures code quality.                              |
| Software Engineer | Manech Laguens     | Implements gameplay mechanics and collaborates on technical tasks.            |
| QA Tester         | Habi Cailleau      | Tests the game for bugs and ensures quality standards are met.                |
| Technical Writer  | Jason Grosso       | Documents features, creates user guides, and maintains project documentation. |

## 1. Context

- **Current situation**: The team, composed of seven members from Algosup, is developing a serious game using [Godot 4.3](#12-glossary). This project is part of a seven-week educational program to evaluate both technical skills and understanding of sustainable practices. The game aims to educate players about [sustainable city management](#12-glossary) and the consequences of [climate-related decisions](#12-glossary).

- **Background**: Players will engage in [city-building](#12-glossary) and management to understand how their decisions impact the environment. The target audience includes those interested in sustainability and city management, as well as potential buyers and stakeholders. The game must be fun, engaging, and convey important sustainability lessons effectively.

- **Initial MVP focus**: The [MVP](#12-glossary) will focus on core gameplay, including [resource management](#12-glossary), [pollution tracking](#12-glossary), and city-building. The goal is to lay a foundation that can be expanded to achieve the full game vision. The MVP will act as a proof of concept demonstrating key sustainable city-building mechanics, such as balancing energy production with pollution control to maintain a healthy environment while ensuring economic growth.

## 2. Goal / scope

- **Primary goal**: Develop a game that simulates environmental challenges to educate young adults and students on sustainability. Players must balance economic development with sustainable practices, making choices that prioritize long-term environmental health. Players will need to decide whether to build industrial facilities that boost the economy but increase pollution. Alternatively, they can invest in renewable energy sources, which cost more initially but lead to long-term sustainability.

- **Scope of work**:

  ### MVP scope

  - **Resource management**: Players allocate renewable (e.g., [solar energy](#12-glossary)) and non-renewable (e.g., fossil fuel) resources while managing the city’s finances.
  - **Pollution tracking**: Pollution levels will be visually represented to show the city's health and the impact of player decisions over time.
  - **Educational feedback**: Visual feedback (pollution indicators, health bars) helps players understand the consequences of their actions.
  - **Simple decision-making**: Players make straightforward decisions regarding renewable energy, waste management, and city expansion.

  ### Future vision scope

  - **Advanced resource management**: Introduce more complex resource types (e.g., food, advanced energy systems).
  - **Pollution mitigation**: Advanced tools to reduce pollution, like tree planting, public transit, and waste management systems.
  - **Complex decision-making**: Balancing industrial growth, environmental sustainability, and citizen satisfaction.

  ### Priority objectives

  - **Promote renewable energy**: Encourage players to prioritize renewable energy to minimize the carbon footprint.
  - **Emphasize waste management**: Highlight managing waste through recycling, composting, and waste-to-energy plants.
  - **Foster public awareness**: Include public campaigns to raise awareness about sustainability.

- **Game complexity**: The game will be simple to grasp, with intuitive mechanics suitable for all ages. The MVP will focus on core features like resource allocation and pollution tracking, while future versions will expand these features for more depth.

- **Target outcomes**:

  - Players understand the importance of balancing city growth with sustainable practices.
  - Players learn the impact of resource choices on pollution, quality of life, and growth.
  - Players develop a sense of responsibility regarding environmental impacts.

## 3. Functional requirements

- ### Gameplay mechanics:

  #### MVP

  - **Building placement**: Players place basic structures (e.g., residential buildings, power plants, parks).
  - **Resource management**: Players allocate energy resources and manage budgets effectively.
  - **Pollution control**: Pollution levels are visually represented through indicators like smog and reduced greenery.

  ### Future vision

  - **Building upgrades**: Players upgrade buildings to improve efficiency (e.g., reducing energy consumption).
  - **Dynamic pollution control**: Advanced tools like public transit and green technologies reduce pollution levels.

- ### UI components:

  #### MVP

  - **Simple dashboard**: Displays essential metrics like energy consumption, financial status, and pollution levels.

  #### Future vision

  - **Detailed notifications**: Prompts and messages guide players through complex decisions.
  - **Advanced visual indicators**: Charts and graphs provide comprehensive feedback (e.g., pollution trends, energy usage over time).

- ### Player interactions:

  #### MVP

  - **Construction**: Players place and remove basic buildings.
  - **Basic decision-making**: Players decide on energy use, construction, and waste management.
  - **Feedback mechanisms**: Visual cues (e.g., changes in city aesthetics) help players understand their impact.

  #### Future vision

  - **Advanced construction**: Players upgrade buildings for increased efficiency.
  - **Complex decision-making**: Players balance economic growth, environmental health, and citizen satisfaction.
  - **Enhanced feedback**: Audio cues and detailed notifications provide deeper insights.

## 4. Dependencies and priorities

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
  - **Future vision**: The UI must provide advanced feedback and clear indicators.

- **Educational content**:

  - Players receive relevant information about environmental impacts.

## 6. Design specifications

- **UI layout**: Mockups or design prototypes should illustrate mvp and future UI versions. The mvp should have a clean layout focusing on ease of navigation.

- **UX elements**: The user experience should prioritize accessibility and engagement. The mvp will offer a linear flow, while the future version may include branching decisions and tutorials.

- **Visual style**: Use a consistent theme representing sustainability. Green and blue tones dominate the palette, with red for pollution and warnings. Icons should intuitively represent buildings, energy, and pollution.

## 7. Non-functional requirements

- **Performance**: Ensure the game runs smoothly at 60 FPS on mid-range devices.

- **Scalability**: The game must handle large-scale city data without issues. The mvp introduces base data management, while future versions implement optimizations.

- **Accessibility**: Adjustable text sizes, colorblind-friendly palettes, and simplified UI modes for younger audiences or those with impairments.

## 8. Win / lose conditions

- **Win condition**:

  ### MVP

  - Players win by maintaining pollution levels below a defined threshold and providing enough renewable energy for five in-game years. This indicates that the city has successfully achieved sustainable growth.

  ### Future vision

  - Players achieve milestones in sustainable growth, public awareness, and resource efficiency.

- **Lose condition**:

  ### MVP

  - Players lose if pollution exceeds a critical threshold for more than one in-game year, leading to city collapse.

  ### Future vision

  - Players lose due to resource depletion, public dissatisfaction, or financial collapse.

## 9. Impact of management on gameplay

- **Good management**:
  - **Steady growth**: Players receive more income for further development, similar to how cities with strong policies on renewable energy and efficient infrastructure see economic growth over time.
  - **Positive feedback**: The city becomes greener, with visual indicators of progress, much like how cities that invest in public parks and green spaces often see improved quality of life.

- **Poor management**:
  - **Deterioration**: Rising pollution levels lead to resource scarcity and visible degradation, similar to cities experiencing severe smog and environmental decline due to poor regulations.
  - **Negative feedback**: Pollution indicators, such as smog, increase, showing declining sustainability, much like how poor urban planning can lead to visible pollution and declining living conditions.
  - **Citizen dissatisfaction**: Reduced productivity, abandoned buildings, and city decline, similar to urban decay seen in cities that fail to manage resources effectively.

## 10. Out of scope

- **Multiplayer modes**: The game will be single-player only for the mvp and foreseeable future versions.

- **Detailed analytics tracking**: No integration with third-party services or detailed player behavior tracking will be implemented for the mvp.

## 11. Security

- **Data security**: Implement data protection protocols. All saved data must be secure to prevent unauthorized access. Specific measures include data encryption (e.g., AES-256) for all stored player data, secure communication channels (e.g., HTTPS), and regular security audits to identify vulnerabilities.

- **Authentication**: Outline player identification mechanisms if needed, such as profile creation or save encryption. Multi-factor authentication (MFA) may also be considered for added security.

## 12. Glossary

- **Godot**: An open-source game engine used for 2D and 3D game development (source: [Wikipedia](https://en.wikipedia.org/wiki/Godot_(game_engine))).[↩ Back to Context](#1-context)
- **Sustainable city management**: Managing a city in a way that meets the needs of the present without compromising future generations (source: [Wikipedia](https://en.wikipedia.org/wiki/Sustainable_city)).[↩ Back to Context](#1-context)
- **Climate-related decisions**: Decisions that affect or are affected by climate change, focusing on reducing carbon emissions and promoting sustainability (source: [Wikipedia](https://en.wikipedia.org/wiki/Climate_change_mitigation)).[↩ Back to Context](#1-context)
- **City-building**: A genre of simulation games in which players act as the overall planner and leader of a city (source: [Wikipedia](https://en.wikipedia.org/wiki/City-building_game)).[↩ Back to Context](#1-context)
- **MVP (Minimum Viable Product)**: A product with enough features to attract early adopters and validate an idea early in the product development cycle (source: [Wikipedia](https://en.wikipedia.org/wiki/Minimum_viable_product)).[↩ Back to Context](#1-context)
- **Resource management**: The efficient and effective deployment of an organization's resources when they are needed (source: [Wikipedia](https://en.wikipedia.org/wiki/Resource_management)).[↩ Back to Context](#1-context)
- **Pollution tracking**: Monitoring pollution levels to understand environmental health and impacts (source: [Wikipedia](https://en.wikipedia.org/wiki/Pollution)).[↩ Back to Context](#1-context)
- **Solar energy**: Energy from the sun that is converted into thermal or electrical energy (source: [Wikipedia](https://en.wikipedia.org/wiki/Solar_energy)).[↩ Back to Goal / scope](#2-goal--scope)
