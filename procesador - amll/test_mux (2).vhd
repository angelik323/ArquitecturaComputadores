--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:50:56 10/18/2016
-- Design Name:   
-- Module Name:   C:/Users/usuario pc/Desktop/procesador - copia/test_mux.vhd
-- Project Name:  procesadormonocicloLDS
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux
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
 
ENTITY test_mux IS
END test_mux;
 
ARCHITECTURE behavior OF test_mux IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux
    PORT(
         i : IN  std_logic;
         dato_seu : IN  std_logic_vector(31 downto 0);
         conReg2 : IN  std_logic_vector(31 downto 0);
         salidaMux : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal i : std_logic := '0';
   signal dato_seu : std_logic_vector(31 downto 0) := (others => '0');
   signal conReg2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal salidaMux : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux PORT MAP (
          i => i,
          dato_seu => dato_seu,
          conReg2 => conReg2,
          salidaMux => salidaMux
        );

  
   -- Stimulus process
   stim_proc: process
   begin	
		i <='1';
		dato_seu <= x"00000004";
		conReg2 	<= x"00000008";
	
      wait;
   end process;

END;
