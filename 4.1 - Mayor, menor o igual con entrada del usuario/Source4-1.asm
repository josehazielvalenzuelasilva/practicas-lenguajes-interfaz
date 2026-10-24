;Materia: Lengaujes de interfaz
;Alumno: Jose Haziel Valenzuela Silva
;Horario: 10:00-11:00
;Docente: Dr Jose Luis Medina Jimenez
;Practica: Mayor, menor o igual con entrada del usuario

INCLUDE Irvine32.inc

.data
    ; Mensajes que se muestran al usuario
    mensaje1 BYTE "Ingresa el primer numero: ", 0
    mensaje2 BYTE "Ingresa el segundo numero: ", 0
    iguales BYTE "Los numeros son iguales.", 0
    mayor BYTE "El primer numero es mayor que el segundo.", 0
    menor BYTE "El primer numero es menor que el segundo.", 0

.code
main PROC

    ; Leemos y guardamos el primer numero
    mov edx, OFFSET mensaje1
    call WriteString
    call ReadInt
    mov ebx, eax  ;EBX guarda el primer numero

    ; Leemos y guardamos el segundo numero
    mov edx, OFFSET mensaje2
    call WriteString
    call ReadInt
    mov ecx, eax  ;ECX guarda el segundo numero

    cmp ebx, ecx  ;Comparamos los dos numeros

    JE SonIguales  ;Salta si son iguales
    JG EsMayor  ;Salta si el primero es mayor
    JL EsMenor  ;Salta si el primero es menor

SonIguales:
    mov edx, OFFSET iguales
    call WriteString
    jmp Fin  ;Evita mostrar otro mensaje

EsMayor:
    mov edx, OFFSET mayor
    call WriteString
    jmp Fin

EsMenor:
    mov edx, OFFSET menor
    call WriteString

Fin:
    call Crlf 
    exit 

main ENDP
END main