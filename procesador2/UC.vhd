----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:43:46 11/01/2016 
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


entity UC is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUOP : out  STD_LOGIC_VECTOR (5 downto 0));
end UC;

architecture Behavioral of UC is

begin

	process(op,op3)
	begin
		if(op = "10")then
			case(op3) is
				when "000001" => 
					ALUOP <= "000000";
				when "000101" => 
					ALUOP <= "000001";
				when "000010" =>
					ALUOP <= "000010";
				when "000110" => 
					ALUOP <= "000011";
				when "000011" => 
					ALUOP <= "000100";
				when "000111" => 
					ALUOP <= "000101";
				when "000100" => 
					ALUOP <= "000111";		
				when "000000" => 
					ALUOP <= "000110";
				when others => 
					ALUOP <= "111111";
			end case;
		end if;	
	end process;
					

end Behavioral;