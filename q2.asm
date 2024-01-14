[org 0x0100]

jmp start

array: dw 2,6,8,1,3,10,55,66,41,20
result: dw 0

find_max:
	mov cx,10
	mov dx,[bx]
	
compare:
	cmp dx,[bx+2]
	jle change_num
	jmp no_change
	
change_num:
	mov dx,[bx+2]
	
no_change:
	add bx,2
	sub cx,1
	cmp cx,1
	jne compare
	ret
	
start:
	mov bx,array
	call find_max
	mov [result],dx
	
	mov ax,0x4c00
	int 0x21
