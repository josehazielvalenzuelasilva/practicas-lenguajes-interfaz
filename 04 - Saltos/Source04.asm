; Materia: Lenguajes de interfaz
; Alumno: Jose Haziel Valenzuela Silva
; Horario: 10:00-11:00
; Docente: Dr. Jose Luis Medina Jimenez
; Practica: Saltos

INCLUDE Irvine32.inc

.data
   msgIguales BYTE "Los numeros son iguales", 0
   msgDiferentes BYTE "Los numeros son diferentes", 0

.code
main PROC
    mov eax, -10
    mov ebx, -10

    cmp eax, ebx  ;Compara los dos numeros
    je iguales   ;Salta si son iguales

    mov edx, OFFSET msgDiferentes
    call WriteString  ;Muestra el mensaje

    jmp fin  ;Salta al final

iguales:
    mov edx, OFFSET msgIguales
    call WriteString  ;Muestra el mensaje

    fin:

 exit
main ENDP
END main