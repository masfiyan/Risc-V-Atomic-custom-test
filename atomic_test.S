    .section .data
    .align 2
addr:   
    .word 0                   

    .section .text
    .globl _start
_start:
    lui     x1, 0x80000        
    addi    x1, x1, 0          

    li      x2, 42             

    lr.w    x3, (x1)           

    # SW (Store Word)
    sw      x2, 0(x1)          

    # SC (Store Conditional)
    sc.w    x3, x2, (x1)       
                               

    # Check if the store conditional was successful
    beqz    x3, success        # If x3 == 0 (success), branch to success
    j       fail               # If x3 != 0 (failure), branch to fail

success:
    li      a0, 0              
    li      a7, 93             
    ecall                       

fail:
    li      a0, 1              
    li      a7, 93             
    ecall

