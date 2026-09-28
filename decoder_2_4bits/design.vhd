-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

-- recebe 2 bits binários e transforma em 4 saídas one-hot

-- Y0 = not S1 and not S0
-- Y1 = not S1 and S0
-- Y2 = S1 and not S0
-- Y3 = S1 and S0

entity decoder_2_4bits is
port ( i_S0 : in  std_logic;
       i_S1 : in  std_logic;
       o_Y0 : out std_logic;
       o_Y1 : out std_logic;
       o_Y2 : out std_logic;
       o_Y3 : out std_logic);
end decoder_2_4bits;

architecture arch_1 of decoder_2_4bits is
begin
    o_Y0 <= not i_S1 and not i_S0;
    o_Y1 <= not i_S1 and i_S0;
    o_Y2 <= i_S1 and not i_S0;
    o_Y3 <= i_S1 and i_S0;
end arch_1;

configuration config_decoder_2_4bits of decoder_2_4bits is
    for arch_1
    end for;
end;