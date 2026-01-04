/// @description Check if running on mobile/touch device
/// @returns {bool} True if device is mobile/touch capable
// Detects if the game is running on a mobile or touch-enabled device
// Only checks OS type to avoid false positives on desktop

var is_touch = false;

// Check if device is a known mobile platform
// Only Android and iOS are considered mobile (not screen size, as game room is small)
if (os_type == os_android || os_type == os_ios) {
    is_touch = true;
}

return is_touch;

