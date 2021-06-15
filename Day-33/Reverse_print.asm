; Day-33    Date-28/05/2021
; reverse order print of 8 chars/digits
.model small	
.stack 100h		
include 'emu8086.inc'

.data

n_line db 0ah,0dh,"$"    

.code

main proc
	mov ax,@data	
	mov ds,ax 
	
	mov dx,0
	mov cx,8
	mov ax,0
	mov bx,0
	
	@input:
	    mov ah,1
	    int 21h
	    ;add ax,'0'
	    push ax
	    xor ax,ax
	loop @input 
	
	lea dx,n_line  
    mov ah,9
    int 21h
  
	xor cx,cx
	mov cx,8
	@output: 
	    pop dx   
	    ;add dx,'0'
	    mov ah,2
	    int 21h
	loop @output 
                                   
    lea dx,n_line  
    mov ah,9
    int 21h
  
@stop:     
	mov ah,4ch ;terminate
	int 21h		
main endp
end main
