org &9D93
db &BB, &6d ; Header

ld hl, Message ; Adress of string
Call PrintString ; Print string to screen

ret ; Return to basic

PrintChar: ; Print char function
    push hl
    push bc
    push de
        rst &28 ; BCall
        dw &4504 ; Calls the native TI83 PutC function
    pop de
    pop bc
    pop hl
    ret

NewLine:
    push hl
    push bc
    push de
        rst &28 ; BCall
        dw &452E ; Calls the native TI83 _newline function
    pop de
    pop bc
    pop hl
    ret

PrintString:
    ld a,(hl) ; Print a '255' terminated string
    cp 255
    ret z
    inc hl
    call PrintChar
    jr PrintString

Message: db 'Hello World!', 255