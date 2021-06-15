;day -30    Date- 23/05/2021
;problem- Tried to implement example 7 in https://www.programiz.com/c-programming/examples/pyramid-pattern but got a bug & couldn't fix it. you are welcome to fix this 

.model small	
.stack 10h		
include 'emu8086.inc'

.data

n_line db 0ah,0dh,"$"  
  
i db ?              
space db ?
rows db ?
k  db 0
count  db 0
count1  db 0
temp db ?
comp1 db ? 
temp2 db ?
temp3 db ?
x db 2d
       
.code

main proc
	mov ax,@data	
	mov ds,ax    
    
    mov bl,2d
    print "Enter the number of rows: "
    
    mov ah,1
    int 21h 
    sub al,30h 
    
    printn
    
    mov rows,al
    mov dl,rows 

@outer_for_init:
      mov i,1d
@outer_for:
     cmp i,dl
     jnle @outer_for_end       
        @inner_for1_init:
            mov space,1d
            mov bl,dl ; bl=rows
            sub bl,i  ;bl = rows - i            
        @inner_for1:
            cmp space,bl
            jg @while_init
                print "#"
                inc count            
            inc space
            jmp @inner_for1
         @while_init:  
              mov ah,0  
              mov al,i ;al = i
              mul x   ;al = 2*i
              dec al   ;al = 2*i - 1
              
              mov temp,al
          @while:
              mov ch,0  
              mov cl,temp
              cmp k,cl
              je @while_end 
                 mov ah,0
                 mov al,rows ;al=dl=rows   
                 dec al
                 @if:
                    mov comp1,al 
                    mov bh,comp1
                    cmp count,bh
                    jnle @else     
                        mov bl,i
                        mov temp2,bl ;temp2 = i 
                        
                        mov bl,k
                        add temp2,bl ;temp2 = i + k
                        
                        mov bl,2d
                           
                        mov dl,temp2    
                        add dl,30h
                        mov ah,2
                        int 21h 
                        
                        mov dl,32
                        mov ah,2
                        int 21h  
                        
                        inc count
                   @else: 
                   ;here k value is becoming negative but why??
                        inc count1
                        mov ah,0  
                        mov al,count1 ; al = count1
                        imul bl       ; al = 2 * count1
                        sub k,al      ;  k = k - 2* count1 
                        mov al,k      ; al = k - 2* count1 
                        add i,al      ; i = i + k - 2* count1 
                        
                        mov dl,i
                        mov ah,2
                        int 21h 
                        
                        mov dl,32
                        mov ah,2
                        int 21h 
                        
                    @extra:
                        mov al,comp1
                        mov dl,rows  
     
              inc k 
              jmp @while
           @while_end: 
      mov count1,0d
      mov count,0d
      mov k,0d
      
      lea dx,n_line  
      mov ah,9
      int 21h   
                        
      inc i
      jmp @outer_for
@outer_for_end:  
@stop:     
	mov ah,4ch ;terminate
	int 21h		
main endp 
;push i  ;i=db

end main
