;Ejercicio 3. Escriba un programa que defina constantes simbólicas para todos los días de la semana.
;Cree una variable arreglo que utilice los símbolos como inicializadores. Muestre en pantalla los valores del arreglo.

.model small    
.stack 64       
.data           
    Arreglo DB 10,13,'Arreglo: ','$'
    Lunes EQU 10,13,'L'
    Martes EQU 10,13,'M'
    Miercoles EQU 10,13,'M'
    Jueves EQU 10,13,'J'
    Viernes EQU 10,13,'V'
    Sabado EQU 10,13,'S'
    Domingo EQU 10,13,'D','$'
    diaSemana DW (7) dup (Lunes, Martes, Miercoles, Jueves, Viernes, Sabado, Domingo)
    
.code           
    MOV AX,@DATA
    MOV DS,AX

    mov ah, 09
    lea dx, Arreglo; mensaje
    int 21h 

    mov ah, 09
    lea dx, diaSemana; imprimir dias de la semana
    int 21h 

    mov ax,4c00h
    int 21h

    MOV AH,4ch
    INT 21h
END