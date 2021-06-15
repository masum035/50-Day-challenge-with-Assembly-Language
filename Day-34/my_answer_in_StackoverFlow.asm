; Day-34        Date-30/05/21
; stackoverflow anser link: https://stackoverflow.com/a/67784267/13939591

.model small               ; declaring this code will be consists of one data segment and one code segment
.stack 100h                ; stack is initializeed to offset address at 100h

.data                      ; Data segment

n_line db 0ah,0dh,"$"      ; for new line
msg1 db 10,13,"Balanced$" 
msg2 db 10,13,"Not Balanced$"

a1 dw 5bh ; '['
a2 dw 5dh ; ']'
b1 dw 7bh ; '{'
b2 dw 7dh ; '}'
c1 dw 28h ; '('
c2 dw 29h ; ')' 

flag db 0
i db ?  

.code                      ; Code segment

main proc
    mov ax,@data           ; copying starting address of data segment into ax register
    mov ds,ax              ; by copying ax into ds we are initializing data segment 
        
    mov cx,8               ; length is 8 fixed here    
    mov i,0d               ; https://stackoverflow.com/questions/45904075/displaying-numbers-with-dos
    xor ax,ax              ; clearing ax     
    xor bx,bx              ; clearing bx
    xor dx,dx              ; clearing dx
@input: 
    cmp i,8d
    jge @input_end
                                                  
        mov ah,1           ; taking input
        int 21h
        
        mov ah,0           ; clearing previously stored 1 in ah
        mov bp,sp          ; checking stack is empty or not using bp. it can be done sp in this code
        
        @if1:              ; in this @if1 level: checking if current input is opening bracket or not
           cmp ax,a1
           je @push_it
           cmp ax,b1
           je @push_it
           cmp ax,c1
           je @push_it
           
           jmp @if2
        @push_it:          ; if  current input is opening bracket then push it
            push ax 
            mov flag,1     ; and alter the default flag value
        
        @if2:
             cmp bp,100h   ; checking if stack is empty or not
             je @if2_end   ; if not empty then  
             
             @inner_if1:   ; in this @inner_if1 level, checking if top of the stack is co-responding closing bracket of '{' or not
                cmp ax,b2  ; top==}
                je @inner_if1_perform
                jne @inner_if2
                @inner_if1_perform:  
                    pop bx       ; top is popped and storing it to bx
                    cmp bx,b1
                    jne @inner_push1
                    je @inner_if2
                    
                    @inner_push1:
                        push bx   ; if not matched, then that popped value should be pushed
                  
              @inner_if2:   ; in this @inner_if2 level, checking if top of the stack is co-responding closing bracket of '[' or not
                 cmp ax,a2  ; top==]
                 je @inner_if2_perform
                 jne @inner_if3
                 @inner_if2_perform:
                    pop bx       ; top is popped and storing it to bx
                    cmp bx,a1
                    jne @inner_push2
                    je @inner_if3
                    
                    @inner_push2:
                        push bx   ; if not matched, then that popped value should be pushed
                 
              @inner_if3:   ; in this @inner_if3 level, checking if top of the stack is co-responding closing bracket of '(' or not
                 cmp ax,c2  ; top== )
                 je @inner_if3_perform
                 jne @inner_if3_end
                 @inner_if3_perform:
                    pop bx        ; top is popped and storing it to bx
                    cmp bx,c1
                    jne @inner_push3
                    je @inner_if3_end
                    
                    @inner_push3:
                        push bx    ; if not matched, then that popped value should be pushed
                        
               @inner_if3_end:                        
        @if2_end:
    inc i
    jmp @input   
    
@input_end:                ; if ( (flag == 1) && (stack.empty()) )
    cmp flag,1
    je @next_level:
    jne @print_msg2
    
    @next_level:          
    cmp sp,100h            ; cheking the stack pointer is returned to initial address or not means empty or not
    je @print_msg1
    jne @print_msg2                            

    @print_msg1:
        lea dx,msg1  
        mov ah,9
        int 21h 
@stop:     
    mov ah,4ch             ; terminate the code
    int 21h     
main endp                  ; ending of main procedure

@print_msg2:
    lea dx,msg2  
    mov ah,9
    int 21h  
    
    jmp @stop  
end main                   ; ending of code segment

;    Input:    
;    [[]({})] ------ Balanced
;    {({}[])} ------ Balanced
;    []({)}[] ------ Not Balanced
;    }()[(]){ ------ Not Balanced 
