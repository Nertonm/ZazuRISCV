.data
  msg_newline: 	.asciiz "\n"
  msg_space:	.asciiz " "

.globl main
.text

main:
  addi $sp, $sp, -64
  move $s0, $sp
  
  addi $sp, $sp, -64
  move $s1, $sp

  addi $sp, $sp, -64
  move $s2, $sp
  
  li $s3, 0
  begin_for_i:
    beq $s3, 4, end_i
    
    li $s4, 0
    begin_for_j:
      beq $s4, 4, end_j
      
      sll $t0, $s3, 5
      sll $t1, $s4, 2
      add $t0, $t0, $t1
      add $t0, $t0, $s0
      
      add $t2, $s3, $s4
      sw $t2, 0 ($t0)
      
      addi $s4, $s4, 1
      j begin_for_j
    end_j:
      addi $s3, $s3, 1
      j begin_for_i
  end_i:
  
  li $s3, 0
  begin_for_i2:
    beq $s3, 4, end_i2
    
    li $s4, 0
    begin_for_j2:
      beq $s4, 4, end_j2
      
      sll $t0, $s3, 5
      sll $t1, $s4, 2
      add $t0, $t0, $t1
      add $t0, $t0, $s2
      
      add $t2, $s3, $s4
      addi $t2, $t2, 3
      
      sw $t2, 0 ($t0)
      
      addi $s4, $s4, 1
      j begin_for_j2
    end_j2:
      addi $s3, $s3, 1
      j begin_for_i2
  end_i2:
  
  li $s3, 0 # i = 0
  begin_for_i_iteration:
    beq $s3, 4, end_for_i_iteration
    
    li $s4, 0 # j = 0
    begin_for_j_iteration:
      beq $s4, 4, end_for_j_iteration 
      
      sll $t0, $s3, 5
      sll $t1, $s4, 2
      add $t0, $t0, $t1
      add $t0, $t0, $s0
      lw $t2, 0 ($t0)
      
      li $v0, 1
      move $a0, $t2
      syscall
      
      li $v0, 4
      la $a0, msg_space
      syscall
   
      addi $s4, $s4, 1
      j begin_for_j_iteration
    end_for_j_iteration:
      li $v0, 4
      la $a0, msg_newline
      syscall
      
      addi $s3, $s3, 1
      j begin_for_i_iteration
  end_for_i_iteration:
  
  li $v0, 4
  la $a0, msg_newline
  syscall
  
  li $s3, 0 # i = 0
  begin_for_i_iteration2:
    beq $s3, 4, end_for_i_iteration2
    
    li $s4, 0 # j = 0
    begin_for_j_iteration2:
      beq $s4, 4, end_for_j_iteration2
      
      sll $t0, $s3, 5
      sll $t1, $s4, 2
      add $t0, $t0, $t1
      add $t0, $t0, $s1
      
      lw $t2, -64 ($t0)
      
      li $v0, 1
      move $a0, $t2
      syscall
      
      li $v0, 4
      la $a0, msg_space
      syscall
      
      addi $s4, $s4, 1
      j begin_for_j_iteration2
    end_for_j_iteration2:
      li $v0, 4
      la $a0, msg_newline
      syscall
      
      addi $s3, $s3, 1
      j begin_for_i_iteration2
  end_for_i_iteration2:
  
  
  li $v0, 4
  la $a0, msg_newline
  syscall
  
  li $s3, 0
  begin_mult_i:
    beq $s3, 4, end_mult_i
    
    li $s4, 0
    begin_mult_j:
      beq $s4, 4, end_mult_j
      
      li $t5, 0
      li $s5, 0
      begin_mult_k:
        beq $s5, 4, end_mult_k
        
        sll $t0, $s3, 5
        sll $t1, $s5, 2
        add $t0, $t0, $t1
        add $t0, $t0, $s0
        
        lw $t2, 0 ($t0)
        
        sll $t0, $s5, 5
        sll $t1, $s4, 2
        add $t0, $t0, $t1
        add $t0, $t0, $s1
        
        lw $t3, -64 ($t0)
        
        mul $t3, $t3, $t2
        add $t5, $t5, $t3
        
        addi $s5, $s5, 1
        j begin_mult_k
      end_mult_k:
        
        sll $t6, $s3, 5
        sll $t7, $s4, 2
        add $t6, $t6, $t7
        add $t6, $t6, $s2
        
        sw $t5, -128 ($t6)
      
        addi $s4, $s4, 1
        j begin_mult_j
    end_mult_j:
      addi $s3, $s3, 1
      j begin_mult_i
  end_mult_i:
  
  li $s3, 0 # i = 0
  begin_for_i_iteration3:
    beq $s3, 4, end_for_i_iteration3
    
    li $s4, 0 # j = 0
    begin_for_j_iteration3:
      beq $s4, 4, end_for_j_iteration3
      
      sll $t0, $s3, 5
      sll $t1, $s4, 2
      add $t0, $t0, $t1
      add $t0, $t0, $s2
      
      lw $t2, -128 ($t0)
      
      li $v0, 1
      move $a0, $t2
      syscall
      
      li $v0, 4
      la $a0, msg_space
      syscall
      
      addi $s4, $s4, 1
      j begin_for_j_iteration3
    end_for_j_iteration3:
      li $v0, 4
      la $a0, msg_newline
      syscall
      
      addi $s3, $s3, 1
      j begin_for_i_iteration3
  end_for_i_iteration3: