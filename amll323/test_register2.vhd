--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:28:32 09/05/2016
-- Design Name:   
-- Module Name:   C:/Users/Public/Documents/amll/amll323/test_register2.vhd
-- Project Name:  amll323
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: flipFlop
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
 
ENTITY test_register2 IS
END test_register2;
 
ARCHITECTURE behavior OF test_register2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT flipFlop
    PORT(
         Reset : IN  std_logic;
         Signak : IN  std_logic;
         CLK : IN  std_logic;
         salida : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Reset : std_logic := '0';
   signal Signak : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal salida : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: flipFlop PORT MAP (
          Reset => Reset,
          Signak => Signak,
          CLK => CLK,
          salida => salida
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		reset <= '1';
		signak <= '0';
      wait for 100 ns;
		reset <= '0';
		signak <= '1';	
		wait for 100 ns;
		signak <= '0';
		wait for 100 ns;
		signak <= '1';
		wait for 100 ns;
		signak <= '1';
		
      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
