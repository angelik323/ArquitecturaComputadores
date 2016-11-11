
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_procesador4 IS
END tb_procesador4;
 
ARCHITECTURE behavior OF tb_procesador4 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Procesador_3
    PORT(
         Clk : IN  std_logic;
         rst : IN  std_logic;
         Alu_Result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal Alu_Result : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Procesador_3 PORT MAP (
          Clk => Clk,
          rst => rst,
          Alu_Result => Alu_Result
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      rst <= '1';
      wait for 40 ns;	

      rst <= '0';

      -- insert stimulus here 

      wait;
   end process;

END;
