;Day-10          Date-19/04/21
;; problem - Prompt user to give ascii value and print it's binary form and count no. of one If no. of one is even print EVEN otherwise print ODD      

.model small	
.stack 100h		
include 'emu8086.inc' 

.data   

i db ?
n_line db 0ah,0dh,"$";for new line 
p db 00000000b  
msg db 0ah,0dh,"Total no. of one present: $"
msg1 db 0ah,0dh,"ODD $"
msg2 db 0ah,0dh,"EVEN $"    
;res db ?   
no_of_one db 0d     ;no_of_one at now: 00000000 

.code

main proc
	mov ax,@data	
	mov ds,ax  

	@input: 
        mov ah,1            
        int 21h  
        mov bl,al
       ;mov res,bl 
        mov i,31h   ;31h means 1d 
        
        lea dx,n_line
        mov ah,9
        int 21h  
        
        jmp @next_step
         
    @next_step: 
       ; mov cl,08h 
       ; mov dh, 00h
                   
        shl bl,1 
  
        jc @print1  ;carry flag always check for immediate registers carry so,i can't write here
        jnc @print0
        
    @further_step:    
        cmp i,38h   ;38h means 8d  
        inc i       ; why cause i variable is gonna stored value as hexa
        jbe @next_step
        
    @odd-even: 
        lea dx,msg
        mov ah,9
        int 21h
        
        mov dl,no_of_one 
        add dl,48
        mov ah,2
        int 21h
        
        AND no_of_one,00000001b  ;By doing AND operator i'm changing no_of_one to 0.it will help me for infinite run
        cmp no_of_one,0     
        je @print_EVEN
        jne @print_ODD    
            	
    jmp @input 
	mov ah,4ch
	int 21h		;terminate with return code
main endp 
@print1:
    or bl,p 
   ;mov res,bl 
    
    inc no_of_one
    
    mov dl,31h
    mov ah,2
    int 21h 
    jmp @further_step
@print0: 
    or bl,p 
   ;mov res,bl  
    
    mov dl,30h
    mov ah,2
    int 21h 
    jmp @further_step
@print_EVEN:
    lea dx,msg2
    mov ah,9
    int 21h 
    
    lea dx,n_line
    mov ah,9
    int 21h     
    
    jmp @input
@print_ODD:
    lea dx,msg1
    mov ah,9
    int 21h    
    
    lea dx,n_line
    mov ah,9
    int 21h  
    
    jmp @input             
            
end main
;0 means 30h in register
;1 means 31h in register	
