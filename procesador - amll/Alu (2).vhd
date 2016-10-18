----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:08:57 10/16/2016 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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

entity alu is
    Port ( operando1 : in  STD_LOGIC_VECTOR (31 downto 0);
           operando2 : in  STD_LOGIC_VECTOR (31 downto 0);
           alu_op : in  STD_LOGIC_VECTOR (5 downto 0);
           salida_Alu : out  STD_LOGIC_VECTOR (31 downto 0));
end alu;

architecture Behavioral of alu is

begin
process(operando1, operando2, alu_op)
begin
 case (alu_op) is 
			when "000001" => -- add
				salida_Alu <= operando1 + operando2;
			when "000010" => -- sub
				salida_Alu <= operando1 - operando2;
			when "000011" => --and
				salida_Alu <= operando1 and operando2;
			when "000100" => --andn
				salida_Alu <= operando1 nand operando2;
			when "000101" => -- or
				salida_Alu <= operando1 or operando2;
			when "000110" => -- orn
				salida_Alu <= operando1 nor operando2;
			when "000111" => -- xor
				salida_Alu <= operando1 xor operando2;
			when "001000" => -- xorn
				salida_Alu <= operando1 xnor operando2;
			when others => -- Cae el nop
				salida_Alu <= (others=>'0');
		end case;
	end process; 


end Behavioral;

