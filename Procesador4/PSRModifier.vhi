
-- VHDL Instantiation Created from source file PSRModifier.vhd -- 14:13:31 11/10/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT PSRModifier
	PORT(
		aluResult : IN std_logic_vector(31 downto 0);
		aluOp : IN std_logic_vector(5 downto 0);
		operando1 : IN std_logic;
		reset : IN std_logic;
		operando2 : IN std_logic;          
		nzvc : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_PSRModifier: PSRModifier PORT MAP(
		aluResult => ,
		aluOp => ,
		operando1 => ,
		reset => ,
		operando2 => ,
		nzvc => 
	);


