
-- VHDL Instantiation Created from source file sumador.vhd -- 13:02:33 10/18/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT sumador
	PORT(
		operador1 : IN std_logic_vector(31 downto 0);
		operador2 : IN std_logic_vector(31 downto 0);          
		resultado : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_sumador: sumador PORT MAP(
		operador1 => ,
		operador2 => ,
		resultado => 
	);


