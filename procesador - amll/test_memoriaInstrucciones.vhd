--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:37:43 10/12/2016
-- Design Name:   
-- Module Name:   E:/procesador/test_memoriaInstrucciones.vhd
-- Project Name:  procesadormonocicloLDS
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: memoriaInstrucciones
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use std.textio.all;

 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_memoriaInstrucciones IS
END test_memoriaInstrucciones;
 
ARCHITECTURE behavior OF test_memoriaInstrucciones IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT memoriaInstrucciones
    PORT(
         direccion : IN  std_logic_vector(31 downto 0);
         instruccion : OUT  std_logic_vector(31 downto 0);
         reset : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal direccion : std_logic_vector(31 downto 0) := (others => '0');
   signal reset : std_logic := '0';

 	--Outputs
   signal instruccion : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: memoriaInstrucciones PORT MAP (
          direccion => direccion,
          instruccion => instruccion,
          reset => reset
        );

   
 

   -- Stimulus process
   stim_proc: process
   begin	
		reset <='1';
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		reset <='0';
		direccion <= x"00000001";

      --wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;