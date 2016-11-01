----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:08:34 11/01/2016 
-- Design Name: 
-- Module Name:    procesador2 - Behavioral 
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
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           resultado : out  STD_LOGIC_VECTOR (31 downto 0));
end procesador2;

architecture Behavioral of Procesador2 is


COMPONENT nPC
	PORT(
		entradaNpc : IN std_logic_vector(31 downto 0);
		clk : IN std_logic;
		rst : IN std_logic;          
		salidaNpc : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

COMPONENT ALU
	PORT(
		A : IN std_logic_vector(31 downto 0);
		B : IN std_logic_vector(31 downto 0);
		ALUOP : IN std_logic_vector(5 downto 0);          
		ALUResult : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT ExtSign
	PORT(
		Ext_in : IN std_logic_vector(12 downto 0);          
		Ext_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT instructionMemory
	PORT(
		address : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		outInstruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT multiplexor
	PORT(
		CRS2 : IN std_logic_vector(31 downto 0);
		inmediato : IN std_logic;
		salidaSEU : IN std_logic_vector(31 downto 0);          
		resultado : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	
COMPONENT ProgramCounter
	PORT(
		PC_in : IN std_logic_vector(31 downto 0);
		rst : IN std_logic;
		clk : IN std_logic;          
		PC_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT Sumador
	PORT(
		A : IN std_logic_vector(31 downto 0);
		B : IN std_logic_vector(31 downto 0);          
		C : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT RF
	PORT(
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		rd : IN std_logic_vector(4 downto 0);
		rst : IN std_logic;
		DataWrite : IN std_logic_vector(31 downto 0);          
		Crs1 : OUT std_logic_vector(31 downto 0);
		Crs2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT UC
	PORT(
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);          
		ALUOP : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

signal snpc,ssumador,spc,sins,scrs1,scrs2,smux,ses,Resultado,salidaNpc : std_logic_vector(31 downto 0);
signal scu : std_logic_vector(5 downto 0);

begin


Inst_nPC: nPC PORT MAP(
		entradaNpc => ssumador,
		clk => clk,
		rst => reset,
		salidaNpc => salidaNpc
	);
	

Inst_ALU: ALU PORT MAP(
		A => scrs1,
		B => smux,
		ALUOP => scu,
		ALUResult => Resultado
	);

Inst_ExtSign: ExtSign PORT MAP(
		Ext_in => sins(12 downto 0),
		Ext_out => ses
	);


Inst_multiplexor: multiplexor PORT MAP(
		A => scrs2,
		B => ses,
		selector => sins(13),
		mux_out => smux
	);


	
Inst_ProgramCounter: ProgramCounter PORT MAP(
		PC_in => snpc,
		rst => reset,
		clk => clk,
		PC_out => spc
	);

Inst_NProgramCounter: ProgramCounter PORT MAP(
		PC_in => ssumador,
		rst => reset,
		clk => clk,
		PC_out => snpc
	);
	
Inst_Sumador: Sumador PORT MAP(
		A => x"00000001",
		B => snpc,
		C => ssumador
	);
	
Inst_instructionMemory: instructionMemory PORT MAP(
		address => spc,
		reset => reset,
		outInstruction => sins
	);
	
Inst_RF: RF PORT MAP(
		rs1 => sins(18 downto 14),
		rs2 => sins(4 downto 0),
		rd => sins(29 downto 25),
		rst => reset,
		DataWrite => Resultado,
		Crs1 => scrs1,
		Crs2 => scrs2
	);
	
Inst_UC: UC PORT MAP(
		op => sins(31 downto 30),
		op3 => sins(24 downto 19),
		ALUOP => scu
	);
	
Result<=Resultado;
end Behavioral;