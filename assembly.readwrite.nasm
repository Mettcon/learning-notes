%include "macro.nasm"
%define BUFFER_SIZE 256

; initialized Data
section .data
    buffer times BUFFER_SIZE db 0
    newline db 10

; uninitialized data
section .bss
  
section .text
    global _start

_start:
    read STDIN, buffer, BUFFER_SIZE-1 ; rax contains amount of bytes read (documentation is awful)
    
   ; mov rax, [bytes_read]
    cmp rax, 0
    jl error
    je end_of_input

    ; Null terminate (only neccesary for c style string?)
    mov byte [buffer+rax], 0 

    write STDOUT, buffer, rax
    jmp exit

error:
    ; to be filled
    jmp exit

end_of_input:
    ; to be filled
    jmp exit

exit:
    mov rax, 60
    mov rdi, 0
    syscall
