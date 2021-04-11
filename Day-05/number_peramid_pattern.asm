;day-05      date-11/04/21   
;problem - if input small letter/capital letter/number then print number peramid (where max n=9) this process will loop infinite until $ press
.model small
.stack 100h
include 'emu8086.inc'

.data        

n_line db 0ah,0dh,"$"   ;for new line
n db ? 
spc db 0    
msg db "n = $"
     
.code


main proc
     mov ax,@data
     mov ds,ax
     
input:
     lea dx,msg   ;printing msg
     mov ah,9
     int 21h
          
     mov ah,1     ;take input
     int 21h
     mov n,al   
     
     cmp al,'$'
     je stop
     
     lea dx,n_line ;new line 
     mov ah,9
     int 21h   
            
check:
     cmp n,97
     jge small_letter
     cmp n,65
     jge capital_letter
     cmp n,48
     jge number
     
opearation: 
         ;mov dl,n  
         outer_init:
            mov bl,1   ; bl = 1
            mov bh,n   ; trick is here: i am storing 8 bit data into 16 bit register
            mov spc,bh
            dec spc    ; now spc = n-1    
         outer_loop:
            cmp bl,n
            jg repeat
        
            inner1_init:
                mov bh,1   
            inner1:    
                cmp bh,spc
                jg inner2_init
                mov dl,32
                mov ah,2
                int 21h
                inc bh 
                
                jmp inner1
            inner2_init:
                mov ch,0    ;if use cl for rotation than make sure ch=0
                mov cl,bl
            inner2:
                cmp cl,0
                jle exit
                
                mov dl,bl   
                add dl,48
                mov ah,2
                int 21h 
                
                mov dl,32   ;for space
                mov ah,2
                int 21h
                
                dec cx    
                
                jmp inner2
             exit:
                inc bl
                dec spc 
                
                lea dx,n_line ;new line 
                mov ah,9
                int 21h    
                jmp outer_loop
                
                   
repeat:
    printn
    jmp input        
        
     
stop:    
    mov ah,4ch 
    int 21h
    main endp 

small_letter:
    sub n,96
    jmp opearation
capital_letter:
    sub n,64
    jmp opearation
number:
    sub n,48
    jmp opearation           
end main

