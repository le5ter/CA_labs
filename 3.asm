; Нарисовать прямоугольник заданной ширины и высоты

org 100h
.data
    x dw ?
    count dw 0
    width dw ?
    height dw ?
.code

mov ah, 1
int 21h
sub al, 48
cbw
mov width, ax

mov ah, 1
int 21h
sub al, 48
cbw
mov height, ax

mov ah, 1
int 21h
mov x, ax

mov dx, 0Dh
int 21h

mov cx, width

line:
mov ah, 2
mov dx, x
int 21h
loop line

mov dx, 0Dh
int 21h

mov dx, 10
int 21h

inc count
mov cx, width
mov dx, height
cbw
cmp count, dx
jl line

ret