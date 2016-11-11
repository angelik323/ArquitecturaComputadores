
-- VHDL Instantiation Created from source file Adder.vhd -- 15:50:52 11/09/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Adder
	PORT(
		AddIn : IN std_logic_vector(31 downto 0);
		Increment : IN std_logic_vector(31 downto 0);          
		AddOut : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_Adder: Adder PORT MAP(
		AddIn => ,
		Increment => ,
		AddOut => 
	);


