# Green City: Functional Specification Document

## I. Table of contents

- [Team members](#team-members)
- [I. Context](#i-context)
  - [Target audience personas](#1-target-audience-personas)
  - [Use cases](#2-use-cases)
- [II. Goal / scope](#ii-goal--scope)
  - [MVP scope](#1-mvp-scope)
  - [Future vision scope](#2-future-vision-scope)
  - [Priority objectives](#3-priority-objectives)
- [III. Functional requirements](#iii-functional-requirements)
  - [Gameplay mechanics](#1-gameplay-mechanics)
  - [UI components](#2-ui-components)
  - [Player interactions](#3-player-interactions)
- [IV. Dependencies and priorities](#iv-dependencies-and-priorities)
- [V. Acceptance criteria](#v-acceptance-criteria)
- [VI. Design specifications](#vi-design-specifications)
- [VII. Non-functional requirements](#vii-non-functional-requirements)
- [VIII. Win / lose conditions](#viii-win--lose-conditions)
- [IX. Impact of management on gameplay](#ix-impact-of-management-on-gameplay)
- [X. Out of scope](#x-out-of-scope)
- [XI. Security](#xi-security)
- [XII. Glossary](#xii-glossary)

## II. Team members

| Role              | Member name        | Responsibilities                                                              |
| ----------------- | ------------------ | ----------------------------------------------------------------------------- |
| Project manager   | Bistrel Tsangue    | Oversees project progress and ensures deadlines are met.                      |
| Program manager   | Guillaume Deramchi | Manages program implementation, coordinates with stakeholders.                |
| Technical lead    | Lucas Aubard       | Leads the technical direction and supervises the development team.            |
| Software engineer | Victor Leroy       | Develops game features and ensures code quality.                              |
| Software engineer | Manech Laguens     | Implements gameplay mechanics and collaborates on technical tasks.            |
| QA tester         | Habi Cailleau      | Tests the game for bugs and ensures quality standards are met.                |
| Technical writer  | Jason Grosso       | Documents features, creates user guides, and maintains project documentation. |

---

## I. Context

- **Current situation**: "Green City" is an ongoing project aimed at creating an engaging and educational serious game about climate change. Built on [Godot 4.3](#xii-glossary), it leverages game mechanics to simulate urban sustainability challenges. The project seeks to deliver a polished, professional product that combines education and entertainment.

- **Background**: The game integrates elements of city-building and climate education. Players will face realistic challenges such as transitioning from fossil fuels to renewable energy, managing city resources efficiently, and minimizing carbon emissions. The primary audience includes young adults (ages 15–25), educators in environmental science, and individuals interested in sustainability.

### 1. Target audience personas

The following personas represent key player types for Green City:

---

#### Persona 1: Sarah, the concerned parent

| **Attribute**        | **Details**                                                                 |
|-----------------------|-----------------------------------------------------------------------------|
| **Age**              | 42                                                                          |
| **Occupation**       | Elementary school teacher                                                  |
| **Location**         | Chicago, USA                                                               |
| **Tech-savviness**   | Moderate, uses apps and games occasionally                                |
| **Goals**            | - Teach her children eco-friendly habits.                                   |
|                       | - Learn practical ways to reduce her family's carbon footprint.            |
| **Pain points**      | - Overwhelmed by conflicting information about sustainability.              |
|                       | - Finds most climate education tools too complex or dry.                  |
| **Motivation**       | - Play Green City with her kids as a bonding activity.                      |
|                       | - Discover actionable steps for greener living.                           |

---

#### Persona 2: Alex, the pragmatic entrepreneur

| **Attribute**        | **Details**                                                                 |
|-----------------------|-----------------------------------------------------------------------------|
| **Age**              | 35                                                                          |
| **Occupation**       | Owner of a small tech startup                                              |
| **Location**         | Berlin, Germany                                                           |
| **Tech-savviness**   | High, frequently uses digital tools and games for learning                |
| **Goals**            | - Understand how sustainability impacts business growth.                   |
|                       | - Learn innovative strategies for reducing energy costs.                  |
| **Pain points**      | - Struggles to balance profit and environmental responsibility.             |
|                       | - Feels climate change discussions are often too idealistic.              |
| **Motivation**       | - Explore practical solutions to energy and waste management.              |
|                       | - Simulate real-world decision-making in a fun environment.              |

---

#### Persona 3: Leila, the passionate student

| **Attribute**        | **Details**                                                                 |
|-----------------------|-----------------------------------------------------------------------------|
| **Age**              | 19                                                                          |
| **Occupation**       | Environmental science major                                               |
| **Location**         | Rabat, Morocco                                                            |
| **Tech-savviness**   | Intermediate, uses technology for research and casual gaming              |
| **Goals**            | - Gain deeper insights into how cities contribute to climate change.        |
|                       | - Use knowledge from Green City for her studies and activism.              |
| **Pain points**      | - Finds traditional academic tools uninspiring.                            |
|                       | - Wants engaging ways to learn while having fun.                          |
| **Motivation**       | - Test strategies for reducing urban emissions in a risk-free environment.  |
|                       | - Advocate for sustainability using lessons from the game.               |

---

#### Persona 4: Mark, the climate skeptic

| **Attribute**        | **Details**                                                                 |
|-----------------------|-----------------------------------------------------------------------------|
| **Age**              | 50                                                                          |
| **Occupation**       | Construction manager                                                      |
| **Location**         | Houston, USA                                                              |
| **Tech-savviness**   | Low, mostly uses technology for work-related purposes                     |
| **Goals**            | - Prove that concerns about climate change are exaggerated.                |
|                       | - Understand the game’s perspective on environmental issues.              |
| **Pain points**      | - Believes climate change data is often biased or alarmist.                |
|                       | - Prefers practical, measurable solutions over theoretical debates.       |
| **Motivation**       | - Challenge his views through gameplay scenarios.                          |
|                       | - See if the game’s mechanics reflect his perspective of economic growth. |

---

### 2. Use cases

The following use cases illustrate how different personas interact with Green City, highlighting the game’s educational and engaging aspects:

---

#### Use Case 1: Sarah, the concerned parent

| **Attribute**        | **Details**                                                                 |
|-----------------------|-----------------------------------------------------------------------------|
| **Goal**             | Teach her children about eco-friendly habits in an interactive way.         |
| **Steps**            | 1. Sarah starts a new game with her 10-year-old child, selecting the "Beginner" difficulty level. |
|                       | 2. Together, they build a small city, starting with renewable energy sources like solar panels. |
|                       | 3. They encounter scenarios such as a budget deficit, where they must choose between cheaper fossil fuels or maintaining green energy. |
|                       | 4. They explore pollution indicators, watching how decisions like adding a park reduce smog and improve city health. |
|                       | 5. The game provides feedback on how these choices relate to real-world climate impacts. |
| **Outcome**          | - Sarah and her child learn about the importance of renewable energy and urban greenery. |
|                       | - The game sparks conversations about practical eco-friendly steps they can take at home. |

---

### Use Case 2: Alex, the pragmatic entrepreneur

| **Attribute**        | **Details**                                                                 |
|-----------------------|-----------------------------------------------------------------------------|
| **Goal**             | Explore strategies for balancing business growth with sustainability.       |
| **Steps**            | 1. Alex selects the "Advanced" difficulty level for a more challenging simulation. |
|                       | 2. He prioritizes building industrial zones to generate revenue for his city but quickly sees pollution levels rise. |
|                       | 3. To mitigate this, Alex invests in green technology upgrades for factories and introduces a recycling program. |
|                       | 4. He experiments with policies such as carbon taxes and public awareness campaigns to balance growth and emissions. |
|                       | 5. Through trial and error, Alex optimizes his city’s financial and environmental health. |
| **Outcome**          | - Alex gains insights into the challenges of implementing green policies in a business environment. |
|                       | - He discovers how small investments in sustainability can lead to long-term economic benefits. |

---

### Use Case 3: Leila, the passionate student

| **Attribute**        | **Details**                                                                 |
|-----------------------|-----------------------------------------------------------------------------|
| **Goal**             | Understand the impact of urban planning decisions on climate change for her environmental science project. |
| **Steps**            | 1. Leila begins with the "Intermediate" difficulty to explore a realistic city-building experience. |
|                       | 2. She builds a city focused on renewable energy, including solar farms and wind turbines, to minimize emissions. |
|                       | 3. She uses the carbon meter to track how urban sprawl and energy choices increase the city’s emissions. |
|                       | 4. When a scenario introduces severe weather due to climate change, she learns about the importance of mitigation strategies like tree planting and improved public transit. |
|                       | 5. Leila uses the game’s data-driven feedback to write a detailed report for her class project. |
| **Outcome**          | - Leila deepens her understanding of climate systems and their connection to urban development. |
|                       | - She uses screenshots and in-game data to support her academic presentation. |

---

### Use Case 4: Mark, the climate skeptic

| **Attribute**        | **Details**                                                                 |
|-----------------------|-----------------------------------------------------------------------------|
| **Goal**             | Test the validity of climate change claims through gameplay.                |
| **Steps**            | 1. Mark plays the game on "Beginner" difficulty, skeptical of its premise.  |
|                       | 2. He initially ignores renewable energy options, relying solely on coal and oil to minimize costs and maximize city expansion. |
|                       | 3. As pollution levels rise, he sees the game introduce visible consequences like smog, health warnings, and citizen dissatisfaction. |
|                       | 4. Curious, he tries introducing green policies like solar energy and public transit to test their impact. |
|                       | 5. He compares the financial trade-offs and benefits, finding that sustainable policies eventually lead to a balanced budget and improved citizen satisfaction. |
| **Outcome**          | - Mark gains a clearer understanding of the economic and social costs of pollution. |
|                       | - While not fully convinced, he acknowledges the benefits of renewable energy and efficient resource management. |

---

- **Initial MVP focus**: The [MVP](#xii-glossary) will focus on core gameplay, including [resource management](#xii-glossary), [pollution tracking](#xii-glossary), and city-building. The goal is to lay a foundation that can be expanded to achieve the full game vision. The MVP will act as a proof of concept demonstrating key sustainable city-building mechanics, such as balancing energy production with pollution control to maintain a healthy environment while ensuring economic growth.

## II. Goal / scope

- **Primary goal**: Develop a game that simulates environmental challenges to educate young adults and students on sustainability. Players must balance economic development with sustainable practices, making choices that prioritize long-term environmental health. Players will need to decide whether to build industrial facilities that boost the economy but increase pollution. Alternatively, they can invest in renewable energy sources, which cost more initially but lead to long-term sustainability.

- **Scope of work**:

### 1. MVP scope

- **Resource management**: Players allocate renewable (e.g., solar energy) and non-renewable (e.g., fossil fuel) resources while managing the city’s finances.
- **Pollution tracking**: Pollution levels will be visually represented to show the city's health and the impact of player decisions over time.
- **Educational feedback**: Visual feedback (pollution indicators, health bars) helps players understand the consequences of their actions.
- **Simple decision-making**: Players make straightforward decisions regarding renewable energy, waste management, and city expansion.

### 2. Future vision scope

- **Advanced resource management**: Introduce more complex resource types (e.g., food, advanced energy systems).
- **Pollution mitigation**: Advanced tools to reduce pollution, like tree planting, public transit, and waste management systems.
- **Complex decision-making**: Balancing industrial growth, environmental sustainability, and citizen satisfaction.

### 3. Priority objectives

- **Promote renewable energy**: Encourage players to prioritize renewable energy to minimize the carbon footprint.
- **Emphasize waste management**: Highlight managing waste through recycling, composting, and waste-to-energy plants.
- **Foster public awareness**: Include public campaigns to raise awareness about sustainability.

- **Game complexity**: The game will be simple to grasp, with intuitive mechanics suitable for all ages. The MVP will focus on core features like resource allocation and pollution tracking, while future versions will expand these features for more depth.

- **Target outcomes**:

  - Players understand the importance of balancing city growth with sustainable practices.
  - Players learn the impact of resource choices on pollution, quality of life, and growth.
  - Players develop a sense of responsibility regarding environmental impacts.

## III. Functional requirements

### 1. Gameplay mechanics

#### a. MVP

- **Building placement**: Players place basic structures (e.g., residential buildings, power plants, parks).
- **Resource management**: Players allocate energy resources and manage budgets effectively.
- **Pollution control**: Pollution levels are visually represented through indicators like smog and reduced greenery.

#### b. Future vision

- **Building upgrades**: Players upgrade buildings to improve efficiency (e.g., reducing energy consumption).
- **Dynamic pollution control**: Advanced tools like public transit and green technologies reduce pollution levels.

### 2. UI components

#### a. MVP

- **Simple dashboard**: Displays essential metrics like energy consumption, financial status, and pollution levels.

#### b. Future vision

- **Detailed notifications**: Prompts and messages guide players through complex decisions.
- **Advanced visual indicators**: Charts and graphs provide comprehensive feedback (e.g., pollution trends, energy usage over time).

### 3. Player interactions

#### a. MVP

- **Construction**: Players place and remove basic buildings.
- **Basic decision-making**: Players decide on energy use, construction, and waste management.
- **Feedback mechanisms**: Visual cues (e.g., changes in city aesthetics) help players understand their impact.

#### b. Future vision

- **Advanced construction**: Players upgrade buildings for increased efficiency.
- **Complex decision-making**: Players balance economic growth, environmental health, and citizen satisfaction.
- **Enhanced feedback**: Audio cues and detailed notifications provide deeper insights.

## IV. Dependencies and priorities

- **Feature dependencies**:

  - **Building upgrades** require basic building placement and resource allocation.
  - **[Dynamic pollution control](#xii-glossary)** requires basic pollution tracking.

- **Feature priorities**:

  - **High priority**: Building placement, resource management, pollution tracking, and educational feedback.
  - **Medium priority**: Building upgrades, complex decision-making.
  - **Low priority**: Dynamic pollution control, enhanced feedback.

## V. Acceptance criteria

- **Gameplay verification**:

  - Players can place buildings, allocate resources, and track pollution.
  - Players achieve varying levels of success based on management of resources and pollution.

- **User interface**:

  - **MVP**: The UI must be intuitive, with responsive elements like buttons and dashboards.
  - **Future vision**: The UI must provide advanced feedback and clear indicators.

- **Educational content**:

  - Players receive relevant information about environmental impacts.

## VI. Design specifications

- **UI layout**: Mockups or design prototypes should illustrate MVP and future UI versions. The MVP should have a clean layout focusing on ease of navigation.

- **UX elements**: The user experience should prioritize accessibility and engagement. The MVP will offer a linear flow, while the future version may include branching decisions and tutorials.

- **Visual style**: Use a consistent theme representing sustainability. Green and blue tones dominate the palette, with red for pollution and warnings. Icons should intuitively represent buildings, energy, and pollution.

## VII. Non-functional requirements

- **Performance**: Ensure the game runs smoothly at 60 FPS on mid-range devices.

- **[Scalability](#xii-glossary)**: The game must handle large-scale city data without issues. The MVP introduces base data management, while future versions implement optimizations.

- **Accessibility**: Adjustable text sizes, colorblind-friendly palettes, and simplified UI modes for younger audiences or those with impairments.

## VIII. Win / lose conditions

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

## IX. Impact of management on gameplay

- **Good management**:
  - **Steady growth**: Players receive more income for further development, similar to how cities with strong policies on renewable energy and efficient infrastructure see economic growth over time.
  - **Positive feedback**: The city becomes greener, with visual indicators of progress, much like how cities that invest in public parks and green spaces often see improved quality of life.

- **Poor management**:
  - **Deterioration**: Rising pollution levels lead to resource scarcity and visible degradation, similar to cities experiencing severe smog and environmental decline due to poor regulations.
  - **Negative feedback**: Pollution indicators, such as smog, increase, showing declining sustainability, much like how poor urban planning can lead to visible pollution and declining living conditions.
  - **Citizen dissatisfaction**: Reduced productivity, abandoned buildings, and city decline, similar to urban decay seen in cities that fail to manage resources effectively.

## X. Out of scope

- **Multiplayer modes**: The game will be single-player only for the MVP and foreseeable future versions.

- **Detailed analytics tracking**: No integration with third-party services or detailed player behavior tracking will be implemented for the MVP.

## XI. Security

- **Data security**: Implement data protection protocols. All saved data must be secure to prevent unauthorized access. Specific measures include data encryption (e.g., AES-256) for all stored player data, secure communication channels (e.g., HTTPS), and regular security audits to identify vulnerabilities.

- **[Authentication](#xii-glossary)**: Outline player identification mechanisms if needed, such as profile creation or save encryption. Multi-factor authentication (MFA) may also be considered for added security.

## XII. Glossary

- **Godot**: An open-source game engine used for 2D and 3D game development (source: [Wikipedia](https://en.wikipedia.org/wiki/Godot_(game_engine))).[↩ Back to Context](#i-context)

- **MVP (Minimum Viable Product)**: A product version with the minimum features necessary to test an idea and attract early adopters for feedback (source: [Wikipedia](https://en.wikipedia.org/wiki/Minimum_viable_product)).[↩ Back to Goal / scope](#ii-goal--scope)

- **Resource management**: The process of efficiently allocating resources such as energy and materials within the game to achieve goals (source: [Wikipedia](https://en.wikipedia.org/wiki/Resource_management)).[↩ Back to Goal / scope](#ii-goal--scope)

- **Pollution tracking**: Monitoring and visual representation of pollution levels in the game to show the impact of player decisions (source: [Wikipedia](https://en.wikipedia.org/wiki/Pollution)).[↩ Back to Goal / scope](#ii-goal--scope)

- **Dynamic pollution control**: In-game tools and methods to actively manage and reduce pollution levels, such as public transit or advanced green technologies (source: [Wikipedia](https://en.wikipedia.org/wiki/Pollution_control)).[↩ Back to Functional requirements](#iii-functional-requirements)

- **Scalability**: The ability of the game to handle increasing complexity or larger datasets without performance degradation (source: [Wikipedia](https://en.wikipedia.org/wiki/Scalability)).[↩ Back to Non-functional requirements](#vii-non-functional-requirements)

- **Authentication**: Mechanisms to verify player identity, which may include profile creation or encryption to secure game progress (source: [Wikipedia](https://en.wikipedia.org/wiki/Authentication)).[↩ Back to Security](#xi-security)

