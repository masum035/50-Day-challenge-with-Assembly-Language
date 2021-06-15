; Day-24         Date:15 May,2021
; Push,POP and pushf,popf and psha,popa
.model small	
.stack 100h		
include 'emu8086.inc'

.data

n_line db 0ah,0dh,"$"    
saveFlags dw ?

.code

main proc
	mov ax,@data	
	mov ds,ax    
    
    xor ax,ax
    mov ax,80h
    
    push ax   ;storing data ax into top of the stack
    pop cx    ;pop the top data into cx register here  
    
    pushf     ;store the flag values in top of stack
    pop saveFlags  ;now i'm storing that value into a variable
                         
  ; push saveFlags
  ; popf      
    
    xor ax,ax
    xor bx,bx
    xor cx,cx
    xor dx,dx
    
    mov ax,1
    mov bx,5
    mov cx,3  
    
    pusha
   ;How pusha stores value: ax->cx->dx->bx->sp->bp->si->di
    
    mov ax,5
    mov bx,5
    mov cx,5
   ;Whatever written in between pusha & popa will get rid when popa will called 
    popa   ;see all the values are set to before calling pusha     
         
@stop:     
	mov ah,4ch
	int 21h		
main endp
end main
