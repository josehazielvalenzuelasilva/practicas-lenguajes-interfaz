;Materia: Lengaujes de interfaz
;Alumno: Jose Haziel Valenzuela Silva
;Horario: 10:00-11:00
;Docente: Dr Jose Luis Medina Jimenez
;Practica: Ciclos numericos

INCLUDE Irvine32.inc

.data
    prefijo BYTE "Numero: ", 0  
    valor   DWORD 1   ;contador

.code
main PROC
    mov ecx, 20  ;numero de iteraciones

ciclo:
    mov edx, OFFSET prefijo
    call WriteString

    mov eax, valor   ;valor actual
    call WriteDec    ;imprime el numero en decimal
    call Crlf        ;salto de línea

    inc valor
    loop ciclo

    exit
main ENDP
END main