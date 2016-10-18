
-- VHDL Instantiation Created from source file registerFile.vhd -- 13:58:02 10/18/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT registerFile
	PORT(
		regSource1 : IN std_logic_vector(4 downto 0);
		regSource2 : IN std_logic_vector(4 downto 0);
		dataWrite : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;
		regDestino : IN std_logic_vector(4 downto 0);          
		contRegSource1 : OUT std_logic_vector(31 downto 0);
		contRegSource2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_registerFile: registerFile PORT MAP(
		regSource1 => ,
		regSource2 => ,
		dataWrite => ,
		reset => ,
		regDestino => ,
		contRegSource1 => ,
		contRegSource2 => 
	);


