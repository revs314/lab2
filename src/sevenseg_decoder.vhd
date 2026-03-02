----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2026 01:48:17 PM
-- Design Name: 
-- Module Name: sevenseg_decoder - Behavioral
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

entity sevenseg_decoder is
    Port ( i_Hex : in STD_LOGIC_VECTOR (3 downto 0); -- INPUT that is 4 bits HEX -> takes in values 0-F
           o_seg : out STD_LOGIC_VECTOR (6 downto 0)); -- OUTPUT that is 7 bits -> controls Sa - Sg
end sevenseg_decoder;

architecture Behavioral of sevenseg_decoder is
begin
    with i_Hex select
    o_seg <=
        "0000001" when "0000",
        "1001111" when "0001", -- when 1, light up b and c
        "0010010" when "0010", -- when 2, light up all segments except for f and c
        "0000110" when "0011", -- when 3, light up all segments except for f and e
        "1001100" when "0100", -- when 4, light up all segments except for a and e and d
        "0100100" when "0101", -- when 5, light up all segments except for b and e
        "0100000" when "0110", -- when 6, light up all segments except for b
        "0001111" when "0111", -- when 7, light up a, b, c
        "0000000" when "1000", -- when 8, light up all
        "0000100" when "1001", -- when 9, light up all segments except for e and d
        "0001000" when "1010", -- A
        "1100000" when "1011", -- B 
        "1110010" when "1100", -- C
        "1000010" when "1101", -- D
        "0110000" when "1110", -- E
        "0111000" when "1111", -- F
        "1111111" when others;

end Behavioral;
