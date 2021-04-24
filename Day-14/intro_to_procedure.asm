;Day 14           Date-24 april,2021
;Standard Template of any assembly language
include 'emu8086.inc'
.model small	;Code in one segment, and data in one segment
.stack 100h		;stack size is declared

.data
;For declaring initialized data or constants in this segment

.code

main proc
	mov ax,@data	;all the addressess of data segment are copied in accumalator register 
	mov ds,ax    ;in near future we may use ax register so we have to assign all our addresses into data segment register (ds) 

	;Some Library function
	putc 'any_charachter to show in console'
	print "Your String here to show in console"
	printn      ;For new Line
	;Write code here
	

	mov ah,4ch
	int 21h		;terminate with return code
main endp
end main
