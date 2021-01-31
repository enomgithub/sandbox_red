Red [
  Title: "example about GUI scripting"
  Author: "enom"
  File: %hello_world_gui.red
  needs: 'view
]

view [
  title "Hello World!"
  label: text "Hello World!"
  name: field
  button "greet" [label/text: rejoin ["Hello " name/text "!"]]
]
