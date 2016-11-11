
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Procesador_3 is
    Port ( Clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           Alu_Result : out  STD_LOGIC_VECTOR (31 downto 0));
end Procesador_3;

architecture Behavioral of Procesador_3 is

	COMPONENT ProgramCounter
	PORT(
		Pcin : IN std_logic_vector(31 downto 0);
		clk : IN std_logic;
		rst : IN std_logic;          
		Pcout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Adder
	PORT(
		AddIn : IN std_logic_vector(31 downto 0);
		Increment : IN std_logic_vector(31 downto 0);          
		AddOut : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT InstructionMemory
	PORT(
		Address : IN std_logic_vector(31 downto 0);
		Reset : IN std_logic;          
		OutInstruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	
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
	
	
	COMPONENT SignExtensionUnit
	PORT(
		Imm13 : IN std_logic_vector(12 downto 0);          
		Sign_Ext : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	
		COMPONENT RegisterFile
	PORT(
		Rs1 : IN std_logic_vector(5 downto 0);
		Rs2 : IN std_logic_vector(5 downto 0);
		Rsd : IN std_logic_vector(5 downto 0);
		DataToWrite : IN std_logic_vector(31 downto 0);
		rst : IN std_logic;          
		Crs1 : OUT std_logic_vector(31 downto 0);
		Crs2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	
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
	
	
	
	COMPONENT ControlUnity
	PORT(
		Op : IN std_logic_vector(1 downto 0);
		Op3 : IN std_logic_vector(5 downto 0);          
		AluOp : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
	
	COMPONENT Mux
	PORT(
		ContentRegister : IN std_logic_vector(31 downto 0);
		Immediate : IN std_logic_vector(31 downto 0);
		ControlSignal : IN std_logic;          
		MuxOut : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	
	COMPONENT PSRModifier
	PORT(
		aluResult : IN std_logic_vector(31 downto 0);
		aluOp : IN std_logic_vector(5 downto 0);
		operando1 : IN std_logic;
		reset : IN std_logic;
		operando2 : IN std_logic;          
		nzvc : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	
	
		COMPONENT Alu
	PORT(
		Crs1 : IN std_logic_vector(31 downto 0);
		Crs2 : IN std_logic_vector(31 downto 0);
		AluOp : IN std_logic_vector(5 downto 0);
		Carry : IN std_logic;          
		AluResult : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;



	signal snpc,ss,spc,sim,sSing_ext,salu,scrs1,scrs2,smux: std_logic_vector(31 downto 0);
	signal snRS1,snRS2,snRD,s_aluop: std_logic_vector(5 downto 0);
	signal scwp_psr,sncwp_wm,sCarry: std_logic;
	signal s_nzvc: std_logic_vector(3 downto 0); 
	
	
	
	
begin

	Inst_ProgramCounter: ProgramCounter PORT MAP(
			Pcin => snpc,
			clk => clk,
			rst => rst,
			Pcout => spc
		);
		
	Inst_NProgramCounter: ProgramCounter PORT MAP(
		Pcin => ss,
		clk => clk,
		rst => rst,
		Pcout => snpc
	);
	
	Inst_Adder: Adder PORT MAP(
		AddIn => snpc,
		Increment => x"00000001",
		AddOut => ss
	);
	
	Inst_InstructionMemory: InstructionMemory PORT MAP(
		Address => spc,
		Reset => rst,
		OutInstruction =>sim 
	);
	
	
		Inst_WM: WM PORT MAP(
		rs1 => sim(18 downto 14),
		rs2 => sim(4 downto 0),
		rsd => sim(29 downto 25),
		op => sim(31 downto 30),
		op3 => sim(24 downto 19),
		cwp => scwp_psr,
		ncwp => sncwp_wm,
		srs1 => snRS1,
		srs2 => snRS2,
		srd => snRD
	);
	
	
		Inst_SignExtensionUnit: SignExtensionUnit PORT MAP(
		Imm13 => sim(12 downto 0),
		Sign_Ext => sSing_ext
	);


	Inst_RegisterFile: RegisterFile PORT MAP(
		Rs1 => snRS1,
		Rs2 => snRS2,
		Rsd => snRD,
		DataToWrite => salu,
		Crs1 => scrs1,
		Crs2 => scrs2,
		rst => rst
	);
	
	
	Inst_PSR: PSR PORT MAP(
		nzvc => s_nzvc,
		clk => clk,
		rst => rst,
		ncwp => sncwp_wm,
		cwp => scwp_psr,
		Carry => sCarry
	);


	Inst_ControlUnity: ControlUnity PORT MAP(
		Op => sim(31 downto 30),
		Op3 => sim(24 downto 19),
		AluOp => s_aluop 
	);
	
	
		Inst_Mux: Mux PORT MAP(
		ContentRegister => scrs2,
		Immediate => sSing_ext,
		ControlSignal => sim(13),
		MuxOut => smux
	);
	
	
		Inst_PSRModifier: PSRModifier PORT MAP(
		aluResult => salu,
		aluOp => s_aluop,
		operando1 => scrs1(31),
		reset => rst,
		operando2 => smux(31),
		nzvc => s_nzvc
	);
	
	
		Inst_Alu: Alu PORT MAP(
		Crs1 => scrs1,
		Crs2 => smux,
		AluOp => s_aluop,
		Carry => sCarry,
		AluResult => salu
	);

Alu_Result <= salu;

end Behavioral;

