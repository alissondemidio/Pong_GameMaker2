# Pong Game - GameMaker Studio 2

A classic Pong game implementation built with GameMaker Studio 2, featuring single-player and two-player modes, AI opponent, and smooth gameplay mechanics.

## About the Game

This is a modern take on the classic Pong arcade game. Players control paddles (goalies) on either side of the screen, trying to hit a ball back and forth. The goal is to score points by making the ball pass through the opponent's side. The game ends when a player reaches 5 points.

### Features

- **Single Player Mode**: Play against an AI opponent with adjustable difficulty
- **Two Player Mode**: Local multiplayer for competitive gameplay
- **Dynamic Ball Physics**: Ball speed increases with each collision for more intense gameplay
- **Visual Effects**: Animated eyes that track the ball movement
- **Sound Effects**: Bounce sounds and background music
- **Score System**: First to 5 points wins
- **Smooth Controls**: Responsive keyboard controls for both players

### Game Mechanics

- Ball speed starts at 5 and increases by 0.5 with each collision
- Maximum ball speed is capped at 25 to maintain playability
- Ball resets to center after each point with a 1-second delay
- AI opponent has slight imperfection to make it beatable
- Game automatically returns to menu when a player reaches 5 points

## Requirements

- **GameMaker Studio 2** (version 2022.0.3.85 or compatible)
- Windows, macOS, or Linux for development

## Building the Game

### Opening the Project

1. Launch GameMaker Studio 2
2. Click **File** → **Open Project**
3. Navigate to the project directory and select `Pong.yyp`
4. The project will load with all resources and objects

### Running the Game

1. Press **F5** or click the **Run** button in the toolbar
2. The game will compile and launch in a test window
3. Use the menu to select 1 or 2 players and start playing

### Building for Different Platforms

The project includes platform-specific options for:

- **Windows**: `options/windows/options_windows.yy`
- **macOS**: `options/mac/options_mac.yy`
- **Linux**: `options/linux/options_linux.yy`
- **HTML5**: `options/html5/options_html5.yy`
- **Android**: `options/android/options_android.yy`
- **iOS**: `options/ios/options_ios.yy`
- **tvOS**: `options/tvos/options_tvos.yy`
- **OperaGX**: `options/operagx/options_operagx.yy`

To build for a specific platform:

1. Go to **Build** → **Create Executable**
2. Select your target platform
3. Configure platform-specific settings if needed
4. Click **Build** to create the executable

### Project Structure

```
Pong_GameMaker2/
├── objects/              # Game objects (ball, goalie, buttons, etc.)
│   ├── obj_ball/        # Ball object with collision and movement
│   ├── obj_goalie/     # Paddle/goalie object with controls
│   ├── obj_score/       # Score tracking and game end logic
│   ├── obj_eyeball/     # Visual effect that tracks the ball
│   ├── obj_audio_controller/  # Background music controller
│   ├── obj_start_button/       # Start game button
│   └── obj_player_button/      # Player count toggle button
├── rooms/               # Game rooms
│   ├── rm_initial/     # Main menu room
│   └── rm_game/         # Gameplay room
├── scripts/            # Game scripts
│   └── scr_gamerules/   # Global game variables initialization
├── sprites/            # Visual assets
│   ├── spr_ball/       # Ball sprite
│   ├── spr_goalie/     # Paddle sprite
│   ├── spr_wall/       # Wall sprite
│   ├── spr_background/ # Background sprite
│   └── ...
├── sounds/             # Audio assets
│   ├── snd_bounce/     # Ball collision sound
│   ├── snd_score/      # Score sound effect
│   └── snd_background_music/  # Background music
└── options/            # Platform-specific build options
```

## Controls

### Single Player Mode
- **Player 1 (Left)**: 
  - `W` - Move up
  - `S` - Move down
- **Player 2 (Right)**: AI-controlled

### Two Player Mode
- **Player 1 (Left)**:
  - `W` - Move up
  - `S` - Move down
- **Player 2 (Right)**:
  - `↑` (Up Arrow) - Move up
  - `↓` (Down Arrow) - Move down

### Menu Controls
- **Mouse**: Click buttons to interact
  - Click "Start" button to begin game
  - Click player count button to toggle between 1 and 2 players

## Adding Features to the Game

### Adding New Objects

1. In GameMaker Studio 2, right-click on **Objects** in the resource tree
2. Select **Create** → **Object**
3. Name your object (e.g., `obj_powerup`)
4. Assign a sprite if needed
5. Add events (Create, Step, Draw, etc.) by right-clicking in the object editor
6. Write your GML code in the event editor

