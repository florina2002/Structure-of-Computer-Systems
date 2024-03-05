----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.12.2023 02:16:24
-- Design Name: 
-- Module Name: ALU_simulator - Behavioral
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

entity ALU_simulator is
end ALU_simulator;

architecture Behavioral of ALU_simulator is

signal A: std_logic_vector(7 downto 0);
signal B: std_logic_vector(7 downto 0);
signal sel: std_logic_vector(2 downto 0);
signal Y: std_logic_vector(15 downto 0);

begin

    DUT: entity WORK.ALU port map(A, B, sel, Y); 

process
begin

    A<= "11001000";
    B<= "01100100";

    wait for 10 ns;
    sel <= "000";
    
    wait for 10 ns;
    sel <= "001";
    
    wait for 10 ns;
    sel <= "010";
    
    wait for 10 ns;
    sel <= "011";
    
    wait for 10 ns;
    sel <= "100";
    
    wait for 10 ns;
    sel <= "101";
    
    wait for 10 ns;
    sel <= "110";
    
    wait for 10 ns;
    sel <= "111";
   
end process;


end Behavioral;
