-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
-- empty
end testbench;

architecture tb of testbench is

-- DUT decoder_2_4bits
component decoder_2_4bits is
port ( i_S0 : in  std_logic;  -- data input
       i_S1 : in  std_logic;  -- data input
       o_Y0 : out std_logic;  -- data output
       o_Y1 : out std_logic;  -- data output
       o_Y2 : out std_logic;  -- data output
       o_Y3 : out std_logic); -- data output
end component;

signal w_S0, w_S1, w_Y0, w_Y1, w_Y2, w_Y3 : std_logic;

begin
	u_DUT : decoder_2_4bits port map (i_S0 => w_S0,
    						  		  i_S1 => w_S1,
                                      o_Y0 => w_Y0,
                              		  o_Y1 => w_Y1,
                              		  o_Y2 => w_Y2,
                              		  o_Y3 => w_Y3);
                                      
	process
    begin
    	
        -- Teste S1S0 = 00 → Y0 = 1
        w_S0 <= '0';
        w_S1 <= '0';
        wait for 1 ns;
        assert (w_Y0 = '1' and w_Y1 = '0' and w_Y2 = '0' and w_Y3 = '0') report "Fail @ S1S0 = 00"
        severity error;
        
        -- Teste S1S0 = 01 → Y1 = 1
        w_S0 <= '1';
        w_S1 <= '0';
        wait for 1 ns;
        assert (w_Y0 = '0' and w_Y1 = '1' and w_Y2 = '0' and w_Y3 = '0') report "Fail @ S1S0 = 01"
        severity error;
        
        -- Teste S1S0 = 10 → Y2 = 1
        w_S0 <= '0';
        w_S1 <= '1';
        wait for 1 ns;
        assert (w_Y0 = '0' and w_Y1 = '0' and w_Y2 = '1' and w_Y3 = '0') report "Fail @ S1S0 = 10"
        severity error;


        -- Teste S1S0 = 11 → Y3 = 1
        w_S0 <= '1';
        w_S1 <= '1';
        wait for 1 ns;
        assert (w_Y0 = '0' and w_Y1 = '0' and w_Y2 = '0' and w_Y3 = '1') report "Fail @ S1S0 = 11"
        severity error;
        
        -- Clear inputs
    	w_S0 <= '0';
        w_S1 <= '0';
    	assert false report "Test done." severity note;
        wait;
	end process;

end tb;