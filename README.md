# MIPS-like

## Ordem de Leitura
 - 17-13 RT entry 1
 - 18-22 RS entry 2
 - 23-27 RD dest 
 - 28-31 opcode
   V0 = Reg$3
   Escreve Um 
   Le Dois
   OP RD RT RS
   Manipulação de Endereço sempre por RS
   Para Pular os Bits Desperdiçados 1aa

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
  - 1001 : TurboLi
  - 1010 : JMP
  - 1011 : B
  - 1100 : MulMatrix4x4
  - 1101 : LI
  - 1110 : SW
  - 1111 : LW

    A0 = REG5
## Como o MulMatrix4x4 funciona:
### Inserção Lenta
Elemento por elemento, multiplicação por multiplicação, muito demorado.

### Inserção das Matrizes metodo expresso
O processador interpreta ambas as matrizes como cortes de registradores, sendo necessário alocar no registradores os indices da memoria os valores e de forma que esteja Indice[ij] da primeira e depois, Indice[ij] da Segunda. Alem de que o limite de inserção e de 10 bits. Portanto uma multiplicação de indices por vez.

A matriz e divida por indice para um espaço de 4 bits, depois de calculado ambas as metades o resultado estará em sequencia, e dividido na memoria em partes. E importante notar que dado a restrição do tamanho da instrução sera necessario realizar o processo de multiplicação para cada indice portanto 16 vezes.

### Modo Turbo
Inves de Alocar por partes na memória e gastar diversos ciclos do processador com alocação e carregamento, quando o processador recebe o opcode de MulMul4x4Turbo ele interpreta a matriz por lotes e executa a multiplicação de matriz em apenas duas instancias.

