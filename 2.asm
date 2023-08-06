; Вычислить значение X
;      4/a + 5     , если a > b
; X =  28          , если a = b
;      (a³-9)/(b-2), если a < b

.model tiny
org 100h

.data
  a dd 7
  b dd 4
  x dd 0

.code
  mov ax, a
  mov bx, b
  cmp ax, bx
  jg a1
  je a2
  jl a3

a1:
  mov ax, 4
  mov bx, a
  cwd
  idiv bx
  add ax, 5
  mov x, ax
  jmp end

a2:
  mov x, 28
  jmp end

a3:
  mov bx, a
  imul bx
  imul bx
  cwd
  sub ax, 9
  mov bx, b
  sub bx, 2
  cwd
  idiv bx
  mov x, ax
  jmp end

end:
ret