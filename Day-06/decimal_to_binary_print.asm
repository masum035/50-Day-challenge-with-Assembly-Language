;Day 06_________date-12 april,2021
;problem- decimal number is given print its binary number

.model small	
.stack 100h		
include 'emu8086.inc' 

.data

n_line db 0ah,0dh,"$"   ;for new line 

.code

main proc
	mov ax,@data	
	mov ds,ax    
    
	mov bl,189d   ;input any number here less than 255 as 8 bit  
    mov cx,8
    shift:
    shl bl,1
    
    jc print1
    jnc print0
    print0:
        mov dl,0
        add dl,48
        mov ah,2
        int 21h  
        jmp here 
    print1:
        mov dl,1
        add dl,48
        mov ah,2
        int 21h  
        jmp here   
         
    here:
    loop shift
    lea dx,n_line ;new line 
    mov ah,9
    int 21h 
     
	mov ah,4ch
	int 21h		;terminate with return code
main endp
end main
