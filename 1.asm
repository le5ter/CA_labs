; Вычислить значение выражения (2*b - a + b/c)/(c/4+1)
; a = 1, b = 12, c = 4 result = 13
; a = 5, b = 8, c = -8 result = -10

.model	tiny
org 100h

.data
  a dw 5
  b dw 8
  c dw -8
  result1 dw 0
  result dw 0

.code
  ; --------------------
  ; (c/4 +1)
  ; --------------------
  mov ax, c
  mov bx, 4
  cwd
  idiv bx
  inc ax
  ; --------------------
  ; result1: (c/4 + 1)
  ; --------------------
  mov result1, ax ;


  ; --------------------
  ; result: (2*b - a + b/c)
  ; --------------------
  mov ax, b
  mov bx, 2
  imul bx
  sub ax, a
  push ax
  mov ax, b
  mov bx, c
  cwd
  idiv bx
  pop bx
  add ax, bx
  ; --------------------
  ; (2*b - a + b/c)/(c/4 + 1)
  ; --------------------
  mov bx, result1
  cwd
  idiv bx
  mov result, ax
ret