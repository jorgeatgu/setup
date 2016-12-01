command: "ESC=`printf \"\e\"`; ps -A -o %mem | awk '{s+=$1} END {print \"\" s}'"

refreshFrequency: 30000 # ms

render: (output) ->
  """
  <svg style="display: inline-block; vertical-align: middle;" fill="#9C9487" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
      <path d="M19 3H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zM9 17H7v-7h2v7zm4 0h-2V7h2v10zm4 0h-2v-4h2v4z"/>
      <path d="M0 0h24v24H0z" fill="none"/>
  </svg>
  <span>#{output}</span>
  """

style: """
  -webkit-font-smoothing: antialiased
  color: #D5C4A1
  font: 14px SF Mono
  right: 300px
  top: 10px
  span
    color: #9C9486
"""
