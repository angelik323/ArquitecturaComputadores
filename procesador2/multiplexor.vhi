
-- VHDL Instantiation Created from source file multiplexor.vhd -- 16:09:24 11/01/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT multiplexor
	PORT(
		CRS2 : IN std_logic_vector(31 downto 0);
		inmediato : IN std_logic;
		salidaSEU : IN std_logic_vector(31 downto 0);          
		resultado : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_multiplexor: multiplexor PORT MAP(
		CRS2 => ,
		inmediato => ,
		salidaSEU => ,
		resultado => 
	);


