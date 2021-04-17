;Day-09          Date-18 april,2021
;problem - print number of input in given input line & take input until enter is pressed
;problem constraints - input number <= 9
.model small	
.stack 100h		
include 'emu8086.inc' 

.data   

msg1 db "input : $" 
msg2 db 0ah,0dh,"Output : $"
n_line db 0ah,0dh,"$"   ;for new line 

.code

main proc
	mov ax,@data	
	mov ds,ax  
    
    xor bl,bl     ;clear bl register 
    mov bl,0d     ;storing 0 at bl
    lea dx,msg1
    mov ah,9
    int 21h	  
@input: 
    mov ah,1
    int 21h 
    
    cmp al,0dh    ;new line check as 0A stands for new line in ascii
    je @output 
    inc bl        ;bl is incrementing
    jne @input 
@output:
    lea dx,msg2  
    mov ah,9
    int 21h  
    
    mov dl,bl   
    add dl,48
    mov ah,2
    int 21h
@stop:     
	mov ah,4ch
	int 21h		  ;terminate with return code
main endp
end main
