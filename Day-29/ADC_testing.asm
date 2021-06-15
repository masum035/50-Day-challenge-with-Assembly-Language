;Day-29      Date: 21 May,2021   

;ADC instruction  
;ADC reg,reg
;ADC mem,reg
;ADC reg,mem
;ADC mem,imm
;ADC reg,mem
.model small	
.stack 100h		
include 'emu8086.inc'

.data

n_line db 0ah,0dh,"$"    

.code

main proc
	mov ax,@data	
	mov ds,ax    
    
    mov dl,0
    mov al,0ffh   ;al=11111111B
    add al,0ffh   ;al=11111111B + 11111111B
    adc dl,0
    
    lea dx,n_line  
    mov ah,9
    int 21h
         
@stop:     
	mov ah,4ch
	int 21h		
main endp
end main
