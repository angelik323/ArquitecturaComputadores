----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:06:24 10/03/2016 
-- Design Name: 
-- Module Name:    unidad_de_control - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.All;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity unidad_de_control is
    Port ( opcode : in  STD_LOGIC_VECTOR (5 downto 0);
           function1 : in  STD_LOGIC_VECTOR (5 downto 0);
           zero : in  STD_LOGIC;
           s : out  STD_LOGIC;
           rgdst : out  STD_LOGIC_VECTOR (1 downto 0);
           nPC : out  STD_LOGIC_VECTOR (1 downto 0);
           dataregwr : out  STD_LOGIC_VECTOR (1 downto 0);
           aluop : out  STD_LOGIC_VECTOR (3 downto 0);
           memorywrite : out  STD_LOGIC;
           alusrc : out  STD_LOGIC;
           regwrite : out  STD_LOGIC);
end unidad_de_control;

architecture Arq_Control of Control is

begin
process (Opcode,Function1,Zero);
begin

case Opcode is
		when "000000" =>
			case Function1 is
				when "100000" => --ADD
										S<='0';
										RegDst<="10";
										NextPc<="01";
										DataRegWr<="00";
										AluOp<="0000";
										MemWrite<='0';
										Alusrc<='0';
										RegWrite<='1';
							
				when "100010" => -- SUB
										S<='0';
										RegDst<="10";
										NextPc<="01";
										DataRegWr<="00";
										AluOp<="0001";
										MemWrite<='0';
										Alusrc<='0';
										RegWrite<='1';
										
				when "100100" => -- AND
										S<='0';
										RegDst<="10";
										NextPc<="01";
										DataRegWr<="00";
										AluOp<="0010";
										MemWrite<='0';
										Alusrc<='0';
										RegWrite<='1';
										
				when "100101" =>	-- OR
										S<='0';
										RegDst<="10";
										NextPc<="01";
										DataRegWr<="00";
										AluOp<="0011";
										MemWrite<='0';
										Alusrc<='0';
										RegWrite<='1';
										
				when "011010"=> 	--XOR	 
										S<='0';
										RegDst<="10";
										NextPc<="01";
										DataRegWr<="00";
										AluOp<="0100"; 
										MemWrite<='0';
										Alusrc<='0';
										RegWrite<='1';					
										
				when "100111" => -- NOR
										S<='0';
										RegDst<="10";
										NextPc<="01";
										DataRegWr<="00";
										AluOp<="0100";
										MemWrite<='0';
										Alusrc<='0';
										RegWrite<='1';
										
				when "101010" => --SLT
										S<='0';
										RegDst<="10";
										NextPc<="01";
										DataRegWr<="00";
										AluOp<="0110";
										MemWrite<='0';
										Alusrc<='0';
										RegWrite<='1';
										
				when "000000" => --SLL
										S<='0';
										RegDst<="10";
										NextPc<="01";
										DataRegWr<="00";
										AluOp<="0111";
										MemWrite<='0';
										Alusrc<='0';
										RegWrite<='1';
										
				when  "000010" =>	--	SRL
										S<='0';
										RegDst<="10";
										NextPc<="01";
										DataRegWr<="00";
										AluOp<="1000";
										MemWrite<='0';
										Alusrc<='0';
										RegWrite<='1';
										
				when "000100" => 	--JR
										S<='0';
										RegDst<="10";
										NextPc<="11";
										DataRegWr<="00";
										AluOp<="1001";
										MemWrite<='0';
										Alusrc<='0';
										RegWrite<='0';
										
				when others =>
										S<='0';
									   RegDst<="00"; 
									   NextPc<="01";
									   DataRegWr<="00";
									   AluOp<="1001"; --no importa por que no usa la alu
									   MemWrite<='0';
									   Alusrc<='0';
							      	RegWrite<='0';
				
										
										
										
				
				end case;
				
		when "001000" =>  ---ADDI
								S<='1';
								RegDst<="00";
								NextPc<="01";
								DataRegWr<="00";
								AluOp<="0000";
								MemWrite<='0';
								Alusrc<='1';
								RegWrite<='1'; 


								
			
		when "001100" => ---ANDI
								S<='0';
								RegDst<="00";
								NextPc<="01";
								DataRegWr<="00";
								AluOp<="0010";
								MemWrite<='0';
								Alusrc<='1';
								RegWrite<='1';
								
		when "001101" => ---ORI
								S<='0';
								RegDst<="00";
								NextPc<="01";
								DataRegWr<="00";
								AluOp<="0011";
								MemWrite<='0';
								Alusrc<='1';
								RegWrite<='1';	

		when "001110" => ---XORI 
								S<='0';
								RegDst<="00";
								NextPc<="01";
								DataRegWr <="00";
								AluOp<="0100";
								MemWrite<='0';
								Alusrc<='1';
								RegWrite<='1';
								
		when "001010"  => ---SLTI
								S<='1';
								RegDst<="00";
								NextPc<="01";
								DataRegWr <="00";
								AluOp<="0110";
								MemWrite<='0';
								Alusrc<='1';
								RegWrite<='1';
								
		when "100011" =>  --LW
								S<='1';
								RegDst<="00";
								NextPc<="01";
								DataRegWr<="01";
								AluOp<="0000"; --SUMA
								MemWrite<='0';
								Alusrc<='1';
								RegWrite<='1';	
								
								
		when "101011" => 	--SW 
								S<='1';
								RegDst<="00";
								NextPc<="01";
								DataRegWr<="01";
								AluOp<="0000"; --SUMA 
								MemWrite<='1';
								Alusrc<='1';
								RegWrite<='1'; 
				
		when "000100"	=>  --BEQ
								RegDst<="00";
								DataRegWr<="10";
								AluOp<="1001";
								MemWrite<='0';
								Alusrc<='0';
								RegWrite<='0'; 
								
								if(Zero='1') then
										S<='0';
										NextPc<="10";
								else 
										S<='0';
										NextPc<="01";
								end if;
								
		when "000101" => -- BNE
								RegDst<="00";
								DataRegWr<="10";
								AluOp<="1001";
								MemWrite<='0';
								Alusrc<='0';
								RegWrite<='0'; 
								
								if(Zero='0') then
										S<='0';
										NextPc<="10";
								else 
										S<='0';
										NextPc<="01";
								end if;
								
		when "000010" => --- J
								S<='0';
								RegDst<="10"; 
								NextPc<="00";
								DataRegWr<="00";
								AluOp<="1001"; --no importa por que no usa la alu
								MemWrite<='0';
								Alusrc<='0';
								RegWrite<='0';
								
		when "000011" => --JAL
								S<='0';
								RegDst<="01"; 
								NextPc<="00";
								DataRegWr<="10";
								AluOp<="1001"; --no importa por que no usa la alu
								MemWrite<='0';
								Alusrc<='0';
								RegWrite<='1';	
								
		when	others => 
								S<='0';
							   RegDst<="00"; 
								NextPc<="01";
								DataRegWr<="00";
								AluOp<="1001"; --no importa por que no usa la alu
								MemWrite<='0';
								Alusrc<='0';
								RegWrite<='0';
							
			end case;

end process;
end Arq_Control;

