; Найти, сколько положительных, отрицательных, и нулевых элементов в массиве A = {a[i]}
; удовлетворяют условию: c <= a[i] <= d

org 100h
.model tiny

.data
arr dd -2, -1, 0, 2, 5, 5, 7
c dd -3
d dd 3
res dw 0

.code
mov bx, 0
mov cx, 0
mov dx, 28 ; 7 - elements, 4 - byte

@start:
cmp bx, dx
je @exit
;============================
mov ax,word ptr[arr[bx]+2]
jmp @first
;============================
@first:
cmp ax,word ptr[c+2]
je @first1
jl @again
jg @second
;============================
@first1:
mov ax,word ptr[arr[bx]]
cmp ax,word ptr[c]
jge @second
jl @again
;============================
@second:
mov ax,word ptr[arr[bx]+2]
cmp ax,word ptr[d+2]
je @second2
jg @again
jl @addcounter
;============================
@second2:
mov ax,word ptr[arr[bx]]
cmp ax,word ptr[d]
jg @again
jle @addcounter
;============================
@addcounter:
inc cx
jmp @again
;============================
@again:
add bx, 4
jmp @start
;============================
@exit:
mov res, cx

ret
end
