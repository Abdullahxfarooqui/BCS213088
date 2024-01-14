[org 0x0100]
jmp start
array1: db 1, 2, 3, 4, 5, 6, 7, 3, 2, 10
results: dw 0

find_max:
   mov cx, 10
   lea si, [array1]      
   movzx bx, byte [si]  
skip_update:
   dec cx                
   jz done
   shl si, 1
   cmp bx, [si]          
   jge skip_update      
   mov bx, [si]
   jmp skip_update      

done:
   ret

start:
   call find_max        
   mov [results], bx

   ; Display the result
   mov ax, [results]     
   call DisplayNumber    
   mov ax, 0x4c00        
   int 0x21

DisplayNumber:
mov ah, 2
   int 0x21
   ret
