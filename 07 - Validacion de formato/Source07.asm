;Materia: Lengaujes de interfaz
;Alumno: Jose Haziel Valenzuela Silva
;Horario: 10:00-11:00
;Docente: Dr Jose Luis Medina Jimenez
;Practica: Validacion de formato

INCLUDE Irvine32.inc

.data
    msgPIN BYTE "Ingrese la clave: ",0
    msgError BYTE "Clave Incorrecta.",0
    msgAcceso BYTE "Acceso permitido",0
    msgBloqueo BYTE "Sistema bloqueado",0
    msgIntentos BYTE "Intentos restantes: ",0

    claveCorrecta = 1234

.code
main PROC
    mov ebx, 3 ; definimos el numero de intentos iniciales

intentar:
    mov edx, OFFSET msgPIN
    call WriteString
    call ReadInt ; lee de consola el pin ingresado por el usuario

    cmp eax, claveCorrecta ; compara el pin ingresado por el usuario con el pin correcto

    je acceso ; salta a la etiqueta de acceso para mostrar el mensaje de acceso

    mov edx, OFFSET msgError
    call WriteString
    call Crlf

    dec ebx ; descuenta un valor de uno al numero de intentos

    jz bloqueado

    mov edx, OFFSET msgIntentos
    call WriteString

    mov eax, ebx
    call WriteDec
    call Crlf

    jmp intentar

acceso:
    mov edx, OFFSET msgAcceso
    call WriteString
    jmp fin

bloqueado:
    mov edx, OFFSET msgBloqueo
    call WriteString
    jmp fin

fin:
    exit
main ENDP
END main