; 5. Escriba un programa que genere 
; y muestre en pantalla 50 aleatorios 
; entre -30 y + 30.


.model small
.stack 100h
.data

msg1 db "El numero aletorio es: $"
msg2 db 0

.code
main proc

mov ax,@data
mov ds, ax

mov ah,09h
mov dx,offset msg1
int 21h

call generarNumAleatorio

mov ah,02h
mov dl,msg2
add dl,'0'
int 21h

mov ah, 4ch
int 21h

main endp

generarNumAleatorio proc

call delay
mov ah,0h
int 1ah

mov ax,dx
mov dx,0
mov bx,10
div bx
mov msg2,dl
ret

generarNumAleatorio endp

delay proc
   mov cx,1
startDelay:
   cmp cx,30000
   JE startDelay
   inc cx
   JMP startDelay

endDelay:
   ret
delay endp

mov ax, 4c00h
int 21h 

end main