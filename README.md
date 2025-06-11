
# Módulo Matriz de LEDs 7x5 — Projeto para a Disciplina de Design de Computadores

![imgs/led_matriz_conectada_v0](imgs/led_matriz_conectada_v0.jpeg)

## Visão Geral

Este projeto consiste em uma matriz de LEDs 7x5 desenvolvida com o objetivo de auxiliar nas aulas da disciplina de Design de Computadores. A matriz pode ser controlada por meio de seu barramento de 40 pinos (compatível com GPIO-Terasic), utilizando VHDL para implementar o controle dos LEDs. O sistema é capaz de exibir caracteres ou símbolos personalizados.

## Objetivos

- Desenvolver um periférico simples (matriz 7x5) para prática com sistemas digitais;
- Permitir controle como um periférico de um processador, via barramento de dados/memória;
- Exercitar a integração entre hardware físico e componentes externos aos kits padrão da Terasic;
- Auxiliar na didática dos alunos na compreensão do funcionamento e definição de mapeamento de memória na eletrônica digital;
- Representar símbolos ou letras utilizando uma interface visual.

## Materiais Utilizados

- 35 × LEDs azuis  
- Fios wire-up  
- 1 × Placa padrão dupla face  
- 1 × Flat cable de 40 vias  
- 2 × Conectores latch de 40 vias fêmea  
- 1 × Conector latch de 40 vias macho  

## Funcionamento

Cada LED está ligado a um GPIO específico do barramento padrão GPIO-Terasic. O LED superior esquerdo está conectado ao GPIO[0], e o LED inferior direito ao GPIO[34].

A placa permite que os LEDs da matriz 7x5 sejam acionados diretamente, bastando aplicar nível lógico alto (3,3V) ao respectivo pino.  
A lógica de controle deve ser implementada em VHDL, podendo receber valores codificados como caracteres ou bitmaps a serem exibidos.

## Diagrama de Conexão

- As linhas e colunas da matriz são conectadas aos pinos GPIO da placa DE0-CV por meio do flat cable.  
- A ativação dos LEDs é feita de forma coordenada entre colunas e linhas.  
- A alimentação e o controle de corrente são providos pela placa FPGA, com resistores apropriados.  

## Código-Fonte (VHDL)

```vhdl
-- Exemplo genérico
signal coluna : std_logic_vector(4 downto 0);  -- controle de colunas
signal linha  : std_logic_vector(6 downto 0);  -- controle de linhas
-- lógica para multiplexação aqui
```

## Mapeamento dos GPIOs

A matriz 7x5 utiliza 35 GPIOs sequenciais do conector GPIO da DE0-CV. A disposição física dos LEDs na matriz segue a organização abaixo (visão frontal):

```
Linha 0 (topo)     -> GPIO_1(0) GPIO_1(7)  GPIO_1(14) GPIO_1(21) GPIO_1(28)
Linha 1            -> GPIO_1(1) GPIO_1(8)  GPIO_1(15) GPIO_1(22) GPIO_1(29) 
Linha 2            -> GPIO_1(2) GPIO_1(9)  GPIO_1(16) GPIO_1(23) GPIO_1(30)
Linha 3            -> GPIO_1(3) GPIO_1(10) GPIO_1(17) GPIO_1(24) GPIO_1(31) 
Linha 4            -> GPIO_1(4) GPIO_1(11) GPIO_1(18) GPIO_1(25) GPIO_1(32)
Linha 5            -> GPIO_1(5) GPIO_1(12) GPIO_1(19) GPIO_1(26) GPIO_1(33)
Linha 6 (base)     -> GPIO_1(6) GPIO_1(13) GPIO_1(20) GPIO_1(27) GPIO_1(34) 
```

Cada LED está diretamente ligado a um pino específico, sem multiplexação. O controle é feito diretamente via sinais lógicos de 3,3V aplicados ao pino correspondente.

## Exemplo de Bitmap de Caractere

Para representar a letra **H**, por exemplo, podemos usar um vetor de 7 linhas, onde cada elemento é um vetor de 5 bits (colunas), sendo `1` para LED aceso e `0` para LED apagado:

```vhdl
type caractere_t is array (0 to 6) of std_logic_vector(4 downto 0);

constant P : caractere_t := (
  "11110",  -- linha 0 (topo)
  "10001",  -- linha 1
  "10001",  -- linha 2
  "11110",  -- linha 3
  "10000",  -- linha 4
  "10000",  -- linha 5
  "10000"   -- linha 6 (base)
);
```

Você pode construir outros caracteres com a mesma lógica e utilizar um processo em VHDL que percorra esse vetor, acionando as saídas GPIO correspondentes em cada linha e coluna.
