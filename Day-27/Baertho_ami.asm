; Day-27      Date-18 May,2021
; problem - print Hollow pyramid using star consists upper and lower but there will be one base line 
.model small	
.stack 100h		
include 'emu8086.inc'

.data

n_line db 0ah,0dh,"$"    
n db ?
i db ?
k db ?
space db ?
p db 2  
flag db 0

.code

main proc
	mov ax,@data	
	mov ds,ax    
@input:    
    mov ah,1
    int 21h  
    sub al,30h
    mov bl,al   ;bl=n
    
@firstO_init:
     lea dx,n_line
     mov ah,9
     int 21h
      
     mov i,1
@firstO:
    cmp i,bl
    jg @secondO_init
    
    
    @firstIn1_init:
        mov space,1  
        mov al,bl
        sub al,i    
        mov cl,al   ;row-i 
    @firstIn1:
        cmp space,cl        
        jg @firstIn2_init
            
            print "@"
             
        inc space 
        jmp @firstIn1  ;upto this corrrect
     @firstIn2_init:  
        mov dx,0    ;clearing dx
        mov al,0    ;clearing al
        mov al,i    ;al=i
        mul p       ;al=2*i
        dec al
        mov dl,al   ;dl=2*i - 1     
        
        mov k,1  
     @firstIn2:
        cmp k,dl
        je @firstIn2_end  
            cmp i,bl
            je @if_block1
            mov flag,1
            cmp k,1  
            je @if_block1
            mov flag,1
            cmp k,cl
            je @if_block1
            mov flag,1  
            
            cmp flag,1
            je @else_block
            @if_block1:
                print "0"  
                jmp @end_if_block1
            @else_block:
                print "#"
                ;jmp deyar dorkar nai 
            @end_if_block1:    
        inc k
        jmp @firstIn2 
     @firstIn2_end:  
     
         printn  
             
     inc i
     jmp @firstO
@secondO_init:         
@stop:     
	mov ah,4ch
	int 21h		
main endp

end main
