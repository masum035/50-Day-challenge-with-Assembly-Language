;Day 01_________date-07 april,2021
;Problem- Take input from user then print it in console
include 'emu8086.inc' 
.model small	;Code in one segment, and data in one segment
.stack 100h		;stack size is declared

.data
;For declaring initialized data or constants in this segment
  
n_line db 0ah,0dh,"$"   ;for new line
 
;Here ? means we can modify our variable in runtime 
var_int db ?
var_char db ?
var_str dw ?
arr1 DD 100 DUP(0)    ; Declare 100 4-byte words starting at location arr1, all initialized to 0
str1 dw "Give Input String : $"
str2 dw "Given input is : $"  
str3 dw "Total charachters in given string : $"
arr db 30 dup('$')    ; Declare 30 4-byte words starting at location arr, all initialized to $(null charachter)  
var_count db ?

.code 
    
main proc
	mov ax,@data	;all the addressess of data segment are copied in accumalator register 
	mov ds,ax    ;in near future we may use ax register so we have to assign all our addresses into data segment register (ds) 

	;Write your code here
  	;First let's take integer input
  	mov ah,1	;For number/charachter input
  	int 21h
	
  	;sub al,48  
  	mov dl,al
  	mov var_int,dl  
  	
  	;mov bl,dl     ;as in next line ,i'm going to use dx register to store n_line data So Here i'm copying my dato to BX register  
  	
  	;printn       ;For new Line as Library function But i want to do it manually
  	
  	lea dx,n_line ;lea means least effective address
    mov ah,9
    int 21h       ;print new line
  	
  	mov dl,var_int    ;copying Cause dos interrupt can show data segment(DX)

  	mov ah,2	  ;For number output 
  	int 21h 
    
    printn 
    
    ;Now let's take charachter input 
    mov ah,1
    int 21h
    
    mov dl,al
    mov var_char,dl
    
    lea dx,n_line
    mov ah,9
    int 21h 
    
    mov dl,var_char
    
    mov ah,2
    int 21h
      
    printn
    ;Now let's String input 
    lea dx,str1   ; For str1 print
    mov ah,09
    int 21h
    
    printn
    
    mov ah,10     ; For string input
    lea dx,arr    ; Now pointing dx(data register) to starting address of arr 
    ;mov arr,29   ; (It's not necessary) It's just a constraint to remain in specified bound,cause here arr is 30,So input can be <= max size 
    int 21h
    
    printn
    
    lea dx,str2   ; For str2 print
    mov ah,09
    int 21h 
    
    lea dx,arr+2  ; (why arr+2 ?)cause arr[0] stores declared size of arr and arr[1] stores counter of total inputed charachters.So arr starts from arr[2]
    mov ah,09
    int 21h    
    
    printn
    
   ; lea dx,str3
   ; mov ah,09
   ; int 21h
    
   ; mov al,arr[1] ;
   ; mov dl,al
   ; mov ah,02
   ; int 21h
   
    
     
	mov ah,4ch
	int 21h		;terminate with return code
main endp 
end main
