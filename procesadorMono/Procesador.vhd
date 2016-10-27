
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Procesador is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           Resultado : out  STD_LOGIC_VECTOR (31 downto 0));
end Procesador;

architecture Behavioral of Procesador is


COMPONENT registerFile
	PORT(
		regDestino : IN std_logic_vector(4 downto 0);
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		rst : IN std_logic;
		datatowrite : IN std_logic_vector(31 downto 0);          
		Crs1 : OUT std_logic_vector(31 downto 0);
		Crs2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
		COMPONENT nPC
	PORT(
		entradaNpc : IN std_logic_vector(31 downto 0);
		clk : IN std_logic;
		rst : IN std_logic;          
		salidaNpc : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	
		COMPONENT UC
	PORT(
		OP : IN std_logic_vector(1 downto 0);
		OP3 : IN std_logic_vector(5 downto 0);          
		ALUop : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
	
	
	
		COMPONENT IM
	PORT(
		entradaPC : IN std_logic_vector(31 downto 0);
		rst : IN std_logic;          
		salidaIM : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	
		COMPONENT ALU
	PORT(
		Crs1 : IN std_logic_vector(31 downto 0);
		Crs2 : IN std_logic_vector(31 downto 0);
		ALU_op : IN std_logic_vector(5 downto 0);          
		salida_Alu : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
		COMPONENT sumador
	PORT(
		entrada1 : IN std_logic_vector(31 downto 0);
		entrada2 : IN std_logic_vector(31 downto 0);          
		salidaSumador : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

signal salidaNpc,salidaSumador, salidaPC, salidaIM, salidaCrs1, salidaCrs2, salidaALU: std_logic_vector (31 downto 0);	
signal salidaUC : std_logic_vector (5 downto 0);

begin


		Inst_registerFile: registerFile PORT MAP(
		regDestino => salidaIM (29 downto 25),
		rs1 => salidaIM (18 downto 14),
		rs2 => salidaIM (4 downto 0),
		rst => reset,
		datatowrite => salidaALU,
		Crs1 => salidaCrs1,
		Crs2 => salidaCrs2
	);
	
	
		Inst_PC: nPC PORT MAP(
		entradaNpc => salidaNpc,
		clk => clk ,
		rst => reset,
		salidaNpc => salidaPC
	);
	
	
		Inst_nPC: nPC PORT MAP(
		entradaNpc => salidaSumador,
		clk => clk,
		rst => reset,
		salidaNpc => salidaNpc
	);
	

	Inst_UC: UC PORT MAP(
		OP => salidaIM (31 downto 30),
		OP3 => salidaIM (24 downto 19),
		ALUop => salidaUC
	);


	

	Inst_IM: IM PORT MAP(
		entradaPC => salidaPC,
		rst => reset,
		salidaIM => salidaIM
	);


	Inst_ALU: ALU PORT MAP(
		Crs1 => salidaCrs1,
		Crs2 => salidaCrs2,
		ALU_op => salidaUC,
		salida_Alu => salidaALU
	);
	
	
		Inst_sumador: sumador PORT MAP(
		entrada1 => x"00000001" ,
		entrada2 => salidaNpc,
		salidaSumador => salidaSumador
	);

Resultado <= salidaALU;

end Behavioral;

