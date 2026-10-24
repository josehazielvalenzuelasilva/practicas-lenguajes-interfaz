; Materia: Lenguajes de interfaz
; Alumno: Jose Haziel Valenzuela Silva
; Horario: 10:00-11:00
; Docente: Dr. Jose Luis Medina Jimenez
; Practica: Desplazamiento y rotacion

INCLUDE Irvine32.inc

.code
main PROC

; 3 - SAR: desplazamiento a la derecha con signo
    mov al, -9
    sar al, 1    ;conserva el signo al desplazar
    call WriteBin
    call Crlf

; 4 - SHL: desplazamiento a la izquierda
    mov al, 00001100b
    shl al, 2   ;esplaza los bits dos posiciones a la izquierda
    call WriteBin
    call Crlf

; 5 - SHR: desplazamiento a la derecha
    mov al, 00010100b
    mov cl, 2
    shr al, cl   ;esplaza los bits a la derecha usando CL
    call WriteBin
    call Crlf

; 6 - ROL: rotacion a la izquierda
    mov al, 10000001b
    rol al, 1    ;el bit mas significativo pasa al extremo derecho
    call WriteBin
    call Crlf

; 7 - ROR: rotacion a la derecha
    mov al, 10000001b
    ror al, 1    ;el bit menos significativo pasa al extremo izquierdo
    call WriteBin
    call Crlf

; 8 - RCL: rotacion a la izquierda a traves del carry
    mov al, 10000001b
    clc       ;limpia la bandera de acarreo CF
    rcl al, 1  ;rota los bits incluyendo CF
    call WriteBin
    call Crlf

; 9 - RCR: rotacion a la derecha a traves del carry
    mov al, 10000001b
    clc        ;limpia la bandera de acarreo CF
    rcr al, 1   ;rota los bits incluyendo CF
    call WriteBin
    call Crlf

    exit
main ENDP
END main