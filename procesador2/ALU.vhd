----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:05:20 11/01/2016 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;


entity ALU is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUOP : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUResult : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is

begin

	process(A,B,ALUOP)
	begin
		case (ALUOP) is 
			when "000000" => 
				ALUResult <= A and B;
			when "000001" =>
				ALUResult <= not(A and B);
			when "000010" =>
				ALUResult <= A or B;
			when "000011" =>
				ALUResult <= not(A or B);
			when "000100" =>
				ALUResult <= A xor B;
			when "000101" =>
				ALUResult <= not(A xor B);
			when "000110" =>
				ALUResult <= A + B;
			when "000111" =>
				ALUResult <= A - B;
			when others =>
				ALUResult <= "11111111111111111111111111111111";
		end case;
	end process;
	
end Behavioral;