;Day-17       Date - 27 April,2021
;problem - input score of both teams(2 digit) where score is less than 100 then print the winner
.model small	
.stack 100h		
include 'emu8086.inc' 

.data

n_line db 0ah,0dh,"$"   ;for new line 
msg1 db "Score of Bangladesh: $"
msg2 db "Score of New Zealand: $"    
winner1 db "Bangladesh $"
winner2 db "New Zealand $"   
tie db "Tie $"   
a db ?
b db ?
c db ?
d db ?

.code

main proc
	mov ax,@data	
	mov ds,ax    
@infinite:
    lea dx,msg1
    mov ah,9
    int 21h 
	 
	mov ah,1
	int 21h
	mov a,al
	
	mov ah,1
	int 21h
	mov b,al
	
	printn
	
	lea dx,msg2
    mov ah,9
    int 21h 
	 
	mov ah,1
	int 21h
	mov c,al
	
	mov ah,1
	int 21h
	mov d,al
	 
    printn  
    
@process:
   mov bl,a
   cmp bl,c
   jg @printB
   jl @printN 
   
   mov cl,c
   cmp b,cl
   jg @printB
   jl @printN 
   
   lea dx,tie
   mov ah,9
   int 21h   
   printn
   jmp @infinite
@stop:     
	mov ah,4ch
	int 21h		;terminate with return code
main endp
@printN:
    lea dx,winner2
    mov ah,9
    int 21h  
    printn
    jmp @infinite  
@printB:
    lea dx,winner1
    mov ah,9
    int 21h  
    printn
    jmp @infinite    
end main
