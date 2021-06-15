; Day - 20      Date- 01 May,2021
; problem - print Inverted right triangle of numbers where input(0~9)

.model small	
.stack 100h		
include 'emu8086.inc'

.data
msg db "input only number 0~9 $"
n_line db 0ah,0dh,"$"   ;for new line  
i db ?

.code

main proc
	mov ax,@data	
	mov ds,ax    
@input:
    lea dx,msg
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    
    cmp al,0
    je @stop
    
    printn
    
@outer_loop_init:
    mov i,al
    @outer_loop:
        cmp i,1d
        jl @stop
        @inner_loop_init:
            xor bx,bx   ;clearing bx register
            mov bl,1d
        @inner_loop:
            cmp bl,i
            jg @inner_loop_exit
                mov dl,bl
                add dl,48
                mov ah,2
                int 21h
                
                mov dl,32
                mov ah,2
                int 21h
            
            inc bl
            jmp @inner_loop 
        @inner_loop_exit:
            lea dx,n_line
            mov ah,9
            int 21h    
        dec i
        jmp @outer_loop  
    
    lea dx,n_line  ;print new line
    mov ah,9
    int 21h
         
@stop:     
	mov ah,4ch
	int 21h		;terminate with return code
main endp
end main
