; Day-28      Date-19 May,2021
; problem - print Hollow pyramid using star consists upper and lower but there will be one base line 

.model small	
.stack 100h		
include 'emu8086.inc'

.data

n_line db 0ah,0dh,"$"    
multi db 2 
rows db ?
i db ?
j db ?
space db ?

.code
$UpperBlock proc
    mov bl,al     ;bl = rows = n
    
    mul multi
    dec al
    mov cl,al   ;cl = 2*rows - 1
    
    printn
@outer1_init:
    mov i,1 
@outer1:
     cmp i,bl
     jg @outer1_end    
     @inner1_init:
         mov al,i     
         mov space,al ;space=i
     @inner1:
        cmp space,bl
        jge @inner1_end    
            print " "
        inc space
        jmp @inner1
     @inner1_end:
        mov al,1
        mov j,al   ;j=1
     @inner2:
        cmp j,cl
        jg @inner2_end       
            mov al,i
            mul multi
            dec al
            mov dl,al  ; dl=2*i-1   
            
            cmp j,1
            je @if_block1
            cmp i,bl
            je @if_block1
            cmp j,dl 
            je @if_block1
            
            @else_block:
                print " "
                jmp @end_ifBlock
            @if_block1:
                print "*"    
        @end_ifBlock:
        inc j
        jmp @inner2    
     @inner2_end:    
         printn
     inc i
     jmp @outer1
@outer1_end:    
    ret
$UpperBlock endp 

$LowerBlock proc
   mov i,0
   mov j,0
   mov space,0
@outer2_init:
   dec bl  ;if n=4 then lower half rows should be 4-1    
   mov i,bl
@outer2:
    cmp i,1
    jl @outer2_end 
        print " "
        @inner12_init:  
            mov al,i
            mov space,al
        @inner12:
            cmp space,bl
            jge @inner12_end
                print " "
            inc space
            jmp @inner12
        @inner12_end:
             mov j,1
             mov al,i
             mul multi
             dec al
             mov dl,al ;dl=2*i - 1
        @inner22: 
            cmp j,dl
            jg @inner22_end 
           ; cmp i,bl
           ; je @if_block2 
            cmp j,1
            je @if_block2
            cmp j,dl
            je @if_block2 
            
            @else_block2:
                print " " 
                jmp @end_ifBlock2   
            @if_block2:
                print "*"
            @end_ifBlock2: 
            inc j
            jmp @inner22
    @inner22_end:                   
    printn
    dec i
    jmp @outer2
@outer2_end:           
    ret
$LowerBlock endp    
main proc
	mov ax,@data	
	mov ds,ax    
    
    mov ah,1
    int 21h  
    sub al,30h
    call $UpperBlock    
    call $LowerBlock
           
@stop:     
	mov ah,4ch
	int 21h		
main endp 
end main
