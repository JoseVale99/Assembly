; Ejercicio 2. Escriba un programa que contenga la definición de al menos cuatro tipos de datos.
; Inicialice cada variable con un valor que sea consistente con su tipo de dato. Agregar los comentarios
; necesarios en el código fuente para explicar cada tipo de dato.
.286
.MODEL SMALL
.Stack
.DATA
	; Declare un byte, en la ubicación TDATO11, que contenga el valor 55h.
	TDATO11 db 55h                	; solo el byte 0x55
	; Declare un byte, en la ubicación TDATO12, que contenga el valor 55h,56h,57h.
    TDATO12 db 55h,56h,57h      	; tres bytes seguidos
	; Declare un byte, en la ubicación TDATO13, que contenga el valor 'a',55h.
    TDATO13 db 'a',55h            	; las constantes de caracteres están bien
	; Declare un byte, en la ubicación TDATO14, que contenga el valor 'hello',13,10,'$'.
    TDATO14 db 'hello',13,10,'$'   	; también lo son las constantes de cadena

	
	; Declare un valor 1234h de 2 bytes, denominado ubicación TDATO21.
    TDATO21 dw 1234h              	; 0x34 0x12
	; Declare un valor 'A' de 2 bytes, denominado ubicación TDATO22.
    TDATO22 dw 'A'                 	; 0x41 0x00 (es solo un número)
	; Declare un valor 'AB' de 2 bytes, denominado ubicación TDATO23.
    TDATO23 dw 'AB'                	; 0x41 0x42 (caracter constante)

    
	; Declare un valor de 4 bytes, en la ubicación TDATO31, inicializado en 12345678h.
    TDATO31 dd 12345678h          	; 0x78 0x56 0x34 0x12
	; "definir quadword" [es decir, definir elementos de 64 bits]., en la ubicación TDATO41, inicializado en 1122334455667788h
    TDATO41 dq 1122334455667788h  	; 0x88 0x77 0x66 0x55 0x44 0x33 0x22 0x11

    
	; Declare un valor de 4 bytes, en la ubicación TDATO71, inicializado en 1.234567e20.
    TDATO71 dd  1.234567e20         ; constante de punto flotante
	; "definir quadword" [es decir, definir elementos de 64 bits]., en la ubicación TDATO81, inicializado en 1.234567e20	
    TDATO81 dq  1.234567e20         ; tipo de dato float de doble precisión
	; Da como resultado que la memoria asignada se inicialice con un valor entero de 80 bits.
    TDATO91 dt  1.234567e20         ; tipo de dato float de precisión extendida

  .CODE
  main PROC FAR
       MOV AX, @DATA
       MOV DS, AX
	   
       MOV AH,09H
       LEA DX,TDATO11   
       INT 21H
	   
       MOV AH,09H
       LEA DX,TDATO12   
       INT 21H
	   	   
       MOV AH,09H
       LEA DX,TDATO13   
       INT 21H
	   
       MOV AH,09H
       LEA DX,TDATO14   
       INT 21H
	   	   
       MOV AH,09H
       LEA DX,TDATO21   
       INT 21H
	   
       MOV AH,09H
       LEA DX,TDATO22   
       INT 21H
	   	   	   
       MOV AH,09H
       LEA DX,TDATO23   
       INT 21H
	   
       MOV AH,09H
       LEA DX,TDATO31   
       INT 21H
	   	   	   
       MOV AH,09H
       LEA DX,TDATO41   
       INT 21H
	   
       MOV AH,09H
       LEA DX,TDATO71   
       INT 21H
	   	   	   	   
       MOV AH,09H
       LEA DX,TDATO81   
       INT 21H
	   
       MOV AH,09H
       LEA DX,TDATO91   
       INT 21H

      .exit     
      MAIN ENDP       
      END MAIN        