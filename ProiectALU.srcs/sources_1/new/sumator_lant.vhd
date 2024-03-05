----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2023 08:35:58 AM
-- Design Name: 
-- Module Name: sumator_lant - Behavioral
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

entity sumator_lant is
  Port ( x: in std_logic_vector(7 downto 0);
         y: in std_logic_vector(7 downto 0);
         Tin: in std_logic;
         S: out std_logic_vector(7 downto 0);
         Tout: out std_logic 
  );
end sumator_lant;

architecture Behavioral of sumator_lant is
signal p0,p1,p2,p3: std_logic;
signal g0,g1,g2,g3: std_logic;
signal t2,t4,t6: std_logic;
begin

    Sum1: entity Work.sumator port map(x(1 downto 0), y(1 downto 0), Tin, p0,g0, S(1 downto 0));
    t2 <= g0 or (p0 and Tin);
    Sum2: entity Work.sumator port map(x(3 downto 2), y(3 downto 2), t2, p1,g1, S(3 downto 2));
    t4 <= g1 or (p1 and g0) or (p1 and p0 and Tin);
    Sum3: entity Work.sumator port map(x(5 downto 4), y(5 downto 4), t4, p2,g2, S(5 downto 4));
    t6 <= g2 or (p2 and g1) or (p2 and p1 and g0) or (p2 and p1 and p0 and Tin);
    Sum4: entity Work.sumator port map(x(7 downto 6), y(7 downto 6), t6, p3,g3, S(7 downto 6));
    Tout <= g3 or (p3 and g2) or (p3 and p2 and g1) or (p3 and p2 and p1 and g0) or (p3 and p2 and p1 and p0 and Tin);
    

end Behavioral;
