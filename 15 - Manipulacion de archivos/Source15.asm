; Materia: Lenguajes de interfaz
; Alumno: Jose Haziel Valenzuela Silva
; Horario: 10:00-11:00
; Docente: Dr. Jose Luis Medina Jimenez
; Practica: Manipulacion de archivos

INCLUDE Irvine32.inc

.data
    nombreArchivo BYTE "Inventario.txt", 0
    texto BYTE "125", 0
    archivoHandle DWORD ?

    mensajeExito BYTE "Archivo guardado correctamente.", 0
    mensajeError BYTE "No se pudo guardar el archivo.", 0

.code
main PROC

    ; 1. Crear el archivo
    mov edx, OFFSET nombreArchivo
    call CreateOutputFile

    cmp eax, INVALID_HANDLE_VALUE ;verifica si ocurrio un error
    je error

    mov archivoHandle, eax  ;guarda el identificador

    ; 2. Escribir en el archivo
    mov eax, archivoHandle
    mov edx, OFFSET texto
    mov ecx, SIZEOF texto - 1  ;cantidad de caracteres
    call WriteToFile

    ; 3. Cerrar el archivo
    mov eax, archivoHandle
    call CloseFile

    test eax, eax  ;comprueba si se cerro correctamente
    jz error

    ; Mostrar mensaje de exito
    mov edx, OFFSET mensajeExito
    call WriteString
    jmp fin

errorEscritura:
    mov eax, archivoHandle
    call CloseFile

error:
    mov edx, OFFSET mensajeError
    call WriteString

fin:
    exit

main ENDP
END main