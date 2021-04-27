;Day-17         Date - 27 April,2021
;problem - check if a string is pallindrome or not (where string length is fixed -4)
.model small	
.stack 100h		
include 'emu8086.inc' 

.data

n_line db 0ah,0dh,"$"   ;for new line       
msg db "Input: $"     
msg1 db 10,13,"Given input is pallindrome.",10,13,"$"
msg2 db 10,13,"Given input is not pallindrome.",10,13,"$"

.code

main proc
	mov ax,@data	
	mov ds,ax    
@infinite:    
    lea dx,msg
    mov ah,9
    int 21h
@input:
    mov ah,1
    int 21h 
    mov bl,al
    
    mov ah,1
    int 21h 
    mov dl,al
    
    mov ah,1
    int 21h 
    mov cl,al
    
    mov ah,1
    int 21h ;this value will be stored in al  

@process:       
    cmp bl,al
    je @next
    jne @print_not_palindrome    
    
    @next:
        cmp dl,cl
        je @print_palindrome
        jne @print_not_palindrome 
    
@stop:     
	mov ah,4ch
	int 21h		  ;terminate with return code
main endp 
@print_palindrome:
    lea dx,msg1
    mov ah,9
    int 21h
    jmp @infinite
@print_not_palindrome:
    lea dx,msg2
    mov ah,9
    int 21h
    jmp @infinite
end main
