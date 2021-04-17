;Day 08         Date-17 april,2021
;problem - display the ASCII characters that display 10 characters per line

.model small	
.stack 100h		
include 'emu8086.inc' 

.data

n_line db 0ah,0dh,"$"   ;for new line 
i db 0d
j db 0d
.code

main proc
	mov ax,@data	
	mov ds,ax    

	mov cx,255      ;for loop counter
	xor dx,dx       ;clear bx register
	@output:
	    cmp j,10d
	    je @new_line
	       
	    mov dl,i
	    mov ah,2
	    int 21h 
	    
	    inc i  
	    inc j
	     
	    mov dl,32d   ;for space
	    mov ah,2
	    int 21h    
	@check_point:
	    cmp i,255d
	    jae @stop
	    jb @output     
	@new_line:
	    mov j,0d    
        lea dx,n_line ;new line 
        mov ah,9
        int 21h 
        jmp @check_point  
        
    @stop: 
	mov ah,4ch
	int 21h		      ;terminate with return code
main endp
end main
