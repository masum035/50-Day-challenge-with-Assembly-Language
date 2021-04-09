;Day 03         Date- 09 april,2021
;problem - print A-Z and then a-z using loop

.model small	
.stack 100h		

.data
n_line db 0ah,0dh,"$"   ;for new line

.code
print_capital_A-Z:
    ;mov dl,65
    mov ah,2
    int 21h
    add dl,1  

       
print_small_a-z:
    mov ah,2
    int 21h
    add dl,1 
       
      
main proc
	mov ax,@data	
	mov ds,ax    

	;Write your code here
	mov cx,26
	mov dl,65
    
    A-Z:
        mov ah,2
        int 21h
        inc dl
    loop A-Z
	 
    lea dx,n_line   ; print new line
    mov ah,9
    int 21h 
    
    mov cx,26 
    mov dl,97
    a--z:
        mov ah,2
        int 21h 
        inc dl
    loop a--z
        
	mov ah,4ch
	int 21h	
main endp
end main
