----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:49:46 10/18/2016 
-- Design Name: 
-- Module Name:    mux - Behavioral 
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

entity mux is
    Port ( i : in  STD_LOGIC;
           dato_seu : in  STD_LOGIC_VECTOR (31 downto 0);
           conReg2 : in  STD_LOGIC_VECTOR (31 downto 0);
           salidaMux : out  STD_LOGIC_VECTOR (31 downto 0));
end mux;

architecture Behavioral of mux is



begin
process(i,dato_seu,conReg2)
begin
	if(i='1')then
		salidaMux<= dato_seu;
	else 
		if(i='0')then
			salidaMux <= conReg2;
		end if ; 
	end if; 	
end process; 

end Behavioral;

