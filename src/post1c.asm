org 100h

section .data
  cadena db "Arquitectura de Computadores"
  len    equ $ - cadena

  msgOk  db "Encontrado en posicion: $"
  msgNo  db "No encontrado.$"
  crlf   db 0Dh,0Ah,"$"

section .text
start:
  mov ax, ds
  mov es, ax

  ; -------- BUSCAR 'd' --------
  mov di, cadena
  mov al, 'd'
  mov cx, len
  cld
  repne scasb

  jne no_encontrado

  ; calcular posicion
  mov bx, di
  sub bx, cadena
  dec bx

  mov ah, 09h
  mov dx, msgOk
  int 21h

  ; imprimir posición (solo 1 dígito)
  call printNum

  mov ah, 09h
  mov dx, crlf
  int 21h
  jmp fin

no_encontrado:
  mov ah, 09h
  mov dx, msgNo
  int 21h

printNum:
  mov ax, bx
  xor cx, cx
  mov bx, 10

convert:
  xor dx, dx
  div bx
  push dx
  inc cx
  cmp ax, 0
  jne convert

print:
  pop dx
  add dl, 30h
  mov ah, 02h
  int 21h
  loop print

  ret

fin:
  mov ah, 4Ch
  int 21h