; Day-31     Date - 24/05/2021     
; my answer of stackoverflow question link: https://stackoverflow.com/a/67672362/13939591
  
; Here at first, @ indicating start of label and $ indicating start of procedure. if multiple label and procedure is present in assembly code.
; Then distinguishing label & procedure can be done easily. It's just my own way of coding. You can ignore this style

;Algorthm for Decimal Input

;   number = 0
;   while input != "\n" do
;         number = number * 10
;         input a charchter
;         number = number + input
;         count++

;Algorthm for Decimal Output
;   for i = 1 to count do 
;       reminder = number % 10
;       push reminder
;
;   for i = 1 to count do
;       pop reminder
;       print reminder


.model small	; declaring this code will be consists of one data segment and one code segment
.stack 100h		; stack is initializeed to offset address at 100h

.data           ; this is data segment

n_line db 0ah,0dh,"$"  ;here declared a string named n_line which is define byte(8 bit), which value is null('$')
                       ;and 0ah is for line feed (moves to next output line) & 0dh is for carriage return

n dw ?              ; n is defne word(16 bit) variable which value is not initialized yet
i db ?              ; i is define byte(8 bit) variable which value is not initialized yet
count db ?          ; i is define byte(8 bit) variable which value is not initialized yet
reminder db ? ;reminder is define byte(8 bit) variable which value is not initialized yet
flag db 0       ;flag   is define byte(8 bit) variable which value is initialized as 0
num dw ?         ; num  is defne word(16 bit) variable which value is not initialized yet

.code    

$set_number proc     
    @while: 
        mov ah,1     ; taking input here
        int 21h  
        mov cl,al
        sub cl,30h  
            
        cmp al,13  ;checking if input is new line or not
        
        je @break_while
            mov ax,n   ; al = n
            mul bl     ; al = n * 10
            mov n,ax   ;  n = n * 10     
            
            mov ch,0   ;as n variable is dw so...
            add n,cx  ; n = n + al = (n * 10) + al
                        
        inc count     ; count = count + 1
        jmp @while 
    @break_while:         
    ret            ; here instruction pointer will jump to the next line of calling this procedure
$set_number endp   ; end of procedure


$get_number proc
    @for_loop_1_init:
        mov i,1d       
    @for_loop_1:
        mov dl,count     ; before executing loop,every time i'm storing count variable to al register
        cmp i,dl         ; it means here, cmp i,count 
        jg @for_loop_1_end  
            mov ah,0     ; here chances may be ah store some value,so clearing ah register
            cmp flag,0   ; think like boolean value
            jne @try     ; suppose, n = 135d .So each time,i'm ensuring quotient is divded & excluding reminder from ah register  
            mov ax,n  
            mov flag,1 
            div bl       ; al = ax/bl  and ah = reminder 
            jmp @final
            @try:
                mov ah,0
                div bl
            @final:    
            xor cx,cx    ; clearing cx register
            mov cl,ah
            
            push cx   ;push reminder

        inc i
        jmp @for_loop_1 
    @for_loop_1_end:
    
    ; uncomment these, if you want to print in row wise 
    ;    lea dx,n_line
    ;    mov ah,9
    ;    int 21h
                    
    @for_loop_2_init:
        mov i,1d       
    @for_loop_2:
        mov al,count     ;before executing loop,every time i'm storing count variable to al register
        cmp i,al         ;it means here, cmp i,count 
        jg @for_loop_2_end  
            
            pop dx    ;stack's top value is stored in dx now
             
            add dx,30h  ; 30h is equivalent to 48d, means ascii charchter 0
            mov ah,2
            int 21h
    
        inc i
        jmp @for_loop_2 
    @for_loop_2_end:        
                           
    ret     ; here instruction pointer will jump to the next line of calling this procedure
$get_number endp   ; end of procedure

main proc
	mov ax,@data	
	mov ds,ax    
    
    mov bl,10d  ; bl = 10d
@input:
    xor cx,cx   ; clearing cx register

    call $set_number
@print:
    cmp n,0
    je @stop
        
    xor ax,ax   ; clearing ax register
    xor cx,cx   ; clearing cx register
    xor dx,dx   ; clearing dx register
    
    call $get_number  
    
    mov dl,32d   ; 32d is for space in ascii
    mov ah,2
    int 21h 
    
    ;These register can be affected so for futher looping,clearing all 
    
    xor ax,ax   ; clearing ax register
    xor cx,cx   ; clearing cx register
    xor dx,dx   ; clearing dx register
    mov count,0
    mov flag,0
    
    dec n       ; This Question was to print number in decreasing order
    mov ax,n
    @repeat:    ;in this label,i am counting length of n
        mov ah,0
        div bl
        
        inc count    
    cmp al,0
    jnle @repeat
    
    jmp @print
              
  
@stop:     
	mov ah,4ch ; terminate the programme
	int 21h		
main endp      ; ending of main procedure
end main       ; ending of code segment
