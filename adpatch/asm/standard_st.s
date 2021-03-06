; arguments pop'ed from the stack
; modifies ax, cx, dx, sp
; 30 bytes

        %if __BITS__ != 16
        %error This file is intended for 16-bit code
        %endif

        stc
L1:
        mov dx, PORT
	pop ax
        out dx, al
        mov al, 13
        mov cx, 6
        jc L9           ; carry=1 only on first iteration
        dec ax
        mov cl, 35
L9:     inc dx
        inc dx
        out dx, al
        sub al, 4
        out dx, al
        add al, 4       ; odd parity only on first iteration
        out dx, al
L2:     in al, dx
        loop L2
        jpo L1
