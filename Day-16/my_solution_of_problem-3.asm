Day-16        Date-26 April,2021
.model small	
.stack 100h		
include 'emu8086.inc' 

.data

n_line db 0ah,0dh,"$"   ;for new line   
msg1 db "Input: $"
msg2 db 10,13,"Output: $"
num db 0h
var dw ?
count db 0d
.code

main proc
	mov ax,@data	
	mov ds,ax 
	xor bx,bx 
	
	lea dx,msg1
	mov ah,9
	int 21h  
@input:    
    mov ah,1
    int 21h
    cmp al,0Dh ;cheking for enter
    je @output
    
    mov bx,ax
    push bx    ;now stack pointer will increase 2 step    
    inc count
    jmp @input  
    
@output: 
    lea dx,msg2
    mov ah,9
    int 21h      

@inside_output: 
     cmp count,0d
     je @stop
     
     pop bx
     mov dx,bx
     mov ah,2
     int 21h
     
     dec count
     jmp @inside_output
       
@stop:     
	mov ah,4ch
	int 21h		;terminate with return code
main endp
end main
