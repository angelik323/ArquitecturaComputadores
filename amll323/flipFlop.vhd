----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:59:45 09/05/2016 
-- Design Name: 
-- Module Name:    flipFlop - Behavioral 
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

entity flipFlop is
    Port ( Reset : in  STD_LOGIC;
           Signak : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           salida : out  STD_LOGIC);
end flipFlop;

architecture Behavioral of flipFlop is

begin
	process(CLK, Reset, Signak)
	begin
	if (Reset='1')then
		salida <= '0';
		
   else
		if(rising_edge(CLK)) then
		
         salida <= Signak;
		end if;
	end if;
	end process;


end Behavioral;

