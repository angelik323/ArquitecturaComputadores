--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:58:58 11/01/2016
-- Design Name:   
-- Module Name:   C:/Xilinx/procesador2/TB_ExtSign.vhd
-- Project Name:  procesador2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ExtSign
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_ExtSign IS
END TB_ExtSign;
 
ARCHITECTURE behavior OF TB_ExtSign IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ExtSign
    PORT(
         Ext_in : IN  std_logic_vector(12 downto 0);
         Ext_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Ext_in : std_logic_vector(12 downto 0) := (others => '0');

 	--Outputs
   signal Ext_out : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ExtSign PORT MAP (
          Ext_in => Ext_in,
          Ext_out => Ext_out
        );

   -- Stimulus process
   stim_proc: process
   begin		
	
		Ext_in <= "1000000000001";
      wait for 20 ns;	
		
		Ext_in <= "0111111111111";
      -- insert stimulus here 

      wait;
   end process;

END;