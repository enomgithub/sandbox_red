Red [
  Title: "example about GUI scripting"
  Author: "enom"
  File: %hello_world_gui.red
  needs: 'view
  icon: %hello_world.ico
]

make-greet: func [greet [string!] name [string!]] [
  rejoin [greet " " name "!"]
]

current-greet: "Hello" 
view/flags [
  size 600x200
  title "Hello World!"
  greet-label:
    text
      "Good afternoon World!"
      font-size 10
      font-name "arial"
  return
  greet-list:
    drop-list
      select 1
      data [
        "Hello"
        "Good morning"
        "Good afternoon"
        "Good evening"
      ]
      on-change [
        greet-label/text:
          make-greet
            pick face/data face/selected
            name/text
      ]
  name:
    field
      40
      default "World"
      react [
        greet-label/text:
          make-greet
            pick greet-list/data greet-list/selected
            name/text
      ]
] 'resize
