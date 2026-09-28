library ieee;
use ieee.std_logic_1164.all;

entity testbench is
-- empty
end testbench;

architecture tb of testbench is

-- DUT component
component demux1_2bit is
port ( i_SEL : in  std_logic;   -- selector
       i_A   : in  std_logic;   -- data input
       o_S0  : out std_logic;   -- data output
       o_S1  : out std_logic);  -- data output
end component;

signal w_SEL, w_A, w_S0, w_S1 : std_logic;

begin
	u_DUT : demux1_2bit port map (i_SEL => w_SEL,
    							  i_A => w_A,
                                  o_S0 => w_S0,
                                  o_S1 => w_S1);
	process
    begin
    	w_SEL <= '0';
    	w_A   <= '0';
    	wait for 1 ns;
        assert(w_S0='0' and w_S1='0') report "Fail @ 000" severity error;
        
        w_SEL <= '0';
    	w_A   <= '1';
    	wait for 1 ns;
        assert(w_S0='1' and w_S1='0') report "Fail @ 000" severity error;
        
        w_SEL <= '1';
    	w_A   <= '0';
    	wait for 1 ns;
        assert(w_S0='0' and w_S1='0') report "Fail @ 000" severity error;
    
    	w_SEL <= '1';
    	w_A   <= '1';
    	wait for 1 ns;
        assert(w_S0='0' and w_S1='1') report "Fail @ 000" severity error;
    
    	-- Clear inputs
    	w_SEL         <= '0';
    	w_A           <= '0';
    	assert false report "Test done." severity note;
        wait;
    end process;

end tb;