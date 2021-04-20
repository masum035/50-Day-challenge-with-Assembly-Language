;Day 11     date-20 april,2021
;problem - convert lower case letter to upper case letter or upper case letter to lower case letter 
;        - without using subtraction , addition (using just bit manipulation)

.model small	
.stack 100h		
include 'emu8086.inc' 

.data

n_line db 0ah,0dh,"$"   ;for new line 
input_msg db "Input",32d,": $"
output_msg db 0ah,0dh,"Output: $"
stop_msg db "Press 'esc' to stop this programme:",0ah,0dh,"$"   

.code

main proc
    mov ax,@data	
    mov ds,ax 
    
    lea dx,stop_msg
    mov ah,9
    int 21h 
@input:	   
    lea dx,input_msg
    mov ah,9
    int 21h 

    mov ah,1
    int 21h	 
    cmp al,27d
    je @stop 
    
    xor bx,bx       ;XOR with self will always retun all zero bit (means clearing a register)
    mov bl,al
    xor bl,32d      ;Here is the trick     
	                  ;visit - https://catonmat.net/ascii-case-conversion-trick
@output:	        
	lea dx,output_msg
    mov ah,9
    int 21h 
	 
    mov dl,bl
    mov ah,2
    int 21h
	        
    lea dx,n_line   ;new line 
    mov ah,9
    int 21h 
    
    jmp @input
    
@stop:     
	mov ah,4ch
	int 21h		        ;terminate with return code
main endp
end main
