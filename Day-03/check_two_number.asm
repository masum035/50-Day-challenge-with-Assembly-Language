;Day 03        Date-09 april,2021
;Problem- Input Two Number and Check Given Number are Equal,greater or lesser

include 'emu8086.inc' 
.model small	
.stack 100h		

.data
  
n_line db 0ah,0dh,"$"   ;for new line
var1 db ?
var2 db ?
str dw "They are equal","$"  
strl dw "1st number is lower than 2nd number","$"
strg dw "1st number is greater than 2nd number","$"  
msg1 dw "Input 1st number $"
msg2 dw "Input 2nd number $" 

.code 
    
main proc
	mov ax,@data
	mov ds,ax    
    
    lea dx,msg1   ; For msg1 print
    mov ah,09
    int 21h 
    
    mov ah,1
    int 21h
    
    mov var1,al
    sub var1,48 
         
    printn        ; for new line
    
    lea dx,msg2   ; For msg2 print
    mov ah,09
    int 21h
     
    mov ah,1
    int 21h
    
    mov var2,al
    sub var2,48   
    mov dl,var2
    
    printn  ; for new line
    
    cmp dl,var1       ; what actually cmp does is, it subtracts destination from source without changing their value
                      ; so,if var1=6 , var2 = 9 then cmp var2(stored in register),var1 will give result (var2-var1)  
    je print_equal
    ;jb print_lower   ; so,here will be ja instead for jb
    ;ja print_greater ; same goes here 
    jb print_greater
    ja print_lower
    
    
    stop:
	mov ah,4ch
	int 21h		  ;terminate with return code
main endp 

print_lower:
    lea dx,strl   ; For strl print
    mov ah,09
    int 21h
    jmp stop
print_greater:      
    lea dx,strg   ; For strg print
    mov ah,09
    int 21h 
    jmp stop
print_equal:
    lea dx,str    ; For str print
    mov ah,09
    int 21h 
    jmp stop
end main

