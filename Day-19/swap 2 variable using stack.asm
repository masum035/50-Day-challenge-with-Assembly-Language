;Day 19         Date-30 April,2021
;problem - swap 2 variable using stack

.model small	
.stack 100h		
include 'emu8086.inc' 

.data

n_line db 0ah,0dh,"$"   ;for new line 
a dw ? 
b dw ?
.code

main proc
	mov ax,@data	
	mov ds,ax    

	mov ax,2
	mov dx,3
	push ax
	push dx
	pop ax  
	mov a,ax
	pop dx
	mov b,dx

  lea dx,n_line ;new line 
  mov ah,9
  int 21h 
     
	mov ah,4ch
	int 21h		;terminate with return code
main endp
end main
