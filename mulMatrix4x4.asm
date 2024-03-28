# 4x4 matrix
.eqv 	row $t0 
.eqv 	col $t1
.eqv 	auxrow $t3
.eqv 	auxcol $t4
.eqv 	count_i, $t4
.eqv 	count_j, $t5
.eqv	count_k,  $v1

	mulmatrix:
	li count_i, 0
  	begin_for_i_it:						# for (int i = 0; i < SIZE; ++i) {
  		bge count_i, 4, end_for_i_it 
    		move $v0, $zero  				# Clear result accumulator
  		li count_j, 0 					# j = 0
  		begin_for_j_it:					# for (int j = 0; j < SIZE; ++j) {
  			bge count_j, 4, end_for_j_it 		# loop check
   			move $t2, $zero
  		   	move $t3, $zero
			    					# Loop to calculate dot product for each element in resulting matrix
    			li count_k, 0        			# k = 0 (loop counter for inner loop)
				begin_for_k_it:
    				bge count_k, 4, end_for_k_it
			   	sll   	row, count_i, 5    	# $t0 = i * 4 (offset for row i in matrix A)
			    	sll   	col, count_j , 2    	# $t1 = j * 1 (offset for col j in matrix B)
			   	add   	$a0, row, col       	# $a0 = address of element (i, j) in result matrix (C)
			    	sll   	$t4, count_k, 5     	# $t4 = k * 4 (offset for element k in row i of matrix A)
			    	add   	$t5, row, $t4        	# $t5 = address of element (i, k) in matrix A
			    	sll   	$t6, count_k , 2     	# $t6 = k * 1 (offset for element k in col j of matrix B)
			   	add   	$t7, $s1, $t6        	# $t7 = address of element (k, j) in matrix B
			    	lw   	$t8, 0($t5)           	# Load element (i, k) from matrix A
			    	lw   	$t9, 0($t7)           	# Load element (k, j) from matrix B
  				sll 	$t0, count_i,  5 	
  				sll 	$t1, count_j , 2 		
  				add 	$a0, row, col
  				add 	$a0, $a0, $s0
  				lw 	$t1, 0($t0)		
 				mul   	$t9, $t8, $t9         	# Multiply elements
    				add   	$t2, $t2, $t9        	# Accumulate product
				addi 	count_k, count_k, 1     	# k++
  				addi 	count_j ,count_j ,1        # count_j++
  					end_for_k_it:
    					sw   $t2, 0($a0)        # Store result (i, j) in matrix C
    					addi count_j ,count_j ,1     # count_j++
  					j begin_for_j_it  	
end_for_j_it:
  		addi count_i, count_i, 1
  		j begin_for_i_it
  	count:
  		move 	$v0, $zero
  	end_for_i_it:	# Complete all loops
  		jr $ra 
