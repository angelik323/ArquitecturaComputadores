--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:23:24 10/21/2016
-- Design Name:   
-- Module Name:   E:/procesadorMono/tb_UC.vhd
-- Project Name:  procesadorMono
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: UC
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
 
ENTITY tb_UC IS
END tb_UC;
 
ARCHITECTURE behavior OF tb_UC IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT UC
    PORT(
         OP : IN  std_logic_vector(1 downto 0);
         OP3 : IN  std_logic_vector(5 downto 0);
         ALUop : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal OP : std_logic_vector(1 downto 0) := (others => '0');
   signal OP3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal ALUop : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 

-- Instantiate the Unit Under Test (UUT)
   uut: UC PORT MAP (
          OP => OP,
          OP3 => OP3,
          ALUop => ALUop
        ); 

 

   -- Stimulus process
   stim_proc: process
   begin	
		wait for 100 ns;	
		OP <= "10";
		OP3<="000000";
		
		wait for 100 ns;	
		OP <= "11";
		OP3<="000000";
		
		wait for 100 ns;	
		OP <= "01";
		OP3<="000000";

      wait;
   end process;

END;
