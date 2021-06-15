;my stackoverflow comment
;day-33    date-26/05/2021
.model small	
.stack 100h		

.data

    msg1 db "Queitent",32,":",32,"$"
    msg2 db "Reminder",32,":",32,"$"  
    n_line db 0ah,0dh,"$"    

.code

main proc
	mov ax,@data	
	mov ds,ax    
        mov ax,37
        mov bl,10   
        div bl
        
        mov cl,al
        mov ch,ah 
        
        lea dx,msg1 
        mov ah,9
        int 21h          
        
        mov dl,cl
        add dl,30h
        mov ah,2
        int 21h

        lea dx,n_line  
        mov ah,9
        int 21h  
                   
        lea dx,msg2 
        mov ah,9
        int 21h   
        
        mov dl,ch 
        add dl,30h
        mov ah,2
        int 21h                            
      
stop:     
	mov ah,4ch 
	int 21h		
main endp
end main
