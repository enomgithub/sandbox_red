Red [
  Title: "example about GUI scripting"
  Author: "enom"
  File: %hello_world_gui.red
  needs: 'view
  icon: %hello_world.ico
]

make-greet: func [greet [string!] name [string!]] [
  either name = ""
    [rejoin [greet "!"]]
    [rejoin [greet " " name "!"]]
]

step: 50

view/flags [
  size 600x600
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
  return
  color-box:
    box
      khaki
      "Drag & Drop"
      loose
      on-up [
        if color-box/offset/x > 500 [color-box/offset/x: 500]
        if color-box/offset/x < 0 [color-box/offset/x: 1]
        if color-box/offset/y > 500 [color-box/offset/y: 500]
        if color-box/offset/y < 0 [color-box/offset/y: 1]
        if (color-box/offset/x <> 1) and (color-box/offset/x % step <> 0)
          [color-box/offset/x: color-box/offset/x / step * step]
        if (color-box/offset/y <> 1) and (color-box/offset/y % step <> 0)
          [color-box/offset/y: color-box/offset/y / step * step]
        color-box/text: mold color-box/offset
      ]
] 'resize
