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

.code 
    
main proc
	mov ax,@data	;all the addressess of data segment are copied in accumalator register 
	mov ds,ax    ;in near future we may use ax register so we have to assign all our addresses into data segment register (ds) 

	;Write your code here
  	;First let's take integer input
  	mov ah,1	;For number input
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
    
    ;Now let's String input 
    
    ;mov dx,offset var_str 
    ;mov ah,3fh
    ;int 21h 
    
    ;lea dx,n_line
    ;mov ah,9
    ;int 21h 
    
    ;mov dx,offset var_str
    ;mov ah,9h
    ;int 21h
     
	mov ah,4ch
	int 21h		;terminate with return code
main endp 
end main

