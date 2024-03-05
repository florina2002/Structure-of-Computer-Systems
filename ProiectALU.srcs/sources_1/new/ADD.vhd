----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.12.2023 05:22:43
-- Design Name: 
-- Module Name: addition - Behavioral
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

entity ADD is
  Port (
  signal X :  in STD_LOGIC_VECTOR (15 downto 0);
  signal Y :  in STD_LOGIC_VECTOR (15 downto 0);
  signal Ti : in STD_LOGIC;
  signal S : out STD_LOGIC_VECTOR (15 downto 0);
  signal Tout: out STD_LOGIC
   );
end ADD;

architecture Behavioral of ADD is

component RCA4b is
  Port (
   signal X :  in STD_LOGIC_VECTOR (3 downto 0);
   signal Y : in STD_LOGIC_VECTOR (3 downto 0);
   signal Ti : in STD_LOGIC;
   signal S : out STD_LOGIC_VECTOR(3 downto 0);
   signal Tout: out STD_LOGIC
   );
end component;

signal T1, T2, T3 : STD_LOGIC;
signal T : STD_LOGIC_VECTOR (16 downto 0);

begin

RCA1: RCA4b port map(X(3 downto 0), Y(3 downto 0), Ti, S(3 downto 0), T1);
RCA2: RCA4b port map(X(7 downto 4), Y(7 downto 4), T1, S(7 downto 4), T2);
RCA3: RCA4b port map(X(11 downto 8), Y(11 downto 8), T2, S(11 downto 8), T3);
RCA4: RCA4b port map(X(15 downto 12), Y(15 downto 12), T3, S(15 downto 12), Tout);


--T(0) <= Ti;
-- summ:      for i in 0 to 15 generate
--            S(i) <= X(i) xor Y(i) xor T(i);
--            T(i+1) <= (X(i) and Y(i)) or ((X(i) or Y(i)) and T(i));
--        end generate;

-- Tout <= T(16);

end Behavioral;
