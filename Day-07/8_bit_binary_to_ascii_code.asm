;Day 07        Date-16 april,2021
;Problem- Input 8 bit binary value and convert it into ascii value

include 'emu8086.inc' 
.model small
.stack 100h

.data
n_line db 0ah,0dh,"$"  ;for new line
msg1 db "input : $" 
msg2 db 0ah,0dh,"Outpur : $"
msg3 db 0ah,0dh,"invalid input given. $"  
i db ?

.code
main proc
    mov ax,@data
    mov ds,ax

@infinite:  
    mov i,0d           ;for infinite process i=0 at initialization
         
    lea dx,msg1   
    mov ah,09
    int 21h 

                       ;first-e ensure korte hobe bx must be empty
    xor bx,bx          ;XOR operation with self will always produce 0    
        
    
    mov ah,1
    @input:            
        int 21h        
        
        cmp al,50      ;check for input only 0 and 1
        jge @invalid
        cmp al,48
        jl @invalid
                       ;65d = 01000001 
        and al,0Fh     ;0Fh = 00001111
                       ;AND = 01000001
        shl bx,1
        or bl,al       ;bl register-er LSB-te al data store korlam  
                 
        inc i
        cmp i,8d
        jl @input
        jge @next_step
    
    @next_step:   
        lea dx,msg2   
        mov ah,9
        int 21h
         
        mov dl,bl   
        ;add dl,48
        mov ah,2
        int 21h  
        
        lea dx,n_line   ;for new line
        mov ah,9
        int 21h  
        
        jmp @infinite
            
         
@stop:       
    mov ah,4ch
    int 21h
    main endp
@invalid:
    lea dx,msg3
    mov ah,9
    int 21h
    jmp @stop
end main
