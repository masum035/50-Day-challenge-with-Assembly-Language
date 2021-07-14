; id-201914044 (assignment problem-02)
; test performs bitwise 'and' operation but it doesn't store the resultant value
.model small	
.stack 100h		
include 'emu8086.inc'

.data

n_line db 0ah,0dh,"$"    
n dw ?  
count db ?

.code

main proc
	mov ax,@data	
	mov ds,ax    
;------------------problem A ------------------------------------;
@problemA:
    mov ax,0 ;here kindly give some another value and test it
    test ax,ax 
    jz @printYesZero
    print "ax doesn't contains zero, so zero flag was not set" 
    jmp @problemB
    @printYesZero:
    print "ax contains zero, so zero flag was set"
    
;------------------problem B ------------------------------------;   
@problemB:
    lea dx,n_line  
    mov ah,9
    int 21h
                                      
    mov bx,13 ;here kindly give some another value and test it
    test bx,1
    jz @even
    print "bx contains odd number,zero flag was cleared" 
    jmp @problemC
    @even:
    print "bx contains even number,zero flag was not cleared"

;------------------problem C ------------------------------------;   
@problemC:        
    lea dx,n_line  
    mov ah,9
    int 21h 
    
    mov dx,3 ;here kindly give some another value and test it
    test dx,dx
    jns @printPositive
    print "dx contains negative number,sign flag was set"
    jmp @problemD
    @printPositive: 
@problemD:
;------------------problem D ------------------------------------;                                                   
    test dx,0
    print "zero flag was set,as dx contains zero or positve number"    
;------------------problem E ------------------------------------;                                                       
@problemE: 
    lea dx,n_line  
    mov ah,9
    int 21h 
    
    mov bl,9  ;here kindly give some another value and test it
    test bl,11111111b  
    jp @printPaity  
    jnp @printNotPaity
@printPaity:
    print "parity flag was set"
    jmp @stop  
@printNotPaity:
     print "parity flag was not set"     
@stop:     
	mov ah,4ch ;terminate
	int 21h		
main endp
end main
