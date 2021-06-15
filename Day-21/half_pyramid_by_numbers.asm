; Day - 21      Date- 01 May,2021
; problem - print Inverted right triangle of numbers where input(0~9)

.model small	
.stack 100h		
include 'emu8086.inc'

.data
msg db "input only number 0~9: $"
n_line db 0ah,0dh,"$"   ;for new line  
i db ?
j db ?

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
    mov bl,al  
    
    printn
@outer_loop_init:
    mov i,1d
    @outer_loop:
    cmp i,bl
    jg @stop        
    @inner_loop_init:
        mov cl,1d  
    @inner_loop:    
        cmp cl,i
        jg @inner_loop_exit
            mov dl,cl
            add dl,48
            mov ah,2
            int 21h
            
            mov dl,32
            mov ah,2
            int 21h
        inc cl
        jmp @inner_loop
    @inner_loop_exit:
        lea dx,n_line  ;print new line
        mov ah,9
        int 21h
       
    inc i
    jmp @outer_loop     
@stop:  
	mov ah,4ch
	int 21h		;terminate with return code
main endp
end main
