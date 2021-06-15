;Day     Date-16 May,2021

;LOOPZ and LOOPE is similar
;loopz   Here the extra condition is zero flag must be set to continue loop
;Syntax :
;@top_lavel:
;  //do something
;cmp instruction - to set/reset zero flag
;loopz @top_lavel
;If ECX or CX > 0 and ZF = 1  Then jumps to label  

;Loope instruction
;If CX > 0 and ZF is set
;Syntax :
;@top_lavel:
;  //do something  
;cmp instruction - to set/reset zero flag
;loope @top_lavel

.model small	
.stack 100h		
include 'emu8086.inc'

.data

n_line db 0ah,0dh,"$"    

.code

main proc
	mov ax,@data	
	mov ds,ax    
   
   mov cx,5 
   mov bx,5
@label1:
    mov dl,69
    mov ah,2h
    int 21h	 
   
   cmp bx,5   ;here i'm setting zero flag to 1 
   loopz @label1 
@rest:  
   lea dx,n_line
   mov ah,9
   int 21h   
    
   mov dl,66
   mov ah,2h
   int 21h  
   
   lea dx,n_line
   mov ah,9
   int 21h   
   
   xor cx,cx 
   xor bx,bx
   mov cx,5
   mov bx,5     
@label2:
    mov dl,74
    mov ah,2
    int 21h
    
    cmp bx,5
    loope @label2   
   
@stop:     
	mov ah,4ch
	int 21h	         
main endp   
end main
