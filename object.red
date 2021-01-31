Red [
  Title: "example about object"
  Author: "enom"
  File: %object.red
]

; object を作成して返す
; 引数を object のキーと同じ名前にすると上手く動かない様子
user: func [name-init [string!] age-init [integer!]][
  make object! [name: name-init age: age-init]
]

; make object! と context は同じ
user-context: func [name-init [string!] age-init [integer!]][
  context [name: name-init age: age-init]
]

enom: user "enom" 3
print rejoin ["name: " enom/name]
print rejoin ["age: " to-string enom/age]

print ""
print "age changed"

; プロパティの上書き
enom/age: 18
print rejoin ["age: " to-string enom/age]

print ""

enom-context: user-context "enom" 18 
print rejoin ["name: " enom-context/name]
print rejoin ["age: " to-string enom-context/age]

print to-string enom = enom-context  ; true
