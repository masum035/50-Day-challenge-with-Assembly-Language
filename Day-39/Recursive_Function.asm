; Day-39     Date-9 june,2021
; factorial(int n)
; {
;     if(n==1)
;         return n
;     else
;         return n*factorial(n-1)
; }    
.model small	
.stack 100h		
include 'emu8086.inc'

.data

n_line db 0ah,0dh,"$"    

.code
$factorial proc
    push bp
    mov bp,sp
; stack er joto kaj ase shob bp diye korbo
 
    cmp bx,1
    je @return
    
        dec bx
        mul bx
        mov dx,ax
        call $factorial
         
    @return:
    pop bp
    ret
$factorial endp
main proc
	mov ax,@data	
	mov ds,ax    
    
    xor ax,ax                               
    xor bx,bx
    xor cx,cx
    xor dx,dx
    
    mov ah,1
    int 21h
    sub al,30h
    
    mov ah,0
    mov bx,ax
    call $factorial

@stop:     
	mov ah,4ch ;terminate
	int 21h		
main endp
end main
