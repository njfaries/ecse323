-- converts seconds to days
-- entity name: gn35_Seconds_To_Days
--
-- Copyright (C) 2014 Nathaniel Faries, Kornpat Choy
-- Version 1.0
-- Author: Nathaniel Faries, Kornpat Choy; nathaniel.faries@mail.mcgill.ca, kornpat.choy@mail.mcgill.ca
-- Date: 22012014

-- Imports all the libraries that we need
library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity g35_Seconds_to_Days is 
	port (seconds 		: in unsigned(16 downto 0);
		  day_fraction 	: out unsigned(39 downto 0) );
end g35_Seconds_to_Days;

architecture behavior of g35_Seconds_to_Days is
signal  adder1	: unsigned(18 downto 0);
signal	adder2	: unsigned(22 downto 0);
signal	adder3	: unsigned(25 downto 0);
signal	adder4	: unsigned(26 downto 0);
signal	adder5	: unsigned(27 downto 0);
signal	adder6	: unsigned(29 downto 0);
signal	adder7	: unsigned(33 downto 0);
signal	adder8	: unsigned(38 downto 0);
signal	adder9	: unsigned(39 downto 0);
begin
		adder1 <= seconds + (seconds & "00");
		adder2 <= adder1 + (seconds & "000000");
		adder3 <= adder2 + (seconds & "000000000");		
		adder4 <= adder3 + (seconds & "0000000000");		
		adder5 <= adder4 + (seconds & "00000000000");		
		adder6 <= adder5 + (seconds & "0000000000000");		
		adder7 <= adder6 + (seconds & "00000000000000000");		
		adder8 <= adder7 + (seconds & "0000000000000000000000");		
		adder9 <= adder8 + (seconds & "00000000000000000000000");	
		day_fraction <= adder9;	
end behavior;
		
