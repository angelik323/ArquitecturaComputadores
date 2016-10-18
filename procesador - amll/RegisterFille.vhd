----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:16:46 10/18/2016 
-- Design Name: 
-- Module Name:    RegisterFille - ArquitecturaRegisterFille 
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

entity RegisterFille is
    Port ( RS1 : in  STD_LOGIC_VECTOR (4 downto 0);
           RS2 : in  STD_LOGIC_VECTOR (4 downto 0);
           RD : in  STD_LOGIC_VECTOR (4 downto 0);
           RALU : in  STD_LOGIC_VECTOR (31 downto 0);
           CRS1 : out  STD_LOGIC_VECTOR (31 downto 0);
           CRS2 : out  STD_LOGIC_VECTOR (31 downto 0);
           RFRESET : in  STD_LOGIC);
end RegisterFille;

architecture ArquitecturaRegisterFille of RegisterFille is

   type ram_type is array (0 to 39) of std_logic_vector (31 downto 0);
	signal registers : ram_type :=(others => x"00000000");

begin

	process(RFreset,RS1,RS2,RD,RALU)
	
begin
		if(RFreset = '1')then
					CRS1 <= (others=>'0');
					CRS2 <= (others=>'0');
					registers <= (others => x"00000000");
				else
					CRS1 <= registers(conv_integer(RS1));
					CRS2 <= registers(conv_integer(RS2));
					if(RD /= "000000")then
						registers(conv_integer(RD)) <= RALU;
					end if;
				end if;
	end process;

end ArquitecturaRegisterFille;

