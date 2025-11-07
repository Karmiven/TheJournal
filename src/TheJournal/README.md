# TheJournal - WoW AddOn

A comprehensive dungeon journal addon for World of Warcraft that tracks attunable items, provides detailed item information, and offers advanced filtering capabilities.

## Features

### Core Features
- **Dungeon Journal Interface**: Browse all dungeons with attunement tracking
- **Item Attunement System**: Track progress on attunable items across all difficulties
- **Friends Integration**: Compare attunement progress with friends
- **Advanced Filtering**: Filter items by type, source count, and difficulty
- **Dynamic Item Data**: Integration with ItemLoc for real-time item source information

### Category 2.0 Dungeon List ✨ NEW ✨
- **Enhanced Filtering System**: Filter dungeons by expansion, difficulty, and search terms
- **Difficulty-Based Filtering**: Show only dungeons with specific difficulties (Normal, Heroic, Mythic, 10N, 10H, 25N, 25H)
- **Dungeon List Refresh**: Clear all caches and reload fresh data with a single click
- **Smart UI**: Filter controls automatically show/hide based on context

#### Filter Options
- **Expansion Filter**: Classic, Burning Crusade, Wrath of the Lich King, or All Expansions
- **Difficulty Filter**: All Difficulties, Normal, Heroic, Mythic, 10-Man Normal, 10-Man Heroic, 25-Man Normal, 25-Man Heroic
- **Search**: Real-time text search through dungeon names
- **Refresh**: Clear all caches and reload fresh data

## Commands

- `/dj report` - Generate and print attunement report
- `/dj debug` - Toggle debug mode
- `/dj factiontooltip` - Toggle faction-specific tooltips
- `/dj clearcache` - Clear friends cache
- `/dj showcache` - Display cached friends data
- `/dj hide <player>` - Hide player from friends list
- `/dj unhide <player>` - Unhide player from friends list
- `/dj refresh` - Refresh dungeon list and clear all caches ✨ NEW ✨

## Installation

1. Download the addon files
2. Extract to your `World of Warcraft/_retail_/Interface/AddOns/` directory
3. Ensure the folder is named `TheJournal`
4. Restart WoW or reload UI

## Usage

### Basic Usage
1. Open the journal with the assigned keybind or through the interface
2. Browse dungeons in the main list
3. Click on a dungeon to view detailed item information
4. Use filters to narrow down items by type, difficulty, or source count

### Category 2.0 Features
1. **Difficulty Filtering**: Click the difficulty filter button (gem icon) to cycle through available difficulties
2. **Refresh Data**: Click the refresh button to clear all caches and reload fresh data
3. **Combined Filtering**: Use multiple filters together for precise results

### Friends Integration
1. Enable friends integration in settings
2. Friends' attunement progress will be displayed alongside your own
3. Use `/dj hide <player>` to hide specific players from the display

## Technical Details

### Caching System
- Smart caching for attunement data to improve performance
- Automatic cache invalidation when data becomes stale
- Manual cache clearing via refresh button or `/dj refresh` command

### Difficulty Support
- **Normal**: Standard dungeon difficulty
- **Heroic**: Heroic dungeon difficulty  
- **Mythic**: Mythic dungeon difficulty
- **10N/10H**: 10-man raid difficulties
- **25N/25H**: 25-man raid difficulties

### Performance Optimizations
- Lazy loading of item data
- Efficient filtering algorithms
- Minimal API calls through smart caching
- Background processing for non-critical operations

## Troubleshooting

### Common Issues
- **Items not showing**: Try using the refresh button or `/dj refresh` command
- **Friends not updating**: Use `/dj clearcache` to clear the friends cache
- **Performance issues**: Ensure you're using the latest version and try refreshing

### Debug Mode
Enable debug mode with `/dj debug` for additional diagnostic information.

## Contributing

This addon is actively maintained. For bug reports or feature requests, please use the appropriate channels.

## Version History

### Latest Version
- **Category 2.0 Dungeon List**: Enhanced filtering system with difficulty-based filtering
- **Dungeon List Refresh**: New refresh functionality to clear caches and reload data
- **Improved UI**: Better labeling and organization of filter controls
- **Performance Improvements**: Optimized filtering and caching systems

---

*TheJournal - Making dungeon progression tracking easier and more efficient.*
