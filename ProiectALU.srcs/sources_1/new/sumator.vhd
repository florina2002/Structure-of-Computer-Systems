----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2023 08:15:53 AM
-- Design Name: 
-- Module Name: sumator - Behavioral
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

entity sumator is
  Port ( x: in std_logic_vector(1 downto 0);
         y: in std_logic_vector(1 downto 0);
         Tin: in std_logic;
         --Tout: out std_logic;
         P: out std_logic;
         G: out std_logic;
         S: out std_logic_vector(1 downto 0)
         );
end sumator;

architecture Behavioral of sumator is
signal g0,g1: std_logic;
signal p0,p1: std_logic;
signal t1: std_logic;
--S0 = (A0 XOR B0) XOR Cin
--S1 = ((A0 XOR B0) XOR Cin) XOR (A1 XOR B1)
--Cout = (A1 AND B1) OR ((A0 OR B0) AND Cin)
begin
    g0 <= x(0) and y(0);
    g1 <= x(1) and y(1);
    p0 <= x(0) or y(0);
    p1 <= x(1) or y(1);
    
    G <= g1 or (p1 and g0);
    P <= p1 and p0;
    
    t1<= g0 or (p0 and tin);
    s(0) <= (x(0) xor y(0)) xor Tin;
    S(1)<=X(1) xor Y(1) xor T1;

end Behavioral;
