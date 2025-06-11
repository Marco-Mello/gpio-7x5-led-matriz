# Módulo Matriz de LEDs 7x5 — Projeto para a Disciplina de Design de Computadores

![Matriz 7x5 conectada à DE0-CV](./WhatsApp%20Image%202025-06-11%20at%2011.28.21.jpeg)

## Visão Geral

Este projeto consiste em uma matriz de LEDs 7x5 desenvolvida com o objetivo de auxiliar nas aulas de Design de Computadores. A matriz é controlada por meio de uma FPGA DE0-CV, utilizando VHDL para implementar o controle dos LEDs. O sistema é capaz de exibir caracteres ou símbolos personalizados.

## Objetivos

- Desenvolver um periférico simples (matriz 7x5) para prática com sistemas digitais.
- Estudar o controle multiplexado de LEDs.
- Exercitar a integração entre hardware físico (protoboard e matriz) e lógica em VHDL.
- Representar símbolos ou letras utilizando uma interface visual.

## Materiais Utilizados

- 1× Placa FPGA DE0-CV (Terasic)
- 35× LEDs azuis
- 7× Resistores (para controle de corrente nas linhas ou colunas)
- 1× Protoboard ou placa de fenolite
- 1× Flat cable de 40 vias
- Conectores macho/fêmea
- Fios de conexão
- Software Quartus Prime (para desenvolvimento em VHDL)

## Funcionamento

O sistema acende os LEDs da matriz 7x5 de forma multiplexada, varrendo colunas (ou linhas) rapidamente e atualizando os LEDs com base em um registrador de dados. O símbolo exibido atualmente na foto é a letra "M".

A lógica de controle é implementada em VHDL e pode receber um valor codificado de caractere ou bitmap para ser exibido.

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
