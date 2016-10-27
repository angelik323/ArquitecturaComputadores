----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:50:20 10/21/2016 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( Crs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  ALU_op:  in  STD_LOGIC_VECTOR (5 downto 0); 
           salida_Alu : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is

begin
process(Crs1, Crs2, ALU_op)
begin
case (ALU_op) is 
		when "000000" => --Add
			salida_Alu <= Crs1 + Crs2;
		when "000001" => --Sub
			salida_Alu <= Crs1 - Crs2;
		when "000010" => --And
			salida_Alu <= Crs1 and Crs2;
		when "000011" => --AndN
			salida_Alu <= Crs1 nand Crs2;
		when "000100" => --Or
			salida_Alu <= Crs1 or Crs2;
		when "000101" => --OrN
			salida_Alu <= Crs1 nor Crs2;
		when "000110" => --Xor
			salida_Alu <= Crs1 xor Crs2;
		when "000111" => --Xnor
			salida_Alu <= Crs1 xnor Crs2;
		when others =>
			salida_Alu <= x"00000000";				
	end case;
	
end process; 


end Behavioral;

