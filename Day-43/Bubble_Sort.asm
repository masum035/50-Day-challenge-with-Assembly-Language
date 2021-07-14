;id-201914044 (assignment problem no-1)
.model small	
.stack 100h		
include 'emu8086.inc'

.data

list db ?
n_line db 0ah,0dh,"$"  
str db "Number of elements : $"  
str1 db 10,13,"insert array:",10,13,"$" 
str2 db 10,13,"sorted array:",10,13,"$"
i dw ?
j dw ?

.code

main proc
	mov ax,@data	
	mov ds,ax  
	
	lea dx,str
	mov ah,9
	int 21h 
	
	mov ah,1
	int 21h  
	sub al,30h
	mov bh,0
	mov bl,al  ;means bx contains number of elements
    
    lea dx,str1
    mov ah,9
    int 21h   
                                   
    
    mov si,offset list
    mov cx,bx
    @input:
        mov ah,1
        int 21h   
        ;sub al,30h
        mov [si],al  
        inc si  
        ;blank space
        mov ah,2
        mov dl,32
        int 21h
        loop @input          
    
    lea dx,str2
    mov ah,9
    int 21h  
    
    call $bubble
    
    ;mov si,offset list  
    mov si,0
    mov cx,bx
    @output:
        mov ah,2
        mov dl,list[si] 
        int 21h
        add si,1
           
        ;blank space
        mov ah,2
        mov dl,32
        int 21h
        loop @output
  
@stop:     
	mov ah,4ch ;terminate
	int 21h		
main endp         

$bubble proc    
    xor dx,dx
    xor cx,cx
    xor ax,ax
    
    mov cx,bx
    dec cx
    mov i,0  
    @outerLoop:
        cmp i,bx
        jge @outerLoopEnd
            mov si,0    
            @innerLoop: 
                cmp si,cx
                jge @innerloopEnd 
                
                mov al,list[si]
                mov dl,list[si+1]
                  
                cmp al,dl
                jl @skip
                mov list[si],dl
                mov list[si+1],al               
                @skip:
                    add si,1                                 
            jmp @innerLoop
            @innerloopEnd:     
        inc i   
        jmp @outerLoop
    @outerLoopEnd:
    ret
$bubble endp    
end main 
