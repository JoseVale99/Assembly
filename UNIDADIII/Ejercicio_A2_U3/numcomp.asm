; Ejercicio_A2_U3
; Instrucciones:

; 1.- Realizar un programa en lenguaje ensamblador que solicite a
;  través de un ciclo pares de números enteros, despliegue un mensaje indicando que 
; número es el mayor de los dos. El ciclo se repite hasta que el usuario seleccione 
; la opción de salir.


.286
TITLE 'MCOMP'
SPILA SEGMENT STACK
    DB 32 DUP('STACK____')
SPILA ENDS
SDATOS SEGMENT 'DATA'
    NUM DB ?
    OP DB ?
    
    ENC DB 'MENU','$'
    COMP DB '1) COMPARAR','$'
    SALIR DB '2) SALIR','$'
    OPCION DB 'INGRESAR OPCION [ ]','$'
    MSG1 DB ' EL PRIMERO ES MAYOR','$'
    MSG2 DB 'EL SEGUNDO ES MAYOR','$'
    MSG3 DB 'SON IGUALES','$'
    
    NUM1 DB 'PRIMER VALOR: ','$'
    NUM2 DB 'SEGUNDO VALOR: ','$'
SDATOS ENDS
SCODIGO SEGMENT 'CODE'
    ASSUME SS:SPILA, DS:SDATOS, CS:SCODIGO
    main PROC FAR
    PUSH DS
    PUSH 0
    MOV AX, SDATOS
    MOV DS, AX

menu:
    MOV AH,06H
    MOV CX,0000H
    MOV DX,184FH
    MOV AL,00H
    MOV BH,71H
    INT 10H
    
    MOV AH, 02H       ; CURSOR
    MOV BH, 0H
    MOV DH, 07H       ; FILA
    MOV DL, 15H       ; COLUMNA
    INT 10H

    MOV AH, 09H
    LEA DX, ENC
    INT 21H

    MOV AH, 02H       ; CURSOR
    MOV BH, 0H
    MOV DH, 08H       ; FILA
    MOV DL, 15H       ; COLUMNA
    INT 10H

    MOV AH, 09H
    LEA DX, COMP
    INT 21H
    
    MOV AH, 02H       ; CURSOR
    MOV BH, 00H
    MOV DH, 09H       ; FILA
    MOV DL, 15H       ; COLUMNA
    INT 10H

    MOV AH, 09H
    LEA DX, SALIR
    INT 21H


    MOV AH, 02H       ; CURSOR
    MOV BH, 00H
    MOV DH, 0BH       ; FILA
    MOV DL, 15H       ; COLUMNA
    INT 10H

    MOV AH, 09H
    LEA DX, OPCION
    INT 21H
    
    MOV AH, 02H       ; CURSOR
    MOV BH, 00H
    MOV DH, 0BH       ; FILA
    MOV DL, 26H
    INT 10H

    MOV AH, 01H
    INT 21H

    MOV OP, AL

    CMP AL, '1'
    JE comparacion

    CMP AL, '2'
    JNE menu
    
    MOV AH,06H
    MOV CX,0000H
    MOV DX,184FH
    MOV AL,00H
    MOV BH,71H
    INT 10H
    
    ; Cursor: Reset
    MOV AH, 02H
    MOV BH, 0H
    MOV DX, 0000H
    INT 10H
    
    ; Exit
    MOV AX, 4C00H
    INT 21H
    
comparacion:
    MOV AH,06H
    MOV CX,0000H
    MOV DX,184FH
    MOV AL,00H
    MOV BH,71H
    INT 10H
    
    
; 1er digito
; Cursor Pos
    MOV AH, 02H
    MOV BH, 0H
    MOV DH, 07H
    MOV DL, 15H
    INT 10H
    
; Print String
    MOV AH, 09H
    LEA DX, NUM1
    INT 21H
    
; Input
    MOV AH, 01H
    INT 21H
    
    SUB AL, '0'

    MOV NUM, AL

; 2do digito
; Cursor Pos
    MOV AH, 02H
    MOV BH, 0H
    MOV DH, 08H
    MOV DL, 15H
    INT 10H
    
;Print String
    MOV AH, 09H
    LEA DX, NUM2
    INT 21H
    
    ;Input
    MOV AH, 01H
    INT 21H

    SUB AL, '0'
    
    CMP NUM,AL
    JA mayor
    CMP NUM,AL
    JB menor
    CMP NUM,AL
    JE igual
    
mayor:
    
    MOV AH, 02H
    MOV BH, 0H
    MOV DH, 09H
    MOV DL, 15H
    INT 10H
    
    MOV AH,09H
    LEA DX,MSG1
    INT 21H
    
    ;Pausa
    MOV AH, 07H
    INT 21H
    
    JMP menu

menor:
    
    MOV AH, 02H
    MOV BH, 0H
    MOV DH, 09H
    MOV DL, 15H
    INT 10H
    
    MOV AH,09H
    LEA DX,MSG2
    INT 21H
    
    ;Pausa
    MOV AH, 07H
    INT 21H
    
    JMP menu

igual:
    
    MOV AH, 02H
    MOV BH, 0H
    MOV DH, 09H
    MOV DL, 15H
    INT 10H
    
    MOV AH,09H
    LEA DX,MSG3
    INT 21H

    ;Pausa
    MOV AH, 07H
    INT 21H
    
    JMP menu

main ENDP
SCODIGO ENDS
END main