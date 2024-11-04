# Functional specification template: climate change game project

## 1. Context
- **Current situation**: The team, composed of six members from Algosup, is initiating the development of a serious game using Godot 4.3. This project is part of a six-week educational program aimed at evaluating both the technical skills and understanding of sustainable practices of the team. The game is intended to educate players about sustainable city management and the consequences of climate-related decisions.
- **Background**: Players will engage in city-building and management to understand how their decisions impact the environment. The target audience includes a jury who will evaluate the game at the end of the project, as well as evaluators assessing the overall quality and educational value. The game should be fun, engaging, and capable of conveying important lessons about sustainability in a practical way.

## 2. Goal / scope
- **Primary goal**: Develop a game that simulates real-world environmental challenges to educate users on sustainability practices, focusing on the balance between economic growth and environmental responsibility.
- **Scope of work**:
  - **Includes**:
    - **Resource management**: Players must allocate resources like energy, water, and food while ensuring sustainability.
    - **Pollution tracking**: Pollution levels should be tracked, and players will see the effects of pollution on their city's health and progress.
    - **Educational feedback**: Real-time feedback to help players understand the consequences of their actions and make better decisions for a sustainable city.
    - **Climate-related decision-making**: Players will make choices regarding renewable energy, waste management, and infrastructure to build a sustainable city.
  - **Excludes**:
    - Advanced AI behavior, such as complex simulation of citizens' actions or sophisticated adversaries.
    - Multiplayer features.
    - Integration with external data sources, such as real-time climate data.

- **Priority objectives**:
  - **Promote Renewable Energy Use**: Encourage players to prioritize renewable energy options, such as wind, solar, or hydroelectric power, to minimize the carbon footprint.
  - **Emphasize Waste Management**: Highlight the importance of managing waste and recycling to reduce pollution and resource depletion.
  - **Foster Public Awareness**: Include scenarios that require players to make decisions that increase public awareness and engagement in sustainability.

- **Game complexity**:
  - The game will be designed to be simple to grasp and play, especially in the early phases, with intuitive mechanics. The goal is to have a minimum viable product (MVP) that includes core features like resource allocation, pollution tracking, and basic feedback mechanisms.

- **Target outcomes**:
  - Players should develop an understanding of the importance of balancing city growth with sustainable practices.
  - Players should learn the direct impact of resource choices on pollution and quality of life within their virtual city.
  - Players should leave with a sense of responsibility regarding environmental impacts and potential actions for change.

## 3. Functional requirements
- **Gameplay mechanics**:
  - **Building and upgrades**: Players can place and upgrade various structures that affect resource management.
  - **Resource management**: Players must allocate energy, water, and other resources efficiently.
  - **Pollution control**: The game tracks pollution levels and reflects their impact on gameplay.
  - **Random events**: Climate-related events trigger decisions that influence the player’s progress.
- **UI components**:
  - Interactive dashboard displaying essential metrics (resources, pollution).
  - Notification system for climate events and decision prompts.
- **Player interactions**:
  - **Construction**: Add and modify buildings.
  - **Decision-making**: Respond to climate challenges with choices that affect the city’s state.
  - **Feedback mechanisms**: Receive real-time feedback on sustainability practices through visual and audio cues.

## 4. Acceptance criteria
- **Gameplay verification**:
  - Players can achieve varying scores based on city sustainability.
  - Pollution and resource management accurately reflect player decisions.
- **User interface**:
  - Interactive elements respond as expected (e.g., buttons, notifications).
- **Educational content**:
  - Players receive relevant information about climate impacts during gameplay.

## 5. Design specifications
- **UI layout**: Include a link to mockups or design prototypes.
- **UX elements**: Outline the user experience flow, ensuring it aligns with educational and engagement goals.
- **Visual style**: Use a consistent theme that represents sustainability (e.g., green tones, nature imagery).

## 6. Non-functional requirements
- **Performance**: Ensure the game runs at 60 FPS on typical mid-range devices.
- **Scalability**: Game should handle large-scale city data without lag.
- **Accessibility**: Support adjustable text sizes and colorblind-friendly palettes.

## 7. Out of scope
- **Features not included**:
  - Multiplayer modes.
  - Detailed analytics tracking or integration with third-party services.

## 8. Security
- **Data security**: Implement data protection protocols for user data.
- **Authentication**: Outline any player identification mechanisms if needed.

## 9. Glossary
- **Resource management**: Allocation and monitoring of resources like energy, water, etc.
- **Pollution metric**: A numerical representation of pollution levels that affect gameplay.
