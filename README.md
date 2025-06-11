# Módulo Matriz de LEDs 7x5 — Projeto para a Disciplina de Design de Computadores

![imgs/led_matriz_conectada_v0)

## Visão Geral

Este projeto consiste em uma matriz de LEDs 7x5 desenvolvida com o objetivo de auxiliar nas aulas de Design de Computadores. A matriz pode ser controlada por meio de seu barramento de 40 pinos (compatível com GPIO-Terasic), utilizando VHDL para implementar o controle dos LEDs. O sistema é capaz de exibir caracteres ou símbolos personalizados.

## Objetivos

- Desenvolver um periférico simples (matriz 7x5) para prática com sistemas digitais;
- Ser controlado como um periférico de um processador, por meio de barramento de dados/memória;
- Exercitar a integração entre hardware físico e externo aos kits padrões da Terasic;
- Auxiliar na didática do aluno na compreensão de como funciona e é definido o mapeamento de memória na eletrônica digital;
- Representar símbolos ou letras utilizando uma interface visual.

## Materiais Utilizados

- 35× LEDs azuis  
- Fios wire-up  
- 1× Placa padrão dupla face  
- 1× Flat cable de 40 vias  
- 2x Conectores latch 40 vias fêmea  
- 1x Conector latch 40 vias macho  

## Funcionamento

Cada LED está ligado a um GPIO específico do barramento padrão GPIO-Terasic, sendo que o LED superior esquerdo está ligado ao GPIO_n(0) e o LED inferior direito está ligado ao GPIO_n(34).

A placa permite que os LEDs da matriz 7x5 sejam acesos de forma direta, apenas colocando nível lógico 1 (3V3) no respectivo pino.  
A lógica de controle deve ser implementada em VHDL e pode receber um valor codificado de caractere ou bitmap para ser exibido.

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


## Mapeamento dos GPIOs
A matriz 7x5 utiliza 35 GPIOs sequenciais do conector GPIO da DE0-CV. A distribuição física dos LEDs na matriz segue a organização abaixo:

less
Copiar
Editar
LEDs na matriz (visão frontal):

Linha 0 (topo)     -> GPIO[0]   GPIO[1]   GPIO[2]   GPIO[3]   GPIO[4]  
Linha 1            -> GPIO[5]   GPIO[6]   GPIO[7]   GPIO[8]   GPIO[9]  
Linha 2            -> GPIO[10]  GPIO[11]  GPIO[12]  GPIO[13]  GPIO[14]  
Linha 3            -> GPIO[15]  GPIO[16]  GPIO[17]  GPIO[18]  GPIO[19]  
Linha 4            -> GPIO[20]  GPIO[21]  GPIO[22]  GPIO[23]  GPIO[24]  
Linha 5            -> GPIO[25]  GPIO[26]  GPIO[27]  GPIO[28]  GPIO[29]  
Linha 6 (base)     -> GPIO[30]  GPIO[31]  GPIO[32]  GPIO[33]  GPIO[34]  
Cada LED está diretamente ligado a um pino específico, sem multiplexação. O controle é feito diretamente via sinais lógicos de 3.3V aplicados ao pino correspondente.

## Exemplo de Bitmap de Caractere
Para representar a letra M, por exemplo, podemos usar um vetor de 7 linhas, onde cada elemento é um vetor de 5 bits (colunas), sendo 1 para LED aceso e 0 para LED apagado:

```vhdl

type caractere_t is array (0 to 6) of std_logic_vector(4 downto 0);

constant H : caractere_t := (
  "10001",  -- linha 0 (topo)
  "10001",  -- linha 1
  "10001",  -- linha 2
  "11111",  -- linha 3
  "10001",  -- linha 4
  "10001",  -- linha 5
  "10001"   -- linha 6 (base)
);
Você pode construir outros caracteres com a mesma lógica, e usar um processo VHDL que percorra esse vetor, acionando as saídas GPIO correspondentes em cada linha e coluna.
