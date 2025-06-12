library IEEE;
use ieee.std_logic_1164.all;

entity matriz_LED_Linhas is
    port (
			ADDRESS      : in  std_logic_vector(8 downto 0);
			DADO      : in  std_logic_vector(7 downto 0);
			Lin0     : out std_logic_vector(4 downto 0) := (others => '1');
			Lin1     : out std_logic_vector(4 downto 0) := (others => '1');
			Lin2     : out std_logic_vector(4 downto 0) := (others => '1');
			Lin3     : out std_logic_vector(4 downto 0) := (others => '1');
			Lin4     : out std_logic_vector(4 downto 0) := (others => '1');
			Lin5     : out std_logic_vector(4 downto 0) := (others => '1');
			Lin6     : out std_logic_vector(4 downto 0) := (others => '1');
			CLK         : in  std_logic
			
    );
end entity;

architecture behaviour of matriz_LED_Linhas is
		
signal habREG : std_logic_vector(7 downto 0); 
signal auxhabREG : std_logic;

signal Lin0Aux : std_logic_vector(7 downto 0); 
signal Lin1Aux : std_logic_vector(7 downto 0); 
signal Lin2Aux : std_logic_vector(7 downto 0); 
signal Lin3Aux : std_logic_vector(7 downto 0); 
signal Lin4Aux : std_logic_vector(7 downto 0);
signal Lin5Aux : std_logic_vector(7 downto 0);
signal Lin6Aux : std_logic_vector(7 downto 0);

begin

auxhabREG <= not ADDRESS(8) AND
				 ADDRESS(7) AND
				 ADDRESS(6) AND
				 ADDRESS(5) AND
				 ADDRESS(4) AND
				 ADDRESS(3) AND
				 ADDRESS(2) AND
				 ADDRESS(1) AND
				 ADDRESS(0);

REG_X : entity work.registerGeneric
		generic map ( dataWidth => 8 )
		port map (
			DIN => DADO,
			DOUT => habREG, 
			ENABLE => ADDRESS(8), 
			CLK => CLK, RST => '0'
		);


REG0 : entity work.registerGeneric
		generic map ( dataWidth => 8 )
		port map (
			DIN => DADO, DOUT => Lin0Aux, 
			ENABLE => habREG(0) AND auxhabREG, 
			CLK => CLK, RST => '0'
		);
		
REG1 : entity work.registerGeneric
		generic map ( dataWidth => 8 )
		port map (
			DIN => DADO, DOUT => Lin1Aux, 
			ENABLE => habREG(1) AND auxhabREG, 
			CLK => CLK, RST => '0'
		);
		
REG2 : entity work.registerGeneric
		generic map ( dataWidth => 8 )
		port map (
			DIN => DADO, DOUT => Lin2Aux, 
			ENABLE => habREG(2) AND auxhabREG, 
			CLK => CLK, RST => '0'
		);
		
REG3 : entity work.registerGeneric
		generic map ( dataWidth => 8 )
		port map (
			DIN => DADO, DOUT => Lin3Aux, 
			ENABLE => habREG(3) AND auxhabREG, 
			CLK => CLK, RST => '0'
		);
			
REG4 : entity work.registerGeneric
		generic map ( dataWidth => 8 )
		port map (
			DIN => DADO, DOUT => Lin4Aux, 
			ENABLE => habREG(4) AND auxhabREG, 
			CLK => CLK, RST => '0'
		);
		
		
REG5 : entity work.registerGeneric
		generic map ( dataWidth => 8 )
		port map (
			DIN => DADO, DOUT => Lin5Aux, 
			ENABLE => habREG(5) AND auxhabREG, 
			CLK => CLK, RST => '0'
		);
		
		
REG6 : entity work.registerGeneric
		generic map ( dataWidth => 8 )
		port map (
			DIN => DADO, DOUT => Lin6Aux, 
			ENABLE => habREG(6) AND auxhabREG, 
			CLK => CLK, RST => '0'
		);
		

Lin0 <= Lin0Aux(4 downto 0);
Lin1 <= Lin1Aux(4 downto 0);
Lin2 <= Lin2Aux(4 downto 0);
Lin3 <= Lin3Aux(4 downto 0);
Lin4 <= Lin4Aux(4 downto 0);
Lin5 <= Lin5Aux(4 downto 0);
Lin6 <= Lin6Aux(4 downto 0);

end architecture;