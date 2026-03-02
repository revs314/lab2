----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/28/2026 08:54:58 PM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevenseg_decoder_tb is -- no entity here, alr defined in .vhd
    Port ( i_Hex : in STD_LOGIC_VECTOR (3 downto 0); -- INPUT that is 4 bits HEX -> takes in values 0-F
           o_seg : out STD_LOGIC_VECTOR (6 downto 0)); -- OUTPUT that is 7 bits -> controls Sa - Sg
end sevenseg_decoder_tb;




architecture Behavioral of sevenseg_decoder_tb is

component sevenseg_decoder is
    Port (
        i_Hex : in std_logic_vector (3 downto 0);
        o_seg : out std_logic_vector (6 downto 0)
    );
end component sevenseg_decoder;

--declare signals
    signal w_i_Hex : std_logic_vector (3 downto 0):= x"0";
    signal w_o_seg : std_logic_vector (6 downto 0);

begin

--port maps

    sevenseg_decoder_uut : sevenseg_decoder port map (
        i_Hex => w_i_Hex, --i_Hex connects to w_i_Hex signal
        o_seg => w_o_seg  --o_seg connects to w_o_seg
    );
    
    
test_process : process 
	begin
	
	--all test cases
	
	--Test 0
    w_i_Hex <= x"0"; wait for 10 ns;
            assert w_o_seg = "1000000" report "error on 0" severity failure;
    --Test 1
    w_i_Hex <= x"1"; wait for 10 ns;
            assert w_o_seg = "1111001" report "error on 1" severity failure;	
    --Test 2
    w_i_Hex <= x"2"; wait for 10 ns;
            assert w_o_seg = "0100100" report "error on 2" severity failure;
    --Test 3
    w_i_Hex <= x"3"; wait for 10 ns;
            assert w_o_seg = "0110000" report "error on 3" severity failure;
    --Test 4
    w_i_Hex <= x"4"; wait for 10 ns;
            assert w_o_seg = "0011001" report "error on 4" severity failure;
    --Test 5
    w_i_Hex <= x"5"; wait for 10 ns;
            assert w_o_seg = "0010010" report "error on 5" severity failure;
    --Test 6
    w_i_Hex <= x"6"; wait for 10 ns;
            assert w_o_seg = "0000010" report "error on 6" severity failure;
    --Test 7
    w_i_Hex <= x"7"; wait for 10 ns;
            assert w_o_seg = "1111000" report "error on 7" severity failure;
    --Test 8
    w_i_Hex <= x"8"; wait for 10 ns;
            assert w_o_seg = "0000000" report "error on 8" severity failure;
    --Test 9
    w_i_Hex <= x"9"; wait for 10 ns;
            assert w_o_seg = "0010000" report "error on 9" severity failure;
    --Test A
    w_i_Hex <= x"A"; wait for 10 ns;
            assert w_o_seg = "0001000" report "error on A" severity failure;
    --Test B
    w_i_Hex <= x"B"; wait for 10 ns;
            assert w_o_seg = "0000011" report "error on B" severity failure;
    --Test C
    w_i_Hex <= x"C"; wait for 10 ns;
            assert w_o_seg = "0100111" report "error on C" severity failure;
    --Test D
    w_i_Hex <= x"D"; wait for 10 ns;
            assert w_o_seg = "0100001" report "error on D" severity failure;
    --Test E
    w_i_Hex <= x"E"; wait for 10 ns;
            assert w_o_seg = "0000110" report "error on E" severity failure;
     --Test F
    w_i_Hex <= x"F"; wait for 10 ns;
            assert w_o_seg = "0001110" report "error on F" severity failure;
            
    w_i_Hex <= "UUUU"; wait for 10 ns; -- tests other inputs
    
    
        wait; -- wait forever
	end process;	
	-----------------------------------------------------	


end Behavioral;







