;Ejercicio 1. Escriba un programa para restar tres números enteros, usando sólo registros de 16 bits. Inserte las instrucciones necesarias para mostrar los valores de los registros. 
; Ejer1_U3_A1
.model small
.stack 64  
;declaramos la sección de datos
.data
    primero db "Ingrese el primer valor: ",'$'
    segundo db 10,13,"Ingrese el segundo valor: ",'$'
    tercero db 10,13,"Ingrese el tercer valor: ",'$'
    msg4 db 10,13,"El resultado es: ", '$'
    p1 db 0
    p2 db 0
    p3 db 0
    resultado db 0
;declaramos la sección de código
.code
        ;direccionamos al segmentos de datos
        mov ax,@data
        mov ds,ax
        
        ;primer mensaje
        mov ah,09
        lea dx,primero
        int 21h
        ;se lee el primer digito
        mov ah,01
        int 21h
        sub al,30h
        mov p1,al  
        
        ;segundo mensaje
        mov ah,09
        lea dx,segundo
        int 21h
        ;se lee el segundo digito
        mov ah,01
        int 21h
        sub al,30h
        mov p2,al 
        
        ;tercer mensaje
        mov ah,09
        lea dx,tercero
        int 21h
        ;se lee el tercer digito
        mov ah,01
        int 21h
        sub al,30h 
        mov p3,al 
        
        ;operacion
        mov al,p1  ;resta 1
        sub al,p2  ;resta 2
        sub al,p3  ;resta 3
        add al,30h;convierto a caracter
        mov resultado,al 
        mov ah,09
        lea dx,msg4
        int 21h
        
        ;se imprime el caracter con el servicio 02 de la interrupcion 21h
        mov ah,02
        mov dl,resultado
        int 21h
        mov ah,4ch  ;Devuelve el control al equipo
        int 21h
        end