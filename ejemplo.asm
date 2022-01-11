; practica para loops 
; imprimir el alfabeto 

print macro cadena  ; Esta macro imprime en pantalla una cadena y como parametro recibe la cadena a imprimir
    mov ah,09h
    lea dx,cadena
    int 21h
endm  

mostrar_caracter macro caracter
    mov ah,02h      ; imprimo el caracter
    mov dl,caracter        ; que esta guardado en r
    add dl,30h      ; realizo el ajuste
    int 21h 
endm

suma_caracter macro suma,n1, res
    mov bl,n1
    add suma,bl 
    mov al, suma      ; ACA SE HACE LA SUMA
    mov res,al 
endm
.286 ; si lo emulas en 8086 quita esto
pila segment stack
db 32 DUP('stack--')
pila ends

datos segment
    n db ?
    r db ?  
    suma db 0
    input db "Ingrese un numero: ", "$"
    espacio db " ", "$"
    salto DB 13,10,"$"
    letrero2 db "la suma total es: ", "$"
datos ends

codigo segment 'code'
    Main proc FAR
    assume ss: pila, ds: datos, cs: codigo
    
    mov ax, datos
    mov ds, ax
    
  
    mov cx,1        ; establecemos el contador en 26 debido a que son 26 letras del alfabeto
    
    ciclo:              ; ciclo para imprimir el alfabeto                                                                            
        print input
                   
        mov ah,01h      ; solicito un numero por teclado
        int 21h
          
        sub al,30h      ; realizo el ajuste
        mov n,al

        
        print salto 
        suma_caracter suma,n,r
   
        add cx,1 ; cx+=1
        
        CMP n,0  
        je salir
        
        

        
      loop ciclo
       salir:
         MOV cx,0      ; itera    y cx disminuye en 1, se detiene hasta que cx valga 0
      print salto
      print letrero2
      mostrar_caracter r 
     
     
      mov ah,4ch        ; finaliza el programa
      int 21h

    ret
    main ENDP
codigo ends
end main