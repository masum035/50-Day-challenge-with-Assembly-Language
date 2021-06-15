; Day-23            Date-14 May,2021
.model small	
.stack 100h		
include 'emu8086.inc'

.data

n_line db 0ah,0dh,"$"  
quotient db 0ah,0dh,"Quotient:$"  
reminder db 0ah,0dh,"Reminder:$"    
var1 db 6  

.code     

$copySmallerToLarger proc
    ;copying smaller value to larger value (Like 8 bit value to 16 bit value)
    ;mov ax,var1         ;This wouldn't work  
    ;So,apply this method
    xor ax,ax       ;AH=0  & AL=0
    mov al,var1     ;Now Al has value & AH=0 Technically, AX=AL
    
    mov dx,ax
    add dx,30h      ;adding 48
    mov ah,2
    int 21h
    
    ret
$copySmallerToLarger endp  

$divFunctionOf8Bit proc
    xor ax,ax
    xor bx,bx
    
    mov ax,80h        ;128d
    mov bl,3
    div bl

     
   ; lea dx,quotient
   ; mov ah,9
   ; int 21h 
   
   ; lea dx,reminder
   ; mov ah,9
   ; int 21h       
    ret
$divFunctionOf8Bit endp          

$divFunctionOf16Bit proc
    xor dx,dx
    xor bx,bx
    xor ax,ax
    
    mov dx,0h        
    mov ax,080h       ;128d
    mov bx,5
    div bx

     
   ; lea dx,quotient
   ; mov ah,9
   ; int 21h
   
   ; lea dx,reminder
   ; mov ah,9
   ; int 21h    
    ret
$divFunctionOf16Bit endp 
main proc
	mov ax,@data	
	mov ds,ax     
	
    mov al,-5h
    mov bl,7h
   
   imul bl    ;result : -35H
    
    mov ax,50
    mov bl,8
    div bl  ;
   ;Result will be stored in AX register
   ;Reminder is stored in AH and Result is stored in AL   
                ;Or it can be put another way
   ;Dividend          Divisor        Quotient        Reminder
   ;   AX            reg/mem8           AL              AH 
   ; DX:AX           reg/mem16          AX              DX
    
    call $copySmallerToLarger
    call $divFunctionOf8Bit
    call $divFunctionOf16Bit      
@stop:     
	mov ah,4ch
	int 21h		
main endp
end main
