;my stackoverflow answer_link : https://stackoverflow.com/a/67801034/13939591
;Day 35     date-02 June,2021
;problem - convert lower case letter to upper case letter or upper case letter to lower case letter 
;        - without using subtraction , addition (using just bit manipulation)


; Here at first, @ indicating start of label and $ indicating start of procedure.
; If multiple label and procedure is present in assembly code. 
; Then distinguishing label & procedure can be done easily. 
; It's just my own way of coding. You may ignore this style.  

.model small           ; declaring this code will be consists of one data segment and one code segment
.stack 100h            ; stack is initializeed to offset address at 100h	

.data                  ; starting of Data segment

n_line           db    0ah,0dh,"$"                        ; for new line 
input_msg        db    "Input",20h,": $"                  ; 20h = 32d = ascii 'space'
output_msg       db    0ah,0dh,"Output: $"
stop_msg         db    "Press 'esc' to Stop this Programme.",0ah,0dh,"$"   
end_msg          db    0ah,0dh,"Proramme Terminated. $"
warning_msg      db    0ah,0dh,"Input is not a letter. Try agian.",0ah,0dh,"$"

.code                  ; starting of Code segment

main proc
    mov ax,@data       ; copying starting address of data segment into ax register
    mov ds,ax          ; by copying ax into ds we are initializing data segment 
       
    lea dx,stop_msg
    mov ah,9
    int 21h 
@input:	
    mov cx,0
       
    lea dx,input_msg
    mov ah,9
    int 21h 

    mov ah,1           ; taking single input charachter
    int 21h	       
    
    cmp al,27d         ; cheking if it input is 'esc' or not
    je @terminate   
    
    call $check_constraints    ; procedure 
       
    cmp cx,1           ; cheking flag value
    je @input
    
    xor bx,bx          ; XOR with self will always retun of all zero bit (means clearing a register)
    mov bl,al
    xor bl,32d         ; Here is the trick     
	                   ; visit - https://catonmat.net/ascii-case-conversion-trick
@output:	        
	lea dx,output_msg
    mov ah,9
    int 21h 
	 
	mov dl,bl          ; output char was stored in bl
	mov ah,2
	int 21h
	        
    lea dx,n_line      ; new line for next input
    mov ah,9
    int 21h 
    
    jmp @input
    
@terminate: 
    lea dx,end_msg  
    mov ah,9
    int 21h
      
	mov ah,4ch         ; terminate program 
	int 21h		       
main endp              ; ending of main procedure  

$check_constraints proc   
  ; if( (input<= 122d && input <= 97d) || (input<=90d && input <= 65d)) Then Proceed; otherwise Warning;
    @first_if:
        cmp al,122d    ; or cmp al,'z'     
        jg @warning  
        
        cmp al,97d     ; or cmp al,'a'
        jge @setFlag
          
    @second_if:
        cmp al,90d     ; or cmp al,'Z'
        jg @warning
        
        cmp al,65d     ; or cmp al,'A'
        jl @warning
        
    @setFlag:
        mov cx,0       ; i'm considering cx register as a flag       
        jmp @end_function 
         
    @warning:  
        mov cx,1       ; i'm considering cx register as a flag 
        
        lea dx,warning_msg 
        mov ah,9
        int 21h  
        
    @end_function:    
    ret
$check_constraints endp

end main               ; ending of code segment
