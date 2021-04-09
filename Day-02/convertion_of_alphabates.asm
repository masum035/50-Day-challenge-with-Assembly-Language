;Day 02         date-08 april,2021
;problem - programme to print captal letter to small letter or if small letter than print capital letter, infinite times input

.model small
.stack 100h 

.data 
n_line db 0ah,0dh,"$"   ;for new line
var_char db ? 
 
.code
capital_print:
    mov dl,97
    sub dl,65
    sub var_char,dl 
    
    ;print new line
    lea dx,n_line
    mov ah,9
    int 21h
    
    mov dl,var_char
    mov ah,2
    int 21h     
    
    ;print new line
    lea dx,n_line
    mov ah,9
    int 21h
    
    jmp infinite_label 
      
small_print:
    mov dl,97
    sub dl,65
    add var_char,dl
     
    ;print new line
    lea dx,n_line
    mov ah,9
    int 21h
    
    mov dl,var_char
    mov ah,2
    int 21h  
    
    ;print new line
    lea dx,n_line
    mov ah,9
    int 21h
    
    jmp infinite_label
    
infinite_label:
    ;take input
    mov ah,1
    int 21h 
    
    mov var_char,al
    
    cmp var_char,97
    jae capital_print
      
    cmp var_char,65  
    jae small_print  
    
          
main proc
    mov ax,@data
    mov ds,ax
    
    jmp infinite_label

    mov ah,4ch
    int 21h    
main endp 
end main
