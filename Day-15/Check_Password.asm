;Day 15         Date-25 april,2021
;problem- match password while hiding input chararchter & instantly caught wrong input & terminate program if password matched

.model small	
.stack 100h		
include 'emu8086.inc' 

.data
msg1 db "Enter your password : $" 
msg2 db 10,13,"!!! Password Matched !!! $"
msg3 db 10,13,"### Wrong Password ### $" 
pass db "masumbhai"
pass1 dw 8
n_line db 0ah,0dh,"$"   ;for new line 

.code

main proc
	mov ax,@data	
	mov ds,ax    
@infinite:
	mov cx,pass1
	mov bx,offset pass   ;why (lea bx,pass) didn't work? 
	
	mov ah,9
	lea dx,msg1
	int 21h
@l1:
    mov ah,08h    ;ascii back means hide charachter
    int 21h
    
    cmp al,[bx]
    jne @l2
    inc bx
    loop @l1
    
    mov ah,9
    lea dx,msg2
    int 21h
    jmp @stop
    	
@l2:
    mov ah,9
    lea dx,msg3
    int 21h   
    
    lea dx,n_line
    mov ah,9
    int 21h
    
    jmp @infinite 
@stop:     
	mov ah,4ch
	int 21h		;terminate with return code
main endp
end main
