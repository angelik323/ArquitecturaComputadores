--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:02:10 10/16/2016
-- Design Name:   
-- Module Name:   C:/Users/usuario pc/Desktop/procesador/test_unidadControl.vhd
-- Project Name:  procesadormonocicloLDS
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: unidadControl
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
 
ENTITY test_unidadControl IS
END test_unidadControl;
 
ARCHITECTURE behavior OF test_unidadControl IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT unidadControl
    PORT(
         op : IN  std_logic_vector(1 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         salida : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal salida : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: unidadControl PORT MAP (
          op => op,
          op3 => op3,
          salida => salida
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
		op <= "10";
		op3<="000000";

      wait;
   end process;
END;
