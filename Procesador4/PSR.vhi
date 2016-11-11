
-- VHDL Instantiation Created from source file PSR.vhd -- 13:58:48 11/10/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT PSR
	PORT(
		nzvc : IN std_logic_vector(3 downto 0);
		clk : IN std_logic;
		rst : IN std_logic;
		ncwp : IN std_logic;          
		cwp : OUT std_logic;
		Carry : OUT std_logic
		);
	END COMPONENT;

	Inst_PSR: PSR PORT MAP(
		nzvc => ,
		clk => ,
		rst => ,
		ncwp => ,
		cwp => ,
		Carry => 
	);


