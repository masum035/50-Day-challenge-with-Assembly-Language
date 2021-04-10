;Day 04         Date (10/04/21)
;problem- Check Given_number_is_odd_or_even
.model small
.stack 100h
include 'emu8086.inc'

.data 

n_line db 0ah,0dh,"$"   ;for new line
msg1 db "input your number : $"
msg2 db 10,13,"The number is odd $"
msg3 db 10,13,"The number is even $"

.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov bl,2    ; i am storing it at first cause (even-odd depends on) divisible by 2
    
    lea dx,msg1
    mov ah,9
    int 21h
    
    lea dx,n_line
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
        
    div bl ; divide al by bl 
    cmp ah,0
    je even
    jmp odd  
        

stop:    
	mov ah,4ch
	int 21h		;terminate with return code
main endp  
odd:
    lea dx,msg2
    mov ah,9
    int 21h
    jmp stop
even:
    lea dx,msg3
    mov ah,9
    int 21h
    jmp stop    
end main

