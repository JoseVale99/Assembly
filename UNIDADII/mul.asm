.model small ;Modelo de memoria m?s utilizado
.stack

.data        ;definición de datos(variables), donde se almacenara información
.code
   chr1  db ? ;primer digito
   chr2  db ? ;segundo digito
   chr3  db ? ;multiplo
   chr4  db ?
   r1    db ? ;resultado 1
   r2    db ? ;resultado 2
   r3    db ?
   r4    db ?
   ac    db 0 ;acarreo
   ac1   db 0
.startup
   ;cls
   mov ah,00h     ;Function(Set video mode)
   mov al,03      ;Mode 80x25 8x8 16
   int 10h        ;Interruption Video

   mov ah,01h     ;Function(character read) Guarda en AL
   int 21h        ;Interruption DOS functions
   sub al,30h     ;ajustamos valores
   mov chr1,al    ;[chr1].chr2 * chr3 = ac.r1.r2

   mov ah,01h     ;Function(character read) Guarda en AL
   int 21h        ;Interruption DOS functions
   sub al,30h     ;Ajustamos valores
   mov chr2,al    ;chr1.[chr2] * chr3 = ac.r1.r2

   mov ah,02h     ;Function(character to send to standard output)
   mov dl,'*'     ;Character to show
   int 21h

   mov ah,01h     ;Function(Read character) Guarda en AL
   int 21h        ;Interruption DOS Functions
   sub al,30h     ;Transform(0dec = 30hex)
   mov chr3,al    ;chr1.chr2 * [chr3] = ac.r1.r2
  
   mov ah,01h     ;Function(Read character) Guarda en AL
   int 21h        ;Interruption DOS Functions
   sub al,30h     ;Transform(0dec = 30hex)
   mov chr4,al    ;chr1.chr2 * [chr3] = ac.r1.r2

   mov ah,02h     ;Character to send to standar output
   mov dl,'='     ;
   int 21h        ;Interruption DOS functions

   ;Realizamos operaci?n   
  
   mov al,chr4  ;al=5       ;unidad del segundo numero
   mov bl,chr2  ;bl=5       ;unidad del primer numero
   mul bl       ;bl=25      ;multiplicar
   mov ah,0     ;ah=0       ;limpiamos ah0
   aam          ;ax=02  05  ;separamos de hex a dec
   mov ac1,ah   ;ac1=02     ;decenas del primera multiplicacion
   mov r4,al    ;r4=05      ;unidades del primera multiplicacion
            
   mov al,chr4  ;bl=4       ;unidades del segundo numero
   mov bl,chr1  ;al=5       ;decentas del primer numero
   mul bl       ;al=14h     ;multiplicar
   mov r3,al    ;r3=14h     ;movemos el resultado de la operacion a r3
   mov bl,ac1   ;bl=02      ;movemos el acarreo a bl
   add r3,bl    ;r3=16h     ;sumamos resultado mas acarreo
   mov ah,00h   ;ah=00      ;limpiamos ah por residuos
   mov al,r3    ;al=16h     ;movemos el resultado de la suma a al
   aam          ;ax=02  02  ;separamos  de hex a dec
   mov r3,al    ;r3=02      ;guardamos unidades en r3
   mov ac1,ah   ;ac1=0      ;guardamos decenas en ac1
  
      

   mov al,chr3    ;al=2     ;al = chr3
   mov bl,chr2    ;bl=5     ;bl = chr2
   mul bl         ;al=10    ;AL = chr3*chr2 (BL*AL)
   mov Ah,0h      ;ah=0     
   AAM            ;ax=01 00 ;ASCII Adjusment
   mov ac,AH      ;ac=01    ;ac = AH (Acarreo)
   mov r2,AL      ;r2=0     ;r2 = AL       (Unidad del resultado)

   mov al,chr3    ;al=2     ;AL = chr3
   mov bl,chr1    ;bl=4     ;BL = chr1
   mul bl         ;al=8     ;AL = chr1*chr3 (BL*AL)
   mov r1,al      ;r1=8     ;r1 = AL       (Decena del resultado)
   mov bl,ac      ;bl=01    ;BL = Acarreo anterior
   add r1,bl      ;r1=9;    ;r1 = r1+ac (r1 + Acarreo)
   mov ah,00h     ;ah=00
   mov al,r1      ;al=9     ;AL = r1 (Asignaci?n para el ajust)
   AAM            ;ax=00 09 ;ASCII Adjustment
   mov r1,al      ;r1=09    ;r1 = AL
   mov ac,ah      ;ac=0     ;ac = AH (Acarreo para la Centena del resultado)
  
  
   ;suma final
   ;R4 resulta ser las unidades de mul y no se toma en cuenta ya que se pasa entero
  
  
   mov ax,0000h   ;limpiamos ax
  
   mov al,r3      ;al=02        ;movemos el segundo resultado de la primera mult a al
   mov bl,r2      ;bl=0         ;movemos primer resultado de la segunda mult a bl
   add al,bl      ;al=2         ;sumamos
   mov ah,00h     ;ah=00        ;limpiamos ah
   aam            ;ax=00  02    ;separamos hex a dec
   mov r3,al      ;r3=02        ;r3 guarda las decenas del resultado final
   mov r2,ah      ;r2=0         ;r2 se utiliza como nuevo acarreo
  
   mov ax,0000h   ;''''
  
   mov al,ac1     ;al=02        ;movemos el acarreo de la primera mult a al
   mov bl,r1      ;bl=9         ;movemos segundo resultado de la segunda mult a bl
   add al,r2      ;al=2         ;sumamos el nuevo  acarreo de la suma anterior  a al
   add al,bl      ;al=Bh        ;sumamos al a bl
   mov ah,00h     ;ah=00        ;limpiamos el registro ah
   aam            ;ax=01 01     ;separamos de hex a dec
   mov r1,al      ;r1=01        ;r1 guarda las centenas
   mov r2,ah      ;R2=01        ;ah se sigue utilizando como acarreo
  
   mov al,r2      ;al=01        ;movemos el acarreo a al
   mov bl,ac      ;bl=00        movemos ac a bl
   add al,bl      ;al=01        ;sumamos al a bl
   ;aam            ;separamos hex a dec
   mov ac,al      ;ac=01        mov al a ac como nuestro acarreo final
  
 
  
   ;Mostramos resultado
   mov ah,02h 
   mov dl,ac
   add dl,30h
   int 21h        ;Mostramos ac (millar) ac=1

   mov ah,02H
   mov dl,r1
   add dl,30h
   int 21h        ;Mostramos r1 (centena) r1=1

                 
  
   mov ah,02H
   mov dl,r3                                  
   add dl,30h
   int 21h        ;Mostramos r3 (decena)  r3=2
  
   mov ah,02H
   mov dl,r4
   add dl,30h
   int 21h        ;unidad r4=5
  
.exit
end   