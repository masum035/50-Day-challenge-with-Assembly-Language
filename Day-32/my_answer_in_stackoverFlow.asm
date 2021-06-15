; Day-32        Date-25 May,2021

.model small      ; declaring this code will be consists of one data segment and one code segment
.stack 100h       ; stack is initializeed to offset address at 100h

.data
  ; //this is data segment   
.code 

main proc 
    mov ax,@data  ; copying starting address of data segment into ax register
    mov ds,ax     ; by copying ax into ds we are initializing data segment  

loop1: 
    add ax,dx 
    cmp dx,100     ; here put the desired input 
    je loop1_end 
    
    inc dx 
    jmp loop1 

loop1_end: 
                   ; after completing loop1, the result is stored in ax register   
    mov dx,0 
    
digit_push:
    cmp ax,0
    je print_number     
      
    mov bx,10          
    div bx          ; ah = reminder  & al = quotient
                 
    push dx         ; after dividing,reminder is pushed into stack        
           
    xor dx,dx       ; clearing dx register for next loop 
    
    jmp digit_push  
    
print_number:
    cmp sp,100h     ; cheking the stack pointer is returned to initial address or not
    je stop

    pop dx          ; pop the top of the stack & storing it to dx register
    add dx,30h      ; 30h = 48d = ascii charachter 0

    mov ah,02h
    int 21h

    jmp print_number

stop:
    mov ah,4ch      ; terminate the programme
    int 21h 

main endp           ; ending of main procedure
end main            ; ending of code segment
                 
