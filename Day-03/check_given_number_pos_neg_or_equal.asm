;Day 03        Date-09 april,2021
;Problem- Check Given Number is positive,negative or zero

include 'emu8086.inc' 
.model small	
.stack 100h		

.data
  
n_line db 0ah,0dh,"$"   ;for new line 
var  db 0D   ;decimal 0
var1 db ?
var2 db ?
str  dw "Input number is zero","$"  
strl dw "Input number is negative","$"
strg dw "Input number is positive","$"  
msg  dw "Input Your number : $"

.code 
    
main proc
	mov ax,@data
	mov ds,ax    
    
    lea dx,msg   ; For msg1 print
    mov ah,09
    int 21h 
    
    mov ah,1
    int 21h
    
    ;sub al,48
    mov dl,al
     
         
    printn        ; for new line   
    
    mov cl,30h        ; This command 30h is for less(<) or greater(>)
    cmp dl,cl         ; what actually cmp does is, it subtracts destination from source without changing their value
                      ; so,if var1=6 , var2 = 9 then cmp var2(stored in register),var1 will give result (var2-var1)
                        
    je print_zero
    ;jb print_lower   ; so,here will be ja instead for jb
    ;ja print_greater ; same goes here 
    jg print_positive
    jl print_negative
    
    
stop:
	mov ah,4ch
	int 21h		  ;terminate with return code
main endp 

print_negative:
    lea dx,strl   ; For strl print
    mov ah,09
    int 21h
    jmp stop
print_positive:      
    lea dx,strg   ; For strg print
    mov ah,09
    int 21h 
    jmp stop
print_zero:
    lea dx,str    ; For str print
    mov ah,09
    int 21h 
    jmp stop
end main

