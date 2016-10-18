----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:31:51 10/03/2016 
-- Design Name: 
-- Module Name:    RF - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.All;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RF is
    Port ( rs : in  STD_LOGIC_VECTOR (4 downto 0);
           rt : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           wd : in  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
           w : in  STD_LOGIC;
           drt : out  STD_LOGIC_VECTOR (31 downto 0);
           drs : out  STD_LOGIC_VECTOR (31 downto 0));
end RF;

architecture Arq_RF of RF is

type RAM_RF is array (0 to 31) of std_logic_vector (31 downto 0);
signal Memory_RAM  : RAM_RF := ( others => X"00000000");


begin

dRs<=Memory_RAM(Conv_integer(Rs));
dRt<=Memory_RAM(Conv_integer(Rt));

Process(CLK,w,Wd)
Begin
	if rising_edge (CLK) then 
		if (w='1') then
			Memory_RAM(Conv_integer(Rd))<=Wd;
		end if;
	end if;
end process;
	
end Arq_RF;

