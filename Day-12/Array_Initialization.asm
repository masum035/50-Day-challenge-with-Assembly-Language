;Day-12         Date-21 april,2021
;Problem - prompt user to give string input & show output using array infinite times

include 'emu8086.inc' 
.model small
.stack 100h

.data
n_line db 0ah,0dh,"$"  ;for new line
msg1 db "input : $" 
msg2 db 0ah,0dh,"Output : $"
msg3 db 0ah,0dh,"invalid $"  

arr db 20 dup('$')  ;declared 20 bit data-types varaiable named array where every bit is initialized with '$'  

.code 

main proc
    mov ax,@data
    mov ds,ax
@infinite:   
    lea dx,n_line
    mov ah,9
    int 21h
     
    lea dx,msg1
    mov ah,9
    int 21h
@string_input:
    mov ah,10     ;for string input
    lea dx,arr    ;now dx register is locating to arr
    int 21h   
@beautify:     
    lea dx,msg2
    mov ah,9
    int 21h       ;arr[0]-> stores size of array
@string_output:   ;arr[1]-> this is for counting of enterring elements
    lea dx,arr+2  ;arr[2]-> usable memory location starts from here
    mov ah,9      ;for string output
    int 21h
    
    lea dx,n_line
    mov ah,9
    int 21h        
    jmp @infinite
@stop:       
    mov ah,4ch
    int 21h
    main endp
@invalid:
    lea dx,msg3
    mov ah,9
    int 21h
    jmp @stop
end main
