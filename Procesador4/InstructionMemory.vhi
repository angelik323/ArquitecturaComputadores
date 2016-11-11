
-- VHDL Instantiation Created from source file InstructionMemory.vhd -- 15:53:34 11/09/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT InstructionMemory
	PORT(
		Address : IN std_logic_vector(31 downto 0);
		Reset : IN std_logic;          
		OutInstruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_InstructionMemory: InstructionMemory PORT MAP(
		Address => ,
		Reset => ,
		OutInstruction => 
	);


