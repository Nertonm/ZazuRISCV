# Zazu MIPS-like

## Ordem de Leitura
 - RT entry 1
 - RS entry 2
 - RD dest 
 - opcode

   V0 = Reg$3
   Escreve Um - Lê Dois
 
   Ordem    
   OP RD RT RS

   Manipulação de Endereço sempre por RD

## OPCODES
  - 0000 : sll
  - 0001 : slr
  - 0010 : MUL
  - 0011 : ADD
  - 0100 : SUB
  - 0101 : AND
  - 0110 : OR
  - 0111 : XOR
  - 1000 : LES
  - 1001 : Li Turbo
  - 1010 : JMP
  - 1011 : MOVE 
  - 1100 : MulMatrix4x4
  - 1101 : LI
  - 1110 : SW
  - 1111 : LW

## MulMatrix4x4 no ZazuIPS:
### Inserção Lenta
Elemento por elemento, multiplicação por multiplicação, utiliza muitas instruções e tempo.

### Modo Turbo
Inves de Alocar por partes a memória e gastar diversos ciclos do processador com alocação e carregamento. Zazu utiliza o Li turbo para carregar nos registradores a matrix de maneira rapida. Depois utiliza a instrução de multiplicar matrix,  o opcode de MulMul4x4, que faz o processador interpretar a matriz porlotes e executar a multiplicação de forma acelerada.

