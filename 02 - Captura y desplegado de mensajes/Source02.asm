;Materia: Lengaujes de interfaz
;Alumno: Jose Haziel Valenzuela Silva
;Horario: 10:00-11:00
;Docente: Dr Jose Luis Medina Jimenez
;Practica: Captura y desplegado de mensajes

INCLUDE Irvine32.inc

.data
mensaje BYTE "Escribe tu nombre: ", 0 ;mensaje de instruccion para el usuario
caracteresEscritos BYTE "Numero de caracteres: ", 0
nombre BYTE 5 DUP(0) ; reservamos un espacio de memoria llamado buffer para el limite de caracteres a escribir

.code
main PROC

    ; Despliega la solicitud de nombre al usuario
    mov edx, OFFSET mensaje
    call WriteString

    mov edx, OFFSET nombre ; entrega la direccion del primer caracter del buffer
    mov ecx, SIZEOF nombre ; entrega la cantidad de bytes que se pueden escribir

    call ReadString ; permite el ingreso de datos mediante consola

    ; Retoma lo escrito en el buffer
    mov edx, OFFSET nombre
    call WriteString
    call Crlf

    mov edx, OFFSET caracteresEscritos
    call WriteString
    call WriteDec
    exit

main ENDP

END main