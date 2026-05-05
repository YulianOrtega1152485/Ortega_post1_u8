org 100h

section .data
  origen  db "HOLA, MUNDO!$"
  len     equ $ - origen

  destino times len db 0

  msg     db "Copiado: $"
  crlf    db 0Dh,0Ah,"$"

section .text
start:
  ; ES = DS
  mov ax, ds
  mov es, ax

  mov si, origen
  mov di, destino
  mov cx, len
  cld
  rep movsb

  ; imprimir mensaje
  mov ah, 09h
  mov dx, msg
  int 21h

  ; imprimir cadena copiada
  mov dx, destino
  int 21h

  ; salto de línea
  mov dx, crlf
  int 21h

  mov ah, 4Ch
  int 21h