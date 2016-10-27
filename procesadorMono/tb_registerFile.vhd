--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:37:13 10/21/2016
-- Design Name:   
-- Module Name:   E:/procesadorMono/tb_registerFile.vhd
-- Project Name:  procesadorMono
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
 
ENTITY tb_registerFile IS
END tb_registerFile;
 
ARCHITECTURE behavior OF tb_registerFile IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT registerFile
    PORT(
         regDestino : IN  std_logic_vector(4 downto 0);
         rs1 : IN  std_logic_vector(4 downto 0);
         rs2 : IN  std_logic_vector(4 downto 0);
         datatowrite : IN  std_logic_vector(31 downto 0);
         Crs1 : OUT  std_logic_vector(31 downto 0);
         Crs2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal regDestino : std_logic_vector(4 downto 0) := (others => '0');
   signal rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal datatowrite : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Crs1 : std_logic_vector(31 downto 0);
   signal Crs2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: registerFile PORT MAP (
          regDestino => regDestino,
          rs1 => rs1,
          rs2 => rs2,
          datatowrite => datatowrite,
          Crs1 => Crs1,
          Crs2 => Crs2
        );

   -- Clock process definitions
  -- <clock>_process :process
  -- begin
	--	<clock> <= '0';
		--wait for <clock>_period/2;
		--<clock> <= '1';
		--wait for <clock>_period/2;
   --end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		
      -- hold reset state for 100 ns.
      wait for 100 ns;
			
			regDestino <= "10010";
			rs1 <= "10000";
			rs2 <= "10001";
			datatowrite  <= "00000000000000000000000000010011";
			
		wait for 100 ns;
		
		   regDestino <= "00000";
			rs1 <= "10010";
			rs2 <= "10001";
			datatowrite  <= "00000000000000000000000000010011";
	
      
      wait;
   end process;

END;
