INCLUDE Irvine32.inc

.code
main PROC

    ; Bloque 1: push y pop
    mov eax, 40
    push eax   ;guardamos EAX en la pila
    nop

    mov eax, 0
    pop ebx   ;recuperamos el valor guardado en EBX
    nop

    ; Bloque 2: Orden de LIFO
    mov eax, 10
    push eax    ;guardamos 10 en la pila

    mov eax, 20
    push eax   ;guardamos 20 en la pila

    mov eax, 30
    push eax  ;guardamos 30 en la pila

    nop

    pop eax ;recuperamos el valor de 30
    pop ebx ;recuperamos el valor de 20
    pop ecx ;recuperamos el valor de 10

    nop

    ; Bloque 3: Conservar registros
    mov eax, 100
    mov ebx, 200

    push eax ;Guarda el valor original de EAX
    push ebx ;Guarda el valor original de EBX

    mov eax, 999
    mov ebx, 666

    pop ebx ;Restaura EBX a 200
    pop eax ;Restaura EAX a 100

    nop

    ; Bloque 4: call y ret
    mov eax, 50
    mov ebx, 100

    call aumentarDiez ;Ejecuta el procedimiento

    nop
    exit

main ENDP

aumentarDiez PROC
    push ebx  ;Conserva el valor original de EBX

    mov ebx, 10
    add eax, ebx ;Suma 10 al valor de EAX

    pop ebx ;Restaura el valor original de EBX
    ret ;Regresa al punto de llamada

aumentarDiez ENDP
END main