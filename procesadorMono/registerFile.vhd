----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:10:24 10/21/2016 
-- Design Name: 
-- Module Name:    registerFile - Behavioral 
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

entity registerFile is
    Port ( regDestino : in  STD_LOGIC_VECTOR (4 downto 0);
           rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
			  datatowrite : in STD_LOGIC_VECTOR (31 downto 0);
			  rst : in  STD_LOGIC ;
           Crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Crs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end registerFile;

architecture Behavioral of registerFile is

	type ram_type is array (0 to 39) of std_logic_vector (31 downto 0);
	signal registros : ram_type :=(others => x"00000000");
	
begin
process(rs1,rs2,regDestino, datatowrite, rst)
begin
		if(rst = '1')then		
						registros <= (others=>x"00000000");    
						registros(16)<= "11111111111111111111111111111000";
						registros(17)<= "00000000000000000000000000000100";
						registros(18)<= "00000000000000000000000000000111";
						Crs1 <= (others => '0');
						Crs2 <= (others => '0');
					else
						Crs1 <= registros(conv_integer(rs1));
						Crs2 <= registros(conv_integer(rs2));
					   if(regDestino  /= "000000")then
							registros(conv_integer(regDestino)) <= datatowrite;
						end if;
		end if;		
				
					
end process; 


end Behavioral;

