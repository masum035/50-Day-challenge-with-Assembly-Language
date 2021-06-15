.model small	
.stack 100h		
include 'emu8086.inc'

.data

n_line db 0ah,0dh,"$"    
str1 db 'ABC'
str2 db 3 dup(?)

.code

main proc
	mov ax,@data	
	mov ds,ax    
    
    mov cx,3
    @str_loop:
        lodsb
            add al,3
        stosb
    loop @str_loop
   
    ;lea si,str2 
    ;mov ah,2   
                                    
    ;lea si,str2
    ;mov dl,[si]  
    ;int 21h
    lea dx,str2
    mov ah,9
    int 21h
  
@stop:     
	mov ah,4ch ;terminate
	int 21h		
main endp
end main
