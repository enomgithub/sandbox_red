Red [
  Title: "example about GUI scripting"
  Author: "enom"
  File: %hello_world_gui.red
  needs: 'view
  icon: %hello_world.ico
]

#include %config/config.red

make-greet: func [greet [string!] name [string!]] [
  either name = ""
    [rejoin [greet "!"]]
    [rejoin [greet " " name "!"]]
]

move-by-step: func [offset [integer!] step [integer!]] [ 
  if (offset % step) <> 0 [
    either (offset % step) < (step / 2) [
      offset / step * step
    ] [
      (offset / step + 1) * step
    ]
  ]
]

clamp: func [value [integer!] min-value [integer!] max-value [integer!]] [
  max min-value (min value max-value)
]

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
  color-box-kahki:
    box
      khaki
      "Drag & Drop"
      loose
      on-up [
        color-box-kahki/offset/x:
          clamp
            (move-by-step color-box-kahki/offset/x config/step)
            config/min-value
            config/max-value
        color-box-kahki/offset/y:
          clamp
            (move-by-step color-box-kahki/offset/y config/step)
            config/min-value
            config/max-value
        color-box-kahki/text: mold color-box-kahki/offset
      ]
  color-box-green:
    box
      green
      "Drag & Drop"
      loose
      on-up [
        color-box-green/offset/x:
          clamp
            (move-by-step color-box-green/offset/x config/step)
            config/min-value
            config/max-value
        color-box-green/offset/y:
          clamp
            (move-by-step color-box-green/offset/y config/step)
            config/min-value
            config/max-value
        color-box-green/text: mold color-box-green/offset
      ]
] 'resize
