
-- VHDL Instantiation Created from source file Alu.vhd -- 14:17:01 11/10/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Alu
	PORT(
		Crs1 : IN std_logic_vector(31 downto 0);
		Crs2 : IN std_logic_vector(31 downto 0);
		AluOp : IN std_logic_vector(5 downto 0);
		Carry : IN std_logic;          
		AluResult : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_Alu: Alu PORT MAP(
		Crs1 => ,
		Crs2 => ,
		AluOp => ,
		Carry => ,
		AluResult => 
	);


