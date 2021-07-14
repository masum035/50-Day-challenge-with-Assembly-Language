; id-201914044 (problem-03)
.model small	
.stack 100h		
include 'emu8086.inc'

.data

n_line db 0ah,0dh,"$"
message db 10,13,"enter hex number(0~9...A~F):",10,13,"$"    
try db 10,13,"Try Again:$"
output db 10,13,"Output:",10,13,"$"
againInput db 10,13,"another input? press y or Y to continue...",10,13,"$"
termination db 10,13,"Programme Terminating...$"

.code

main proc
	mov ax,@data	
	mov ds,ax    
@onceMore:    
    lea dx,message
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
       
    cmp bl,30h
    jl @try
    cmp bl,39h
    jle @digit
    cmp bl,46h
    jg @try
    
    sub bl,11h     ; if input F: means 46h-11h=35h=charachter 5  
    
    lea dx,output
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,31h
    int 21h
    mov dl,bl
    int 21h
    
    jmp @again
    
    @digit:
    lea dx,output
    mov ah,9
    int 21h
        
    mov ah,2
    mov dl,bl
    int 21h
    
    @again:
    lea dx,againInput
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h 
    mov bl,al
    
    lea dx,n_line
    mov ah,9
    int 21h
    
    cmp bl,'y'
    je @onceMore
    cmp bl,'Y'
    je @onceMore
    jne @stop
    
    @try:                                
    lea dx,try  
    mov ah,9
    int 21h  
    
    jmp @onceMore
  
@stop: 
    lea dx,termination
    mov ah,9
    int 21h
        
	mov ah,4ch ;terminate
	int 21h		
main endp
end main
