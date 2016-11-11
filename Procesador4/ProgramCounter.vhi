
-- VHDL Instantiation Created from source file ProgramCounter.vhd -- 15:49:18 11/09/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT ProgramCounter
	PORT(
		Pcin : IN std_logic_vector(31 downto 0);
		clk : IN std_logic;
		rst : IN std_logic;          
		Pcout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_ProgramCounter: ProgramCounter PORT MAP(
		Pcin => ,
		clk => ,
		rst => ,
		Pcout => 
	);


