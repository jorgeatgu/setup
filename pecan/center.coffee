command: "date +\"%a %d %b\""

refreshFrequency: 100000

render: (output) ->
  "<div class='screen'><div class='center'>#{output}</div></div>"
