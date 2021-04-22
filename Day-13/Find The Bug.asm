;Day 13         Date-22 april,2021
;problem - find factorial of (0~8) and print it as Binary
;Real Problem - Find out Bug.why if input is greater than 5,output shows illegal numbers.(But upto 5 it's ok) Plz comment below

.model small	
.stack 100h		
include 'emu8086.inc' 

.data

n_line db 0ah,0dh,"$"   ;for new line 
invalid_msg db 0ah,0dh,"invalid input $"  
output_msg db 0ah,0dh,"Output",32d,": $"
input_msg  db 0ah,0dh,"Intput",32d,": $"
i db ?    
count db ?      

.code

main proc
	mov ax,@data	
	mov ds,ax   
@input:  
    mov count,1d
   ;mov i,1d
    xor bx,bx 
    xor ax,ax
    
    lea dx,input_msg
    mov ah,9
    int 21h
    
	mov ah,1
	int 21h  
	
	mov bl,al
	cmp bl,30h
	jle @invalid
	cmp bl,39h
	jg @invalid
	
	mov bl,al
	sub bl,48
	mov i,bl
	mov ax,bx
@process_looop: 
    mov bx,ax
    cmp i,1
    jle @output          
    dec i    
    imul i   ;ax = al x i 
    jmp @process_looop
@output:	
    lea dx,output_msg ;new line 
    mov ah,9
    int 21h     
    
@output_looop:    
    cmp count,8d
    ja @input
    inc count
    
    shl bl,1
    jnc @print0
    jc @print1  
          
@invalid:
    lea dx,invalid_msg
    mov ah,9
    int 21h  
    jmp @input
@stop:     
	mov ah,4ch
	int 21h		;terminate with return code
main endp 
@print1:
    mov dl,31h  
    mov ah,2
    int 21h 
    jmp @output_looop
@print0:
    mov dl,30h
    mov ah,2
    int 21h  
    jmp @output_looop  
end main 
