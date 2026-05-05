org 100h

section .data
  origen  db "HOLA, MUNDO!$"
  len     equ $ - origen

  destino times len db 0

  msg     db "Copiado: $"
  crlf    db 0Dh,0Ah,"$"

section .text
start:
  mov ax, ds
  mov es, ax

  mov si, origen
  mov di, destino

  mov cx, len
  cld

  mov bx, cx        ; guardar longitud

  shr cx, 1         ; dividir entre 2 → palabras
  rep movsw

  test bx, 1        ; ¿longitud impar?
  jz fin_copia

  movsb             ; copiar último byte

fin_copia:
  mov ah, 09h
  mov dx, msg
  int 21h

  mov dx, destino
  int 21h

  mov dx, crlf
  int 21h

  mov ah, 4Ch
  int 21h