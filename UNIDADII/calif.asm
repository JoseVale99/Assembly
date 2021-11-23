
; Programa: El programa recibirá una una calificación, y mostrará el mensaje
; aprobado o reprobado según sea el caso. Compartir la captura de pantalla del 
; código implementado y la captura del resultado de la ejecución.

org 100h

.model small

.stack 64

.data ;seccion de variables

    msg1 db 'Dame una calificacion(seguida de un enter): $'

    aprobado db 13,10, 'APROBADO.$'

    reprobado db 13,10, 'REPROBADO$'

    VAR1 dw ?, '$'

    VAR2 dw ?, '$' 

    VAR3 dw ?, '$'

.code ;inicia el segmento de codigo 

Resultado PROC FAR ;procedimiento

    mov ax,@DATA ; como inicio

    mov ds, ax

;----------------desplegar primer mensaje

    mov ah, 09

    lea dx, msg1

    int 21h 

;----------------pedir un caracter

    mov ah, 01

    int 21h

    mov VAR1,ax

;----------------pedir segundo caracter

    mov ah, 01

    int 21h

    mov VAR2,ax

;----------------tercer caracter

    mov ah, 01

    int 21h

    mov VAR3,ax

;-----momento de evaluar la calificacion

    CMP al, 13  ; para comparar  

    JE CONTINUE ;salta si es iguala 13

    JMP MAYOR   ;salta 

;----INICIA FUNCION



CONTINUE:  

    mov ax, VAR1 ;valor tomado para comparar

    CMP AL, 037h ;7 es 37 en ASCII

    JGE MAYOR   ; salta si es mayor o igual a 7 va a 'mayor'

    JMP MENOR    

MAYOR:

    mov ah, 09

    lea dx,aprobado

    int 21h

    JMP SALIR        

MENOR:

    mov ah, 09

    lea dx,reprobado

    int 21h

    JMP SALIR      

SALIR:

    mov ax, 4c00h ; o 4ch

    int 21h    

RESULTADO endp

end RESULTADO 

    ret

