;Day 04         Date (10/04/21)
;problem - Read Three Numbers from User and Display Largest Number

.model small
.stack 100h
include 'emu8086.inc'   

.data
n_line db 0ah,0dh,"$"   ;for new line    
var1 db ?
var2 db ?
var3 db ?

msg1 db "Enter First Number  : $"
msg2 db 10,13,"Enter Second Number : $"
msg3 db 10,13,"Enter Third Number  : $" 
f_msg db 10,13,"Greatest Number is  : $"
.code

main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,msg1
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h    
    mov var1,al 
        
    ;lea dx,n_line   ; new line
    ;mov ah,9
    ;int 21h

    lea dx,msg2
    mov ah,9
    int 21h
          
    mov ah,1
    int 21h    
    mov var2,al 

    lea dx,msg3
    mov ah,9
    int 21h
        
    mov ah,1
    int 21h    
    mov var3,al  
    
    
    ;now for comparison
    mov dl,var1
    cmp dl,var2
    jae number1
    jb number2

number1:
    mov dl,var1
    cmp dl,var3
    jae num1_greater
    jb num3_greater
number2:
    mov dl,var2
    cmp dl,var3
    jae num2_greater
    jb num3_greater  
        
stop:
    mov ah,4ch      ; terminate
    int 21h    
main endp

num1_greater:
    lea dx,f_msg
    mov ah,9
    int 21h
    
    mov dl,var1
    mov ah,2
    int 21h  
    jmp stop  
num2_greater:
    lea dx,f_msg
    mov ah,9
    int 21h
    
    mov dl,var2
    mov ah,2
    int 21h 
    jmp stop   
num3_greater:
    lea dx,f_msg
    mov ah,9
    int 21h
    
    mov dl,var3
    mov ah,2
    int 21h
    jmp stop    
end main
