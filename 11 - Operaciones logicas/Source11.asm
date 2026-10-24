; Materia: Lenguajes de interfaz
; Alumno: Jose Haziel Valenzuela Silva
; Horario: 10:00-11:00
; Docente: Dr. Jose Luis Medina Jimenez
; Practica: Operaciones logicas

INCLUDE Irvine32.inc

.data
    mensaje BYTE "La alarma esta encendida.", 0
    mensajeApagada BYTE "La alarma esta apagada.", 0

.code
main PROC

; 1 - AND: evaluar el estado de la alarma
    mov eax, 0
    mov al, 00000111b
    and al, 00000010b ;conserva los bits que son 1 en ambos valores
    call WriteBin
    call Crlf

; 2 - OR: encender la alarma
    mov eax, 0
    mov al, 00000101b
    or al, 00000010b ;activa el bit indicado por la mascara
    call WriteBin
    call Crlf

; 3 - XOR: alternar el estado de la computadora
    mov eax, 0
    mov al, 00000101b
    xor al, 00000001b ;invierte el bit seleccionado
    call WriteBin
    call Crlf

; 4 - TEST: comprobar si la alarma esta encendida
    mov eax, 0
    mov al, 00000101b
    test al, 00000010b ;comprueba el bit sin modificar AL
    jz AlarmaApagada ;salta si el bit comprobado es cero

    mov edx, OFFSET mensaje
    call WriteString
    call Crlf
    jmp Fin

AlarmaApagada:
    mov edx, OFFSET mensajeApagada
    call WriteString
    call Crlf

Fin:
    exit

main ENDP
END main