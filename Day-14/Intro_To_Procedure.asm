;Day 14           Date-24 april,2021
;in every code - i will try to use $ for procedure and @ for label      

;To call a procedure - call procedure_name
;To create procedure - procedure_name proc
;N.B - ret must be used every end of procedure

.model small	
.stack 100h		
include 'emu8086.inc' 

.data

n_line db 0ah,0dh,"$"   ;for new line 
msg1 db "Enter Two Number : $"
msg2 db 10,13,"Result : $"    
a db ?
b db ?
.code

main proc
	mov ax,@data	
	mov ds,ax    

$proc1 proc	
    lea dx,msg1
    mov ah,9
    int 21h  
    
    mov ah,1
    int 21h 
    ;sub al,48
    mov a,al    
    
    mov ah,1
    int 21h 
    ;sub al,48
    mov b,al
    
    call $proc2
    ret
$proc2 proc
    mov ah,9
    lea dx,msg2
    int 21h  
    
    mov bl,a
    add bl,b
    sub bl,48
    
    mov ah,2    ;as it's for single char output
    mov dl,bl   ;that's why it will show illegal char if the addition exceeds 9 
    int 21h
    
    cmp bl,13   ;if carrige gets then jump to @stop
    jmp @stop
    ret  
    
@stop:     
	mov ah,4ch
	int 21h		;terminate with return code

end main
