.model small 

.stack 64 

.data

edad db 18  ; dato de edad ingresado - se puede cambiar

mayor db 'ERES MAYOR DE EDAD...','$'

menor db 'ERES MENOR DE EDAD...','$'

.code

begin proc far

mov ax,@data

mov ds,ax

mov es,ax

cmp edad,18

jae b20

mov ah,09h ;peticion para desplegar

lea dx,menor ;carga la direccion de la indicacion

int 21h ;llama al dos

jmp b21 ;salta a la etiqueta b21 para salir

b20:

mov ah,09h ;peticion para desplegar

lea dx,mayor ;carga la direccion de la indicacion

int 21h ;llama al dos

b21:

mov ax,4c00h

int 21h

begin endp

end begin