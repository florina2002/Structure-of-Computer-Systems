
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( Clk: in STD_LOGIC;
         Rst: in STD_LOGIC;
         sel: in std_logic_vector(2 downto 0);
         An: out STD_LOGIC_VECTOR(7 downto 0);
         Seg: out STD_LOGIC_VECTOR(7 downto 0)
    );
end ALU;

architecture Behavioral of ALU is

signal inv: std_logic_vector(7 downto 0);
signal andX: std_logic_vector(7 downto 0);
signal orX: std_logic_vector(7 downto 0);
signal xorX: std_logic_vector(7 downto 0);
signal sum: std_logic_vector(7 downto 0);
signal dif: std_logic_vector(7 downto 0);
signal mul: std_logic_vector(15 downto 0);
signal div: std_logic_vector(15 downto 0);

signal carry_sum: std_logic;
signal inv_B: std_logic_vector(7 downto 0);

signal ext_A: STD_LOGIC_VECTOR(15 downto 0);
signal ext_B: STD_LOGIC_VECTOR(15 downto 0);
signal cat: STD_LOGIC_VECTOR(15 downto 0);
signal rest: STD_LOGIC_VECTOR(15 downto 0);

signal term: STD_LOGIC;

signal A: STD_LOGIC_VECTOR(7 downto 0);
signal B: STD_LOGIC_VECTOR(7 downto 0);
signal Y: STD_LOGIC_VECTOR(15 downto 0);
signal Data: STD_LOGIC_VECTOR(31 downto 0);

begin

    A <= "11001000";--200 valori hardcodate
    B <= "01100100";--100
    
    ext_A <= "00000000" & A;
    ext_B <= "00000000" & A;

    inv_B <= (not B) + "1";

    inv <= not A; 
    andX <= A and B;
    orX <= A or B;
    xorX <= A xor B;
    Suma: entity Work.sumator_lant port map(x => A, y => B, Tin => '0', S => sum, Tout => carry_sum);
    Diferenta: entity Work.sumator_lant port map(x => A, y => inv_B, Tin => '0', S => dif, Tout => carry_sum);
    Produs: entity WORK.inmultitor port map(X => A, Y => B, P => mul);
    Impartire: entity WORK.divider port map(Clk => Clk, Rst => Rst, Start => '1', X => ext_A, Y => ext_B, A => cat, Q => rest, Term => term);
     

    MUX:process(sel)
    begin
        case sel is
        
            when "000" => Y <= "00000000" & inv;
            when "001" => Y <= "00000000" & andX;
            when "010" => Y <= "00000000" & orX;
            when "011" => Y <= "00000000" & xorX;
            when "100" => Y <= "0000000" & carry_sum & sum;
            when "101" => Y <= "00000000" & dif;
            when "110" => Y <= mul;
            when "111" => Y <= cat(7 downto 0) & rest(7 downto 0);
            
            when others => Y <= "0000000000000000";
            
        end case;
    end process;
    
    Data <= A & B & Y;
    
    display: entity WORK.displ7seg port map(Clk => Clk, Rst => Rst, Data => Data, An => An, Seg => Seg);


end Behavioral;
