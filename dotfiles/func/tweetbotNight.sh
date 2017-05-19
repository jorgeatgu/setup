### Theme night Tweetbot

function tweetbotNight() {
  cd /Applications/Tweetbot.app/Contents/Resources &&
  sudo rm -rf Colors.plist &&
  curl -O "https://raw.githubusercontent.com/lucifr/Tweetbot-for-Mac-ColorScheme/master/Night/Colors.plist" &&
  osascript -e '
  tell application "Tweetbot" to quit
  tell application "Tweetbot" to activate
  '
}
