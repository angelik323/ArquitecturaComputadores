
-- VHDL Instantiation Created from source file SignExtensionUnit.vhd -- 13:40:55 11/10/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT SignExtensionUnit
	PORT(
		Imm13 : IN std_logic_vector(12 downto 0);          
		Sign_Ext : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_SignExtensionUnit: SignExtensionUnit PORT MAP(
		Imm13 => ,
		Sign_Ext => 
	);


