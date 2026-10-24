;Materia: Lengaujes de interfaz
;Alumno: Jose Haziel Valenzuela Silva
;Horario: 10:00-11:00
;Docente: Dr Jose Luis Medina Jimenez
;Practica: Condicionales

INCLUDE Irvine32.inc

.code
main PROC
    mov ebx, 1 ; Valor inicial de la condicion

ciclo:
    cmp ebx, 100 ; compara para ejecutar la condicion de salida

    jg fin ; salta a la etiqueta fin para terminar el programa siempre y cuando se cumpla la condicion

    mov eax, ebx
    call WriteDec ; despliega en consola el valor que esta almacenado en EAX
    call Crlf ; salto de linea

    inc ebx ; incremento de +1 en el registro EBX 
    jmp ciclo ; regresa al ciclo while

fin:
  exit
main ENDP

END main