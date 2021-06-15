;Day-26       Date-17 May,2021

;SAL and SAR are similar to SHL and SHR
.model small	
.stack 100h		
include 'emu8086.inc'

.data

n_line db 0ah,0dh,"$"    

.code

main proc
	mov ax,@data	
	mov ds,ax    
    
    mov al,00000101b 
    mov bl,0
@count_shift:
    sal al,1   ; shl al,1
    inc bl
        
    jnc @count_shift   ;uptill the first 1 is not found in register,loop then
    
    mov dl,bl
    add dl,30h
    mov ah,2
    int 21h
@prepare:
    lea dx,n_line
    mov ah,9
    int 21h
    
    xor ax,ax
    xor bx,bx      
    mov al,0000100b
    mov bl,0
@count_shift_right:
    sar al,1         ;shr al,1  ;will give the same result
    inc bl
    
    jnc @count_shift_right
    
    mov dl,bl
    add dl,30h
    mov ah,2
    int 21h
             
@stop:     
	mov ah,4ch
	int 21h		
main endp
end main
