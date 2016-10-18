
-- VHDL Instantiation Created from source file mux.vhd -- 14:30:42 10/18/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT mux
	PORT(
		i : IN std_logic;
		dato_seu : IN std_logic_vector(31 downto 0);
		conReg2 : IN std_logic_vector(31 downto 0);          
		salidaMux : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_mux: mux PORT MAP(
		i => ,
		dato_seu => ,
		conReg2 => ,
		salidaMux => 
	);


