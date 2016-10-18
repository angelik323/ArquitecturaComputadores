--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:55:19 10/18/2016
-- Design Name:   
-- Module Name:   C:/Users/usuario pc/Desktop/procesador - copia/test_registerFile.vhd
-- Project Name:  procesadormonocicloLDS
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: registerFile
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
 
ENTITY test_registerFile IS
END test_registerFile;
 
ARCHITECTURE behavior OF test_registerFile IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT registerFile
    PORT(
         regSource1 : IN  std_logic_vector(4 downto 0);
         regSource2 : IN  std_logic_vector(4 downto 0);
         dataWrite : IN  std_logic_vector(31 downto 0);
         reset : IN  std_logic;
         regDestino : IN  std_logic_vector(4 downto 0);
         contRegSource1 : OUT  std_logic_vector(31 downto 0);
         contRegSource2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal regSource1 : std_logic_vector(4 downto 0) := (others => '0');
   signal regSource2 : std_logic_vector(4 downto 0) := (others => '0');
   signal dataWrite : std_logic_vector(31 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal regDestino : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal contRegSource1 : std_logic_vector(31 downto 0);
   signal contRegSource2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: registerFile PORT MAP (
          regSource1 => regSource1,
          regSource2 => regSource2,
          dataWrite => dataWrite,
          reset => reset,
          regDestino => regDestino,
          contRegSource1 => contRegSource1,
          contRegSource2 => contRegSource2
        );

  
   -- Stimulus process
   stim_proc: process
   begin		
		reset <= '1';
      -- hold reset state for 100 ns.
      wait for 100 ns;
			reset <='0';
			regSource1 <= "10000";
			regSource2 <= "10001";
			regDestino <= "10010";
			dataWrite  <= "00000000000000000000000000010011";
	
      -- insert stimulus here 

      wait;
   end process;

END;
