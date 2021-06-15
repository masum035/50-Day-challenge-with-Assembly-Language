; Day 23                  Date-13 May,2021
;run in single step & click flags & click view -> extended value viewer
.model small	
.stack 100h		
include 'emu8086.inc'

.data

.code 

$FlagFunction proc
    xor ax,ax ;clearing ax register & zero flag(ZF) will be 1
    mov al,255
    add al,1  ;Here Overflow happens so carry flag(CF) will be 1
              ;Here Auxilary flag(AF) will also be 1
                                   
    xor ax,ax ;clearing ax register & zero flag will be 1
    
    mov al,3
    and al,al ;Here parity flag will be 1
    
    xor ax,ax ;clearing ax register & zero flag will be 1
    xor bx,bx ;clearing bx register & zero flag will be 1
    
    mov ax,5
    mov bx,7
    
    sub ax,bx ;Here Sign Flag(SF) will be 1 (means negative)
    add ax,bx ;Here Sign Flag(SF) will be 0 (means positive)   
    
              ;Direction Flag(DF) 0 means reading string forward  
              ;Direction Flag(DF) 1 means reading string backward
   
     std      ;this will set Direction Flag 1
     cld      ;this will set Direction Flag 0
     
     
     stc      ;this will set Carry Flag 1
     clc      ;this will set Carry Flag 0     
             
     xor ax,ax ;clearing ax register & zero flag will be 1
     
    ;Overflow flag represents sign over-Flow .It checks did sign changed or not?
     mov al,255 ;                                       (1111111)
     shr al,1   ;now,shr will store LSB to Carry Flag   (01111111)  
                ;So,Overflow Flag will be 1    
     add al,1   ;Here,OverFlow flag will be 0           (10000000)     

    ret
$FlagFunction endp  

main proc
	mov ax,@data	
	mov ds,ax    
                                   
    call $FlagFunction
        
@stop:     
	mov ah,4ch
	int 21h		
main endp
end main
