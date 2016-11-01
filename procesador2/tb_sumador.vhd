--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:22:04 11/01/2016
-- Design Name:   
-- Module Name:   C:/Xilinx/procesador2/tb_sumador.vhd
-- Project Name:  procesador2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sumador
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
 
ENTITY tb_sumador IS
END tb_sumador;
 
ARCHITECTURE behavior OF tb_sumador IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sumador
    PORT(
         entrada1 : IN  std_logic_vector(31 downto 0);
         entrada2 : IN  std_logic_vector(31 downto 0);
         salidaSumador : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal entrada1 : std_logic_vector(31 downto 0) := (others => '0');
   signal entrada2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal salidaSumador : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sumador PORT MAP (
          entrada1 => entrada1,
          entrada2 => entrada2,
          salidaSumador => salidaSumador
        );

  
	
	 -- Stimulus process
   stim_proc: process
   begin		
		entrada1 <= x"00000001";
		entrada2 <= x"00000002";
      -- hold reset state for 100 ns. 
      wait for 30 ns;
		entrada1 <= x"00000002";
		entrada2 <= x"00000002";
		wait for 30 ns;
		entrada1 <= x"00000008";
		entrada2 <= x"00000002";
		wait for 30 ns;
		entrada1 <= x"00000004";
		entrada2 <= x"00000002";

      --wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;


END;
