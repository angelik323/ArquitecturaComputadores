
-- VHDL Instantiation Created from source file Mux.vhd -- 14:07:50 11/10/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Mux
	PORT(
		ContentRegister : IN std_logic_vector(31 downto 0);
		Immediate : IN std_logic_vector(31 downto 0);
		ControlSignal : IN std_logic;          
		MuxOut : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_Mux: Mux PORT MAP(
		ContentRegister => ,
		Immediate => ,
		ControlSignal => ,
		MuxOut => 
	);


