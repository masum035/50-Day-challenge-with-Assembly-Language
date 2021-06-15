; Day-37       Date-07 june,2021

; condiotional rep instruction
; repe : repeat while equal
; repz : repeat while zero
; repne: repeat while not equal
; repnz: repeat while not zero
 
; problem- 2 string is equal or not? 
.model small	
.stack 100h		
include 'emu8086.inc'

.data

n_line db 0ah,0dh,"$"    
str1 db 'ABC'
str2 db 'ABD'

.code

main proc
	mov ax,@data	
	mov ds,ax    
    mov es,ax
    
    lea si,str1
    lea di,str2
    cld
    
    jmp @another_way ; comment-uncommment it means loop instruction is not needed here
    
    mov cx,3
    
    @comparison:
        cmpsb
    jne @not_equal1
    loop @comparison
    
    @equal1:  
        mov dl,31h
        mov ah,2
        int 21h 
        
        jmp @stop       
    @not_equal1:
        mov dl,30h
        mov ah,2
        int 21h  
     
    jmp @stop
     
    @another_way:
        mov cx,3
        repe cmpsb  ; or here repz will give same result 
        jne @not_equal2
        
        @equal2:  
        mov dl,31h
        mov ah,2
        int 21h 
        
        jmp @stop       
    @not_equal2:
        mov dl,30h
        mov ah,2
        int 21h  
  
         
@stop:          
	mov ah,4ch ;terminate
	int 21h		
main endp
end main
