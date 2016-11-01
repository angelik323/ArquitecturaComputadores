--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:51:53 11/01/2016
-- Design Name:   
-- Module Name:   C:/Xilinx/procesador2/tb_multiplexor.vhd
-- Project Name:  procesador2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: multiplexor
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
 
ENTITY tb_multiplexor IS
END tb_multiplexor;
 
ARCHITECTURE behavior OF tb_multiplexor IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT multiplexor
    PORT(
         CRS2 : IN  std_logic_vector(31 downto 0);
         inmediato : IN  std_logic;
         salidaSEU : IN  std_logic_vector(31 downto 0);
         resultado : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CRS2 : std_logic_vector(31 downto 0) := (others => '0');
   signal inmediato : std_logic := '0';
   signal salidaSEU : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal resultado : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: multiplexor PORT MAP (
          CRS2 => CRS2,
          inmediato => inmediato,
          salidaSEU => salidaSEU,
          resultado => resultado
        );

--   -- Clock process definitions
--   <clock>_process :process 
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      CRS2 <= "00000000000000000000001000110110";
				salidaSEU <= "00000000100000000000000000010110";
				inmediato <= '1'; 
      wait for 40 ns;	
				inmediato <= '0';

      wait;
   end process;

END;
