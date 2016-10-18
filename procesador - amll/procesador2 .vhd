----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:15:37 10/18/2016 
-- Design Name: 
-- Module Name:    procesador2 - arq_procesador2 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity procesador2 is
    Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           resultadoProcesador : out  STD_LOGIC_VECTOR (31 downto 0));
end procesador2;

architecture arq_procesador2 of procesador2 is

	COMPONENT sumador
	PORT(
		operador1 : IN std_logic_vector(31 downto 0);
		operador2 : IN std_logic_vector(31 downto 0);          
		resultado : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

COMPONENT nPC
	PORT(
		direccion : IN std_logic_vector(31 downto 0);
		clk : IN std_logic;
		rst : IN std_logic;          
		direccionSalida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT memoriaInstrucciones
	PORT(
		direccion : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		instruccion : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT unidadControl
	PORT(
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);          
		salida : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
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

	COMPONENT mux
	PORT(
		i : IN std_logic;
		dato_seu : IN std_logic_vector(31 downto 0);
		conReg2 : IN std_logic_vector(31 downto 0);          
		salidaMux : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT seu
	PORT(
		inmediato13bits : IN std_logic_vector(12 downto 0);          
		salidaInmediato : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
		COMPONENT alu
	PORT(
		operando1 : IN std_logic_vector(31 downto 0);
		operando2 : IN std_logic_vector(31 downto 0);
		alu_op : IN std_logic_vector(5 downto 0);          
		salida_Alu : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	
signal sumadorToNPC, npcToPC, pcToIM, imToURS, aluResult, rfToAlu1, rfToMUX, seuToMUX, muxToALU :STD_LOGIC_VECTOR (31 downto 0);
signal aluop1: STD_LOGIC_VECTOR (5 downto 0);
begin

Inst_sumador: sumador PORT MAP(
		operador1 => X"00011001",
		operador2 => npcToPC,
		resultado => sumadorToNPC
	);


Inst_nPC: nPC PORT MAP(
		direccion => sumadorToNPC,
		clk => clk,
		rst => rst,
		direccionSalida => npcToPC 
	);
	

Inst_PC: nPC PORT MAP(
		direccion => sumadorToNPC,
		clk => clk,
		rst => rst,
		direccionSalida => pcToIM 
	); 
	
Inst_memoriaInstrucciones: memoriaInstrucciones PORT MAP(
		direccion => pcToIM ,
		instruccion => imToURS,
		reset => reset
	);	
	
Inst_unidadControl: unidadControl PORT MAP(
		op => imToURS (31 downto 30),
		op3 => imToURS (24 downto 19),
		salida => aluop1 
	);
	
Inst_registerFile: registerFile PORT MAP(
		regSource1 => imToURS (18 downto 14),
		regSource2 => imToURS (4 downto 0),
		dataWrite => aluResult,
		reset => reset,
		regDestino => imToURS (29 downto 25),
		contRegSource1 => rfToAlu1,
		contRegSource2 => rfToMUX
	);

	Inst_mux: mux PORT MAP(
		i => imToURS(13),
		dato_seu => seuToMUX,
		conReg2 => rfToMUX,
		salidaMux => muxToALU
	);	
	
		Inst_seu: seu PORT MAP(
		inmediato13bits => imToURS (12 downto 0),
		salidaInmediato => seuToMUX
	);

	Inst_alu: alu PORT MAP(
		operando1 => rfToAlu1,
		operando2 => muxToALU,
		alu_op => aluop1,
		salida_Alu => aluResult
	);
	
	resultadoProcesador<=aluResult;
	
end arq_procesador2;

