
-- VHDL Instantiation Created from source file WM.vhd -- 13:29:39 11/10/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT WM
	PORT(
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		rsd : IN std_logic_vector(4 downto 0);
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);
		cwp : IN std_logic;          
		ncwp : OUT std_logic;
		srs1 : OUT std_logic_vector(5 downto 0);
		srs2 : OUT std_logic_vector(5 downto 0);
		srd : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

	Inst_WM: WM PORT MAP(
		rs1 => ,
		rs2 => ,
		rsd => ,
		op => ,
		op3 => ,
		cwp => ,
		ncwp => ,
		srs1 => ,
		srs2 => ,
		srd => 
	);


