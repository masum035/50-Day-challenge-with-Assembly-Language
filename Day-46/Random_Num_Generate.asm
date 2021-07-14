; id-201914044 (problem no-05) 
.model small	
.stack 100h		
;include 'emu8086.inc'

.data

n_line db 0ah,0dh,"$"    
msg db "have to enter 16 digit binary number",10,13,"$"
var dw ?  

.code

main proc
	mov ax,@data	
	mov ds,ax    
                                   
    lea dx,msg 
    mov ah,9
    int 21h       
    
    xor dx,dx  
    call read  
    mov cx,100
    @100Times:
    call random 
    call write
    mov ax,var
    loop @100Times
  
@stop:     
	mov ah,4ch ;terminate
	int 21h		
main endp 
random proc 
    xor dx,dx
    
    shl ax,1 ; shift lefted once
    ;now i need to get 14th & 15th bit value 
    
    test ax,0010000000000000b ; 14th bit testing
    jz @14thBitOne
    
    mov dl,0      ; i'm storing 14th bit value in dl  
    jmp @chek15th
    @14thBitOne:
    mov dl,1 
    
    @chek15th:
    test ax,0100000000000000b ; 15th bit testing
    jz @15thBitOne
    
    mov dh,0
    jmp @xorOperation
    @15thBitOne:
    mov dh,1
    
    @xorOperation:
    xor dl,dh  ; value stored in dl
    
    or al,dl   ; replaced 0th bit by the xor of 14th & 15th bit
    and ax,1011111111111111b ; cleared 15th bit
    mov var,ax        
    ret
random endp

read proc  
    xor ax,ax 
    xor bx,bx
    mov cx,16d
    mov ah,1
    @read:
        int 21h   
        and al,15d  ; and with 0F
        shl bx,1    ; bx er danpasher 1ta space khali kore dilam 
        or bl,al    ; oi empty space ta fill up kore dilam            
    loop @read
    
    lea dx,n_line
    mov ah,9
    int 21h
     
    mov ax,bx       ; ax contains now 15 bit number
    ret
read endp

write proc   
    mov bx,ax
    
    mov si,0d     
    @write:
    cmp si,16d
    jge @newLine 
    cmp si,4d
    je @space
    cmp si,8d
    je @space
    cmp si,12d
    je @space
    @continue:
        shl bx,1
        jnc @zero 
        mov ah,2
        mov dl,31h
        int 21h 
        jmp @increment
        @zero:
        mov ah,2
        mov dl,30h
        int 21h  
        jmp @increment 
        @space: 
        mov ah,2
        mov dl,32d
        int 21h  
        jmp @continue 
    @increment:    
    inc si
    jmp @write  
    @newLine:
    lea dx,n_line
    mov ah,9
    int 21h
    ret
write endp    
    
end main
