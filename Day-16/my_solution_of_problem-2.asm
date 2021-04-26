;id - 201914044
;i tried to implement this (prime number between 1 to 10):
;for (int i=1;i<=10;i++){
; int ctr=0;
; for(int j=2;j<=(i-1);j++){
;  if(i%j == 0){
;   ctr++;
;   break;
;  }
; }
; if(ctr == 0 && i != 1){
;  printf("%d",i);
; }
;}
;Somehow couldn't succeed 

.model small	
.stack 100h		
include 'emu8086.inc' 

.data

n_line db 0ah,0dh,"$"   ;for new line 
 
num dw 10d    ;this is input
i dw 1d   
j dw 2d  
p dw ? 
ctr db 0d
.code

main proc
	mov ax,@data	
	mov ds,ax   
	
	xor cx,cx   ;At first,i tried to clear all register
	xor bx,bx
	xor dx,dx
 
@procedure:  
    mov cx,num
    cmp i,cx
    ja @stop    
    mov ctr,0d   
    
    mov bx,i
    dec bx
    mov p,bx      ;here p = i-1
    xor bx,bx     ;bx is used later,so i am clearing now
    @inside:   
        mov bx,p
        cmp j,bx
        jg @inside_out
        
        @main_part: 
             mov ax,i 
             cwd
             div j
             cmp ah,0d   ;cheking if not having reminder
             inc ctr
             je @inside_out
        inc j 
        jmp @inside
    @inside_out:            
    cmp ctr,0d
    je @next  
    jne @further
    @next:
        cmp i,1d
        jne @print 
    @further:        
    inc i
    jmp @procedure     
    
@stop:     
	mov ah,4ch
	int 21h		;terminate with return code
main endp
@print:
    mov dx,i 
    add dx,48
    mov ah,2
    int 21h
    jmp @further
end main  
