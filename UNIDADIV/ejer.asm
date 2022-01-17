; Ejer6_U4_A1
; 6. Escriba un programa que muestre un solo carácter en
;  100 posiciones aleatorias en la pantalla, usando un 
;  retraso de tiempo de 1000 milisegundos. Es necesario limpiar
;   la pantalla antes de mostrar el número carácter. Nota: es necesario 
;   determinar el tamaño actual de la ventana de consola. 
.model small
.stack
.data
     char db '*$'
     arregloaleatorioY db 10,18,9,16,2,20,14,17,21,9,8,2,17,4,2,2,10,20,0,15,7,7,11,13,9,6,5,0,12,20,13,'$'
     arregloaleatorioY2 db 6,7,8,9,9,10,10,4,17,12,6,23,10,6,0,10,13,16,4,22,9,12,20,8,17,'$'
     arregloaleatorioY3 db 13,8,14,11,13,10,18,23,3,2,11,18,22,8,19,20,8,9,22,8,4,10,2,23,7,13,'$'
     arregloaleatorioY4 db 16,22,19,23,18,12,2,18,19,19,8,21,21,20,9,15,5,16,0,9,23,15,4,11,4,14,'$'

     arregloaleatorioX db 53,8,26,50,2,55,3,65,52,51,65,62,68,11,27,3,33,46,76,13,54,76,4,46,23,20,1,66,4,48,25,'$'
     arregloaleatorioX2 db 11,13,18,19,20,44,61,65,78,63,34,73,59,40,44,10,27,40,0,44,20,48,62,42,34,62,13,'$'
     arregloaleatorioX3 db 8,50,17,27,6,33,45,12,29,27,69,44,69,45,24,22,61,14,11,28,34,25,63,50,3,24,'$'
     arregloaleatorioX4 db 54,46,75,54,59,16,20,23,68,30,59,76,44,39,76,60,23,38,63,76,52,51,5,14,63,68,'$'
     TIEMPO dw 10000
     contador dw 0
.code
main proc far
    mov ax,@data
    mov ds, ax 
    
    mov ah,00h
    mov al,02h
    int 10h 
        mov ah,06h      ; funcion que dezplaza lineas hacia arriba (limpiar pantalla)
    mov al,00h      ; modo de video
    mov bh,00011110b      ; atributo a usar: el primer digito es el color de la pantalla el segundo el del texto
    mov cx,0000h    ; filas y columnas donde empezara 
    mov dx,184fh    ; filas y columnas donde acabara la limpieza de pantalla
    int 10h
            
   
            
    
    mov cx,25
    mov si,0
    ciclo:
        mov ah,02h
        mov bh,00h
        mov dl,arregloaleatorioX[si]
        mov dh,arregloaleatorioY[si]
        int 10h
        
        mov contador,cx
        
        mov ah,02h
        mov dl,'*'
        int 21h
        inc si
        
        mov ah,86h
        mov al,0
        mov cx,10
        mov dx,TIEMPO
        int 15h

        mov ah,86h
        mov al,0
        mov cx,10
        mov dx,TIEMPO
        int 15h
        
        mov cx,contador
    loop ciclo

    mov cx,25
    mov si,0
    ciclo2:
        mov ah,02h
        mov bh,00h
        mov dl,arregloaleatorioX2[si]
        mov dh,arregloaleatorioY2[si]
        int 10h
        
        mov contador,cx
        
        mov ah,02h
        mov dl,'*'
        int 21h
        inc si
        
        mov ah,86h
        mov al,0
        mov cx,10
        mov dx,TIEMPO
        int 15h
        mov ah,86h
        mov al,0
        mov cx,10
        mov dx,TIEMPO
        int 15h
        
        mov cx,contador
    loop ciclo2
    mov cx,25
    mov si,0
    ciclo3:
        mov ah,02h
        mov bh,00h
        mov dl,arregloaleatorioX3[si]
        mov dh,arregloaleatorioY3[si]
        int 10h
        
        mov contador,cx
        
        mov ah,02h
        mov dl,'*'
        int 21h
        inc si
        
        mov ah,86h
        mov al,0
        mov cx,10
        mov dx,TIEMPO
        int 15h

        mov ah,86h
        mov al,0
        mov cx,10
        mov dx,TIEMPO
        int 15h
        mov cx,contador
    loop ciclo3
 mov cx,25
 mov si,0
    ciclo4:
        mov ah,02h
        mov bh,00h
        mov dl,arregloaleatorioX4[si]
        mov dh,arregloaleatorioY4[si]
        int 10h
        
        mov contador,cx
        mov al,0
        mov ah,02h
        mov dl,'*'
        int 21h
        inc si
        
        mov ah,86h
        mov al,0
        mov cx,10
        mov dx,TIEMPO
        int 15h
        mov ah,86h
       mov al,0
        mov cx,10
        mov dx,TIEMPO
        int 15h
        
        mov cx,contador
    loop ciclo4
    mov ah,01h
    int 21h
    
    mov ah,4ch
    int 21h
    main endp
end main