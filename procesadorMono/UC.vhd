----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:55:53 10/21/2016 
-- Design Name: 
-- Module Name:    UC - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UC is
    Port ( OP : in  STD_LOGIC_VECTOR (1 downto 0);
           OP3 : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUop : out  STD_LOGIC_VECTOR (5 downto 0));
end UC;

architecture Behavioral of UC is

begin
process(OP,OP3)
	begin
	if (OP= "10")then
			case OP3 is 				
			when "000000" => --Add
				ALUop <= "000000";
				
			when "000100" => --Sub
				ALUop <= "000001";
				
			when "000001" => --And
				ALUop <= "000010";
				
			when "000101" => --AndN
				ALUop <= "000011";
				
			when "000010" => --Or
				ALUop <= "000100";
				
			when "000110" => --OrN
				ALUop <= "000101";
				
			when "000011" => --Xor
				ALUop <= "000110";
				
			when "000111" => --Xnor
				ALUop <= "000111";
			when others =>
				ALUop <= "111111";					 
			end case;
	else
		AluOp <= "111111";
	end if;
end process; 


end Behavioral;

