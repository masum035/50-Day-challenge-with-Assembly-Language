;problem - find char is present in given string or not
.model small	
.stack 100h		
include 'emu8086.inc'

.data

n_line db 0ah,0dh,"$"    
str db 'ABCAD'

.code

main proc
	mov ax,@data	
	mov ds,ax 
	mov es,ax
	
	lea di,str   
    mov al,'D'
    cld
    
    mov cx,5
    repne scasb
    je @found   ; last value-er jonno zero flag ki set hoise kina sheta dekhlam
    
    @not_found: 
        MOV DL,30H  ; 0
        mov ah,2  
        int 21h   
        
        jmp @stop
    @found:
        mov dl,31h   ; 1
        mov ah,2
        int 21h
                                         
  
@stop:     
	mov ah,4ch ;terminate
	int 21h		
main endp
end main
