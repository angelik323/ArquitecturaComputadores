----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:18:37 09/26/2016 
-- Design Name: 
-- Module Name:    nextprogramcounter - Behavioral 
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
salida<=(others=>'0');

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity nextprogramcounter is
    Port ( insalidasumador : in  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC_VECTOR (31 downto 0);
           dato : in  STD_LOGIC_VECTOR (31 downto 0);
           salida : out  STD_LOGIC_VECTOR (31 downto 0));
end nextprogramcounter;

architecture Behavioral of nextprogramcounter is

begin


end Behavioral;

