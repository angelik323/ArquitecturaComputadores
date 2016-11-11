
-- VHDL Instantiation Created from source file ControlUnity.vhd -- 14:04:02 11/10/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT ControlUnity
	PORT(
		Op : IN std_logic_vector(1 downto 0);
		Op3 : IN std_logic_vector(5 downto 0);          
		AluOp : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

	Inst_ControlUnity: ControlUnity PORT MAP(
		Op => ,
		Op3 => ,
		AluOp => 
	);


