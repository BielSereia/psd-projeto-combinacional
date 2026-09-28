-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
-- empty
end testbench;

architecture tb of testbench is

-- DUT encoder4_2bit
component encoder4_2bit is
port ( i_Y0 : in std_logic;   -- data input
	   i_Y1 : in std_logic;   -- data input
       i_Y2 : in std_logic;   -- data input
       i_Y3 : in std_logic;   -- data input
       o_S0 : out std_logic;  -- data output
       o_S1 : out std_logic); -- data output
end component;

signal w_Y0, w_Y1, w_Y2, w_Y3, w_S0, w_S1 : std_logic;

begin
	u_DUT : encoder4_2bit port map (i_Y0 => w_Y0,
    						  i_Y1 => w_Y1,
                              i_Y2 => w_Y2,
                              i_Y3 => w_Y3,
                              o_S0 => w_S0,
                              o_S1 => w_S1);
                              
	process
    begin
    
    	-- Teste Y0 = 1 → S1S0 = 00
    	w_Y0 <= '1';
        w_Y1 <= '0';
        w_Y2 <= '0';
        w_Y3 <= '0';
        wait for 1 ns;
        assert(w_S0='0' and w_S1='0') report "Fail @ Y0" severity error;
        
        -- Teste Y1 = 1 → S1S0 = 01
        w_Y0 <= '0';
        w_Y1 <= '1';
        w_Y2 <= '0';
        w_Y3 <= '0';
        wait for 1 ns;
        assert(w_S0='1' and w_S1='0') report "Fail @ Y1" severity error;
        
        -- Teste Y2 = 1 → S1S0 = 10
        w_Y0 <= '0';
        w_Y1 <= '0';
        w_Y2 <= '1';
        w_Y3 <= '0';
        wait for 1 ns;
        assert(w_S0='0' and w_S1='1') report "Fail @ Y2" severity error;
        
        -- Teste Y3 = 1 → S1S0 = 11
        w_Y0 <= '0';
        w_Y1 <= '0';
        w_Y2 <= '0';
        w_Y3 <= '1';
        wait for 1 ns;
        assert(w_S0='1' and w_S1='1') report "Fail @ Y3" severity error;
        
        -- Clear inputs
    	w_Y0 <= '0';
        w_Y1 <= '0';
        w_Y2 <= '0';
        w_Y3 <= '0';
    	assert false report "Test done." severity note;
        wait;
	end process;
    
end tb;