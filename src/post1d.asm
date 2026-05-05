org 100h

section .data
  cad1 db "NASM x86"
  cad2 db "NASM x86"
  cad3 db "NASM ARM"
  len  equ 8

  msgIg db "Iguales",0Dh,0Ah,"$"
  msgDf db "Diferentes",0Dh,0Ah,"$"

section .text
start:
  mov ax, ds
  mov es, ax

  ; -------- CASO 1 --------
  mov si, cad1
  mov di, cad2
  mov cx, len
  cld
  repe cmpsb

  jne diferentes1

  mov ah, 09h
  mov dx, msgIg
  int 21h
  jmp caso2

diferentes1:
  mov ah, 09h
  mov dx, msgDf
  int 21h

caso2:
  ; -------- CASO 2 --------
  mov si, cad1
  mov di, cad3
  mov cx, len
  cld
  repe cmpsb

  jne diferentes2

  mov ah, 09h
  mov dx, msgIg
  int 21h
  jmp fin

diferentes2:
  mov ah, 09h
  mov dx, msgDf
  int 21h

fin:
  mov ah, 4Ch
  int 21h