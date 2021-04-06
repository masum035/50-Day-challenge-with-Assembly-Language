;Day 00_________date-06 april,2021
;Standard Template of any assembly language

.model small	;Code in one segment, and data in one segment
.stack 100h		;stack size is declared

.data
;For our variable declaration segment and all other data segment

.code
;For code segment
main proc
	mov ax,@data	;all the addressess of data segment are copied in accumalator register 
	mov ds,ax     ;in near future we mauy use ax register so we have to assign all our address into data segment register (dx) 

	;Write your code here

main endp
end main

