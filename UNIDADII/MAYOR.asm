;Ejercicio_A1_U2
;Realizar un programa en lenguaje ensamblador que lea dos números, despliegue un mensaje indicando que número es el mayor de los dos.

.model small
.stack
.data

   msg1 db 'Primer valor: $'
   msg2 db 'Segundo valor: $'
   msg3 db 'El primer numero es mayor$'
   msg4 db 'El segundo numero es mayor$'
   
   salto DB 10,13,'$'
   Ent1 db ?
   Ent2 db ?

.code
.startup
 
   MOV AX,@DATA
   MOV DS,AX

   ; pide primer valor
   mov ah,09h
   lea dx,msg1
   int 21h

   mov ah,07h
   int 21h

   mov ah, 02h
   mov dl,al
   int 21h
   mov  Ent1,al

   MOV AH,9
   LEA DX,salto
   INT 21H

   ; pide segundo valor
   mov ah,09h
   lea dx,msg2
   int 21h

   mov ah,07h
   int 21h

   mov ah,02h
   mov dl,al
   int 21h
   mov Ent2,al

   MOV AH,9
   LEA DX,salto
   INT 21H

   ;comparación
   mov al,Ent1
   cmp al,Ent2
   ja mayor
   jb menor

mayor:  
   mov ah,09h
   lea dx,msg3
   int 21h
   jmp salir

menor:
   mov ah,09h
   lea dx,msg4
   int 21h
   jmp salir

salir:
  .exit
   end
