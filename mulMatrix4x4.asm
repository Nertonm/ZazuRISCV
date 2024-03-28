.include "macros.asm"

.globl countAdjacentBombs

.eqv 	row $t0 
.eqv 	col $t1
.eqv	sum $t2
.eqv 	auxrow $t3
.eqv 	auxcol $t4
.eqv	count $v1


countAdjacentBombs:
	save_context
	move    count, $zero
	move 	$s0, $a0
	move    row, $a1  
 	move    col, $a2   
	addi 	auxrow, row, 1
  	addi 	auxcol, col, 1
  	addi 	col, col, -1
  	addi 	row, row, -1
	loop1:
	blt 	row, $zero, endloop2
	bgt 	row, auxrow, endloop1
	bgt	row, 7, endloop1
	loop2:
		blt	col, $zero, aaa
		bgt	col, 7, endloop2
		bgt 	col, auxcol, endloop2
		
        	sll 	$t5, row, 5 	
        	sll 	$t6, col, 2
        	add	$t6, $t6, $s0 	
		add 	$t6, $t6, $t5
		lw 	$t7, 0 ($t6)
		beq 	$t7, -1, countadd
       	 	aaa:
        	addi 	col, col, 1
        	j loop2
countadd:
    	addi	count, count, 1
    	addi 	col, col, 1
    	j 	loop2
endloop2:
	addi 	row, row, 1
	move 	col, $a2
	addi 	col, col, -1
	j	loop1	
endloop1:
	move    row, $a1  
 	move    col, $a2
	restore_context
    	jr	$ra	
	
