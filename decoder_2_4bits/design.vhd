-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

-- recebe 4 entradas one-hot e transforma em 2 bits binários

-- S0 = Y2 + Y3
-- S1 = Y1 + Y3

entity encoder4_2bit is
port ( i_Y0 : in std_logic;
	   i_Y1 : in std_logic;
       i_Y2 : in std_logic;
       i_Y3 : in std_logic;
       o_S0 : out std_logic;
       o_S1 : out std_logic);
end encoder4_2bit;

architecture arch_1 of encoder4_2bit is
begin
	o_S0 <= i_Y1 or i_Y3;
    o_S1 <= i_Y2 or i_Y3;
end arch_1;

configuration config_encoder4_2bit of encoder4_2bit is
	for arch_1
    end for;
end;