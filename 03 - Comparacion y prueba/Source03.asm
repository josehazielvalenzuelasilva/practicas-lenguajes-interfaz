; Materia: Lenguajes de interfaz
; Alumno: Jose Haziel Valenzuela Silva
; Horario: 10:00-11:00
; Docente: Dr. Jose Luis Medina Jimenez
; Practica: Comparacion y prueba

INCLUDE Irvine32.inc

.code
main PROC

   ; CASO 1: ZERO FLAG (ZF)
   mov eax, 10
   mov ebx, 10
   cmp eax, ebx   ;ZF = 1 porque los valores son iguales
   call DumpRegs

   mov eax, 10h
   mov ebx, 10h
   cmp eax, 10h
   call DumpRegs

   mov eax, 0
   mov al, 00000101b
   cmp al, 5   ;ZF = 1 porque ambos valores son 5
   call DumpRegs

   ; CASO 2: SIGN FLAG (SF)
   mov eax, 3
   mov ebx, 4
   cmp eax, ebx  ;SF = 1 porque 3 - 4 da -1
   call DumpRegs

   mov eax, 0
   mov ebx, 0
   mov al, -5
   mov bl, -7
   cmp al, bl  ;Compara -5 y -7 como valores de 8 bits
   call DumpRegs

   ; CASO 3: CARRY FLAG (CF)
   mov eax, 0
   mov ebx, 0
   mov al, 5
   mov bl, 10
   cmp al, bl  ;CF = 1 porque 5 es menor que 10 sin signo
   call DumpRegs

   ; CASO 4: OVERFLOW FLAG (OF)
   mov eax, 0
   mov ebx, 0
   mov al, 128
   mov bl, 1
   cmp al, bl  ;Compara los valores y actualiza las banderas
   call DumpRegs

   ; CASO 5: TEST
   mov eax, 0
   mov al, 5  ;00000101b
   test al, 3  ;AND lógico: 00000101 AND 00000011
   call DumpRegs ;ZF = 0 porque el resultado es distinto de cero
   
  exit
main ENDP
END main

   ; INVESTIGACION DEL BIT MAS SIGNIFICATIVO ¿POR QUE SE ACTIVA SIGN FLAG?
   ; El Sign Flag (SF) se activa cuando el bit mas
   ; significativo del resultado de una operacion es 1.
   ; En este caso, CMP realiza una resta interna:
   ; 3 - 4 = -1
   ; el resultado -1 en 32 bits es FFFFFFFFh,
   ; cuyo bit mas significativo es 1.
   ; Por eso SF = 1, indicando un resultado negativo
   ; al interpretar el resultado como un numero con signo.
   ;
   ; Si el bit mas significativo es 0, SF = 0.
