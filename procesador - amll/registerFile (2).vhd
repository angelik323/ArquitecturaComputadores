----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:44:20 10/18/2016 
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
    Port ( regSource1 : in  STD_LOGIC_VECTOR (4 downto 0);
           regSource2 : in  STD_LOGIC_VECTOR (4 downto 0);
           dataWrite : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           regDestino : in  STD_LOGIC_VECTOR (4 downto 0);
           contRegSource1 : out  STD_LOGIC_VECTOR (31 downto 0);
           contRegSource2 : out  STD_LOGIC_VECTOR (31 downto 0));
end registerFile;

architecture Behavioral of registerFile is

   type ram_type is array (0 to 39) of std_logic_vector (31 downto 0);
	signal registros : ram_type :=(others => x"00000000");
	

begin
process(regSource1,regSource2, dataWrite, reset, regDestino)
begin
	if(reset = '1')then
				contRegSource1 <= (others=>'0');
				contRegSource2 <= (others=>'0');
			
				registros <= (others => x"00000000");
			else
				contRegSource1 <= registros(conv_integer(regSource1));
				contRegSource2 <= registros(conv_integer(regSource1));
				
				if(regDestino  /= "000000")then
					registros(conv_integer(regDestino)) <= dataWrite;
				end if;
			end if;
	
end process; 
end Behavioral;