**Example**: Adding a power-up object
```gml
// In Create event
powerup_type = choose(0, 1, 2);  // Random power-up type
lifetime = 300;  // 5 seconds at 60 FPS

// In Step event
lifetime--;
if (lifetime <= 0) {
    instance_destroy();
}
```

### Adding New Sprites

1. Right-click on **Sprites** in the resource tree
2. Select **Create Sprite**
3. Click **Edit Image** to import or create your sprite
4. Configure sprite settings (origin point, collision mask, etc.)
5. Assign the sprite to objects that need it

### Adding New Sounds

1. Right-click on **Sounds** in the resource tree
2. Select **Create Sound**
3. Click **Edit Sound** to import your audio file
4. Configure sound settings (compression, type, etc.)
5. Use in code: `audio_play_sound(snd_your_sound, priority, loop);`

**Example**: Playing a sound effect
```gml
// Play sound with priority 1, no loop
audio_play_sound(snd_your_sound, 1, false);
```

### Adding New Rooms

1. Right-click on **Rooms** in the resource tree
2. Select **Create Room**
3. Set room dimensions and properties
4. Add instances of objects to the room
5. Use `room_goto(rm_your_room);` to switch rooms

### Modifying Game Rules

Edit `scripts/scr_gamerules/scr_gamerules.gml` to change:
- Ball speed: `global.ballspeed = 5;`
- Maximum ball speed: `global.ballmaxspeed = 25;`
- Player speed: `global.playerspeed = 5;`
- Win condition: Modify the score check in `obj_score/Step_0.gml`

**Example**: Changing win condition to 10 points
```gml
// In obj_score/Step_0.gml
if (!global.game_over &&
    (global.score_player_one >= 10 || global.score_player_two >= 10)) {
    // ... rest of code
}
```

### Adding New Game Mechanics

#### Power-ups Example

1. Create a new object `obj_powerup`
2. Add collision detection in `obj_ball/Collision_obj_powerup.gml`:
```gml
// Apply power-up effect
if (powerup_type == 0) {
    // Speed boost
    speed *= 1.5;
} else if (powerup_type == 1) {
    // Slow motion
    speed *= 0.7;
}

// Destroy power-up
instance_destroy();
```

3. Spawn power-ups in the game room at intervals

#### New Visual Effects

1. Create a new object for the effect
2. Use Draw events to create custom visuals:
```gml
// In Draw event
draw_set_alpha(0.5);
draw_circle(x, y, radius, false);
draw_set_alpha(1);
```

### Modifying AI Difficulty

Edit `objects/obj_goalie/Step_0.gml` to adjust AI behavior:

- **Easier AI**: Increase `reaction_offset` range or decrease `move_speed`
- **Harder AI**: Decrease `reaction_offset` range or increase `move_speed`
- **Perfect AI**: Remove `reaction_offset` entirely

**Example**: Making AI easier
```gml
// Increase imperfection range
reaction_offset = lerp(reaction_offset, random_range(-40, 40), 0.02);
// Slower movement
move_speed = 3;
```

### Adding New Controls

1. Add a Keyboard event to `obj_goalie`:
   - Right-click on the object → **Add Event** → **Keyboard**
   - Select the key you want to use
   - Add movement code:
```gml
// Example: Space bar for special move
if (player == 1) {
    // Perform special action
}
```

### Code Style Guidelines

- All GML scripts are fully commented
- Use descriptive variable names
- Follow the existing code structure
- Add comments explaining complex logic
- Use global variables for game-wide settings (defined in `scr_gamerules`)

## Troubleshooting

### Game won't compile
- Check that all referenced sprites and sounds exist
- Verify room creation code doesn't have syntax errors
- Ensure all global variables are initialized in `scr_gamerules`

### Ball gets stuck
- Check collision masks on ball and goalie objects
- Verify collision events are properly set up
- Ensure `move_bounce_solid()` is being called correctly

### Sounds not playing
- Check audio file formats (OGG, WAV supported)
- Verify sound priority settings
- Ensure audio controller object exists in the room

## License

See LICENSE file for details.

## Contributing

Feel free to fork this project and add your own features! Some ideas:
- Power-ups and special abilities
- Different game modes (time attack, survival, etc.)
- Online multiplayer
- Particle effects
- Custom themes and skins
- Leaderboard system
