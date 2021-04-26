;day - 16       Date-26 april,2021
.model small	
.stack 100h		
include 'emu8086.inc' 

.data

n_line db 0ah,0dh,"$"   ;for new line  
msg1 db "input : $"
msg2 db 10,13,"output : $" 
num db ?
count db ?

.code

main proc
	mov ax,@data	
	mov ds,ax    
    
    lea dx,msg1
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    sub al,48   
    mov num,al
	
	xor bx,bx     
	xor dx,dx
@input:  
    add dx,bx
    cmp num,0
    je @next_step
    	       
    mov al,num 
    mul num
    mul num
    
    mov bx,ax     
    dec num
    jmp @input
    
@next_step:  
    mov bx,dx     ;my result is stored in dx so i'm moving it
    
    lea dx,msg2
    mov ah,9
    int 21h
    
    mov ax,bx
    mov count,0
    mov dx,0    
    xor bx,bx
    @output:
        cmp ax,0
        je @inside_output      
          
        mov bx,10          
        div bx                  
        push dx              

        inc count              
        xor dx,dx   ;clearing dx register for my next loop
        jmp @output   
        
    @inside_output:
        cmp count,0
        je @stop

        pop dx
        add dx,48

        mov ah,02h
        int 21h

        dec count
        jmp @inside_output
@stop:     
	mov ah,4ch
	int 21h		    ;terminate with return code
main endp 
   
end main
