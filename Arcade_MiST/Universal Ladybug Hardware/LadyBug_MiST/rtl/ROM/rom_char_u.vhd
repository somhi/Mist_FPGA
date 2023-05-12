library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity rom_char_u is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(11 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of rom_char_u is
	type rom is array(0 to  4095) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",
		X"E0",X"E0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"00",
		X"00",X"00",X"00",X"C0",X"C0",X"C0",X"C0",X"C0",X"01",X"01",X"00",X"00",X"00",X"00",X"00",X"00",
		X"1F",X"1F",X"00",X"C0",X"C0",X"C0",X"C0",X"C0",X"1F",X"1F",X"00",X"00",X"00",X"00",X"00",X"00",
		X"1F",X"1F",X"00",X"00",X"00",X"00",X"00",X"00",X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FF",X"FF",X"C0",X"00",X"00",X"00",X"00",X"00",X"FE",X"FE",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"C0",X"C0",X"E0",X"70",X"38",X"1C",X"0E",X"07",X"03",
		X"E0",X"E0",X"F0",X"38",X"1C",X"0E",X"07",X"03",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"C0",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",
		X"E0",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"01",X"03",X"07",X"0E",X"1C",X"38",X"70",
		X"E0",X"E0",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"03",X"07",X"0E",X"1C",X"38",X"F0",
		X"C0",X"C0",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"1F",X"1F",X"1F",X"1F",X"1E",X"00",X"1E",X"1E",X"1F",X"1F",X"1F",X"1F",X"00",
		X"C0",X"DE",X"1E",X"7E",X"7E",X"7E",X"7E",X"00",X"00",X"00",X"00",X"7E",X"7E",X"7E",X"7E",X"1E",
		X"00",X"1E",X"1E",X"1E",X"1E",X"1E",X"1E",X"1E",X"FF",X"FF",X"00",X"7F",X"7F",X"7F",X"7F",X"00",
		X"C0",X"DE",X"DE",X"DE",X"DE",X"DE",X"DE",X"DE",X"00",X"00",X"00",X"7F",X"7F",X"7F",X"7F",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"E0",X"C0",X"80",X"00",X"00",X"00",X"00",X"00",X"F0",X"58",X"70",X"F8",X"E0",X"00",X"00",X"00",
		X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"C1",X"C3",X"C1",X"C0",X"C0",X"C0",X"C0",X"C0",X"01",X"03",X"01",X"00",X"00",X"00",X"00",X"00",
		X"CF",X"CE",X"C6",X"C7",X"C1",X"C0",X"C0",X"C0",X"0F",X"0E",X"06",X"07",X"01",X"00",X"00",X"00",
		X"FF",X"FF",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",
		X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"C0",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FF",X"FF",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",
		X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"C0",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FF",X"FF",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",
		X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"C0",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FF",X"FF",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",
		X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"C0",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FF",X"FF",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",
		X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"C0",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FF",X"FF",X"C0",X"C0",X"C0",X"C0",X"C1",X"C3",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C1",X"C3",
		X"FF",X"FF",X"00",X"00",X"00",X"00",X"01",X"03",X"C0",X"C0",X"00",X"00",X"00",X"00",X"01",X"03",
		X"FF",X"FF",X"C0",X"C0",X"C1",X"C7",X"C6",X"CE",X"C0",X"C0",X"C0",X"C0",X"C1",X"C7",X"C6",X"CE",
		X"FF",X"FF",X"00",X"00",X"01",X"07",X"06",X"0E",X"C0",X"C0",X"00",X"00",X"01",X"07",X"06",X"0E",
		X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FF",X"FF",X"00",X"00",X"00",X"00",X"80",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"C0",
		X"FF",X"FF",X"00",X"00",X"E0",X"F8",X"70",X"58",X"00",X"00",X"00",X"00",X"E0",X"F8",X"70",X"58",
		X"7E",X"FC",X"FE",X"FF",X"FF",X"0F",X"0F",X"0F",X"1F",X"1F",X"3E",X"7E",X"FC",X"FC",X"F8",X"FC",
		X"3E",X"1F",X"0F",X"0F",X"0F",X"0F",X"0F",X"1F",X"00",X"00",X"00",X"00",X"01",X"03",X"0F",X"1F",
		X"3F",X"3E",X"7C",X"78",X"F8",X"F0",X"F0",X"F0",X"F0",X"F3",X"FF",X"FF",X"FF",X"FE",X"70",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"0F",X"7F",X"FF",X"FF",X"78",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"07",X"3F",X"FF",X"FF",X"FC",X"E0",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"01",X"01",X"03",X"0F",X"FF",X"FF",X"FF",X"7F",X"FF",X"FF",X"F8",X"F0",X"F0",X"F0",X"F0",
		X"F0",X"F0",X"F8",X"7C",X"7F",X"3F",X"1F",X"07",X"F0",X"F3",X"FF",X"FF",X"FF",X"FE",X"F0",X"80",
		X"00",X"00",X"00",X"00",X"03",X"1F",X"7F",X"FF",X"FE",X"70",X"00",X"00",X"00",X"00",X"00",X"00",
		X"78",X"FC",X"FE",X"FE",X"FF",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",
		X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"1F",X"FF",X"FF",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",
		X"0F",X"0F",X"1F",X"7F",X"FE",X"FC",X"F0",X"C0",X"60",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",
		X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"E0",X"E0",X"C0",X"C0",X"80",X"00",
		X"00",X"03",X"1F",X"FF",X"FF",X"FE",X"F0",X"80",X"00",X"03",X"1F",X"7F",X"FF",X"FE",X"70",X"00",
		X"80",X"E3",X"FF",X"FF",X"FF",X"3E",X"00",X"00",X"7F",X"FF",X"FF",X"F8",X"C0",X"00",X"00",X"00",
		X"77",X"CF",X"FF",X"78",X"00",X"00",X"00",X"00",X"3F",X"3E",X"7C",X"58",X"B8",X"B0",X"F0",X"F0",
		X"00",X"00",X"00",X"00",X"03",X"1F",X"67",X"DF",X"60",X"F0",X"D0",X"B0",X"B0",X"F0",X"F0",X"F0",
		X"00",X"03",X"1F",X"67",X"DF",X"FE",X"70",X"00",X"77",X"CF",X"FF",X"F8",X"F0",X"F0",X"F0",X"F0",
		X"22",X"7E",X"02",X"00",X"3C",X"42",X"3C",X"00",X"22",X"7E",X"02",X"00",X"74",X"52",X"4C",X"00",
		X"26",X"4A",X"32",X"00",X"3C",X"42",X"3C",X"00",X"26",X"4A",X"32",X"00",X"74",X"52",X"4C",X"00",
		X"44",X"52",X"6C",X"00",X"3C",X"42",X"3C",X"00",X"44",X"52",X"6C",X"00",X"74",X"52",X"4C",X"00",
		X"1C",X"24",X"7E",X"00",X"3C",X"42",X"3C",X"00",X"1C",X"24",X"7E",X"00",X"74",X"52",X"4C",X"00",
		X"74",X"52",X"4C",X"00",X"3C",X"42",X"3C",X"00",X"74",X"52",X"4C",X"00",X"74",X"52",X"4C",X"00",
		X"3C",X"52",X"4C",X"00",X"3C",X"42",X"3C",X"00",X"3C",X"52",X"4C",X"00",X"74",X"52",X"4C",X"00",
		X"60",X"40",X"7E",X"00",X"3C",X"42",X"3C",X"00",X"60",X"40",X"7E",X"00",X"74",X"52",X"4C",X"00",
		X"2C",X"52",X"2C",X"00",X"3C",X"42",X"3C",X"00",X"2C",X"52",X"2C",X"00",X"74",X"52",X"4C",X"00",
		X"32",X"4A",X"3C",X"00",X"3C",X"42",X"3C",X"00",X"32",X"4A",X"3C",X"00",X"74",X"52",X"4C",X"00",
		X"3C",X"42",X"3C",X"00",X"3C",X"42",X"3C",X"00",X"3C",X"42",X"3C",X"00",X"3C",X"42",X"3C",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"C0",X"F0",X"F8",X"F8",X"FC",X"FC",X"FC",
		X"FC",X"FC",X"F8",X"F0",X"20",X"00",X"00",X"00",X"00",X"03",X"0F",X"1F",X"1F",X"3F",X"3F",X"3F",
		X"3F",X"3F",X"1F",X"0F",X"04",X"00",X"00",X"00",X"A0",X"00",X"A0",X"00",X"00",X"00",X"00",X"00",
		X"04",X"6C",X"08",X"98",X"F0",X"C0",X"00",X"00",X"40",X"6F",X"21",X"33",X"1F",X"07",X"00",X"00",
		X"00",X"07",X"1F",X"33",X"21",X"6D",X"40",X"6E",X"00",X"C0",X"F0",X"98",X"08",X"EC",X"04",X"EC",
		X"04",X"6C",X"08",X"98",X"F0",X"C0",X"00",X"00",X"40",X"6F",X"21",X"33",X"1F",X"07",X"00",X"00",
		X"00",X"07",X"1F",X"33",X"21",X"6D",X"40",X"6E",X"00",X"C0",X"F0",X"98",X"08",X"EC",X"04",X"EC",
		X"00",X"C0",X"F0",X"98",X"08",X"EC",X"04",X"EC",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"03",
		X"00",X"00",X"00",X"00",X"01",X"07",X"06",X"0E",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"01",X"01",X"01",X"00",X"00",X"00",X"00",X"F0",X"F0",X"C0",X"80",
		X"00",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"01",X"01",X"3D",
		X"01",X"00",X"01",X"01",X"01",X"01",X"00",X"1F",X"00",X"00",X"00",X"80",X"C0",X"E0",X"F8",X"F8",
		X"7F",X"1E",X"7F",X"FF",X"FF",X"FF",X"FF",X"3F",X"3F",X"3E",X"3F",X"3D",X"01",X"01",X"00",X"00",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"00",X"C0",X"E0",X"C0",X"20",X"50",X"E0",X"50",
		X"0F",X"1E",X"38",X"7E",X"7F",X"FF",X"FF",X"7F",X"00",X"00",X"00",X"00",X"03",X"03",X"03",X"03",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"1F",X"00",X"00",X"A0",X"C0",X"E0",X"C0",X"00",X"00",X"00",X"00",
		X"7F",X"3E",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"38",X"7D",X"6D",X"C1",X"81",X"31",X"21",X"89",X"00",X"80",X"C0",X"E1",X"F3",X"7B",X"7B",X"39",
		X"3F",X"7F",X"7F",X"E1",X"C0",X"80",X"00",X"00",X"FC",X"FE",X"07",X"03",X"01",X"00",X"10",X"10",
		X"F8",X"FD",X"FF",X"0E",X"04",X"00",X"00",X"00",X"00",X"E1",X"FB",X"FF",X"1C",X"08",X"01",X"01",
		X"00",X"03",X"07",X"EF",X"FC",X"F0",X"C0",X"80",X"00",X"00",X"00",X"01",X"03",X"07",X"0F",X"0F",
		X"C9",X"51",X"C1",X"83",X"83",X"03",X"C7",X"DF",X"38",X"1C",X"1C",X"0D",X"08",X"18",X"F7",X"FF",
		X"10",X"20",X"20",X"30",X"10",X"FF",X"FF",X"01",X"30",X"20",X"30",X"10",X"E8",X"FF",X"3F",X"00",
		X"80",X"80",X"80",X"FF",X"FF",X"01",X"06",X"0C",X"01",X"F0",X"FF",X"1F",X"60",X"C0",X"80",X"30",
		X"8F",X"8F",X"C1",X"C0",X"E0",X"F8",X"7C",X"0E",X"07",X"03",X"01",X"01",X"00",X"00",X"00",X"00",
		X"1F",X"0F",X"1F",X"3D",X"E1",X"C1",X"C1",X"A1",X"7C",X"30",X"78",X"7C",X"FC",X"F8",X"F0",X"E0",
		X"02",X"1E",X"10",X"00",X"00",X"83",X"FF",X"FF",X"00",X"00",X"00",X"04",X"8E",X"FF",X"FF",X"7B",
		X"08",X"09",X"83",X"FF",X"FF",X"FD",X"C1",X"00",X"F8",X"FC",X"DF",X"0F",X"07",X"0F",X"3F",X"74",
		X"07",X"03",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"81",X"9B",X"13",X"B3",X"83",X"87",X"8F",X"1F",X"F1",X"FB",X"3B",X"39",X"1C",X"0D",X"08",X"E8",
		X"FF",X"FF",X"3E",X"00",X"00",X"00",X"00",X"FF",X"01",X"00",X"08",X"08",X"08",X"88",X"FC",X"07",
		X"00",X"00",X"04",X"FC",X"87",X"81",X"00",X"40",X"E0",X"C0",X"80",X"0F",X"00",X"01",X"CB",X"F8",
		X"01",X"03",X"03",X"01",X"07",X"07",X"03",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"DE",X"DC",X"10",X"07",X"1D",X"39",X"71",X"61",X"FF",X"1F",X"18",X"38",X"78",X"F0",X"E0",X"F0",
		X"20",X"20",X"00",X"10",X"38",X"FD",X"EF",X"07",X"00",X"08",X"1C",X"FE",X"EF",X"03",X"C1",X"40",
		X"C0",X"F8",X"7C",X"3F",X"7D",X"F0",X"A0",X"00",X"7C",X"0F",X"06",X"00",X"00",X"00",X"03",X"07",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"25",X"05",X"09",X"03",X"F7",X"07",X"03",X"00",X"F8",X"3C",X"18",X"10",X"FF",X"10",X"38",X"F0",
		X"61",X"30",X"18",X"88",X"FF",X"04",X"08",X"18",X"60",X"A0",X"F0",X"1F",X"20",X"01",X"99",X"FC",
		X"00",X"0F",X"02",X"06",X"E4",X"F1",X"3F",X"1D",X"0E",X"1C",X"0C",X"0E",X"07",X"01",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"0C",X"18",X"38",X"70",X"F0",X"F0",X"E0",X"E0",X"DE",X"EC",X"D8",X"E0",X"C0",X"C1",X"83",X"07",
		X"F8",X"30",X"F8",X"3F",X"F8",X"30",X"F8",X"3F",X"00",X"60",X"68",X"0C",X"68",X"00",X"B8",X"7C",
		X"00",X"50",X"17",X"C7",X"D7",X"00",X"FF",X"FF",X"00",X"00",X"38",X"83",X"3B",X"00",X"2F",X"1F",
		X"00",X"00",X"00",X"1B",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"20",X"20",X"0F",X"1F",X"3F",X"7F",X"F1",X"F1",X"80",X"80",
		X"FE",X"3C",X"F8",X"30",X"E0",X"01",X"83",X"07",X"B8",X"7C",X"38",X"1C",X"08",X"0C",X"08",X"0C",
		X"FF",X"00",X"00",X"01",X"01",X"01",X"01",X"01",X"2F",X"1F",X"2E",X"1C",X"28",X"18",X"28",X"18",
		X"00",X"00",X"00",X"00",X"00",X"01",X"03",X"07",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"20",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"80",X"F3",X"F3",X"FF",X"7F",X"3F",X"1F",X"0F",
		X"07",X"83",X"01",X"E0",X"30",X"F8",X"3C",X"FE",X"08",X"0C",X"08",X"0C",X"18",X"3C",X"78",X"BC",
		X"01",X"01",X"01",X"01",X"01",X"00",X"00",X"FF",X"28",X"18",X"28",X"18",X"2C",X"1E",X"2F",X"1F",
		X"07",X"03",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"E0",X"E0",X"F0",X"F0",X"70",X"38",X"18",X"0C",X"07",X"83",X"C1",X"C0",X"E0",X"D8",X"EC",X"DE",
		X"3F",X"F8",X"30",X"F8",X"3F",X"F8",X"30",X"F8",X"78",X"BC",X"00",X"6C",X"08",X"6C",X"60",X"00",
		X"FF",X"FF",X"00",X"D7",X"C7",X"17",X"50",X"00",X"2F",X"1F",X"00",X"3B",X"83",X"38",X"00",X"00",
		X"00",X"00",X"00",X"00",X"1B",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"F1",X"12",X"11",X"12",X"11",X"12",X"11",X"00",X"FF",X"7C",X"E0",X"40",X"C0",X"40",X"C0",
		X"00",X"D8",X"B4",X"D8",X"B4",X"D8",X"B4",X"D8",X"00",X"FF",X"01",X"01",X"01",X"01",X"01",X"FF",
		X"00",X"0F",X"96",X"0C",X"94",X"0C",X"96",X"0F",X"00",X"FD",X"06",X"05",X"06",X"05",X"06",X"05",
		X"00",X"7F",X"B0",X"60",X"A0",X"60",X"A0",X"70",X"00",X"07",X"00",X"00",X"00",X"00",X"07",X"1F",
		X"12",X"11",X"12",X"11",X"F2",X"00",X"00",X"00",X"40",X"C0",X"60",X"FC",X"7F",X"00",X"00",X"00",
		X"B4",X"D8",X"B4",X"D8",X"B4",X"00",X"00",X"00",X"01",X"01",X"01",X"01",X"01",X"FC",X"C0",X"00",
		X"96",X"0C",X"94",X"0C",X"82",X"03",X"83",X"06",X"FE",X"05",X"06",X"05",X"06",X"05",X"06",X"FD",
		X"BF",X"70",X"A0",X"60",X"A0",X"60",X"B0",X"7F",X"07",X"00",X"00",X"00",X"00",X"07",X"01",X"00",
		X"00",X"00",X"00",X"F2",X"11",X"12",X"11",X"12",X"00",X"00",X"00",X"7F",X"FC",X"60",X"C0",X"40",
		X"00",X"00",X"00",X"B4",X"D8",X"B4",X"D8",X"B4",X"00",X"C0",X"FC",X"01",X"01",X"01",X"01",X"01",
		X"06",X"83",X"03",X"82",X"0C",X"94",X"0C",X"96",X"FD",X"06",X"05",X"06",X"05",X"06",X"05",X"FE",
		X"7F",X"B0",X"60",X"A0",X"60",X"A0",X"70",X"BF",X"00",X"01",X"07",X"00",X"00",X"00",X"00",X"07",
		X"11",X"12",X"11",X"12",X"11",X"12",X"F1",X"00",X"C0",X"40",X"C0",X"40",X"E0",X"7C",X"FF",X"00",
		X"D8",X"B4",X"D8",X"B4",X"D8",X"B4",X"D8",X"00",X"FF",X"01",X"01",X"01",X"01",X"01",X"FF",X"00",
		X"0F",X"96",X"0C",X"94",X"0C",X"96",X"0F",X"00",X"05",X"06",X"05",X"06",X"05",X"06",X"FD",X"00",
		X"70",X"A0",X"60",X"A0",X"60",X"B0",X"7F",X"00",X"1F",X"07",X"00",X"00",X"00",X"00",X"07",X"00",
		X"01",X"01",X"05",X"05",X"15",X"15",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",
		X"05",X"5A",X"A5",X"55",X"5A",X"A5",X"55",X"5A",X"A5",X"55",X"5A",X"A5",X"55",X"5A",X"A5",X"54",
		X"59",X"A5",X"55",X"45",X"95",X"55",X"55",X"55",X"55",X"55",X"55",X"95",X"45",X"55",X"A1",X"59",
		X"54",X"A5",X"5A",X"55",X"A5",X"5A",X"55",X"A5",X"5A",X"55",X"A5",X"5A",X"55",X"A5",X"5A",X"05",
		X"55",X"55",X"15",X"15",X"05",X"05",X"01",X"01",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"03",X"07",X"F7",X"03",X"09",X"05",X"15",X"F0",X"38",X"10",X"FF",X"10",X"18",X"3C",X"F8",
		X"18",X"08",X"04",X"FF",X"88",X"18",X"30",X"61",X"FC",X"99",X"01",X"20",X"1F",X"F0",X"A0",X"60",
		X"1D",X"3F",X"F1",X"E4",X"06",X"02",X"0F",X"00",X"00",X"00",X"01",X"07",X"0E",X"0C",X"1C",X"0E",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"61",X"71",X"39",X"1D",X"07",X"10",X"DC",X"DE",X"F0",X"E0",X"F0",X"78",X"38",X"18",X"1F",X"FF",
		X"07",X"EF",X"FD",X"38",X"10",X"00",X"20",X"20",X"40",X"C1",X"03",X"EF",X"FE",X"1C",X"08",X"00",
		X"00",X"A0",X"F0",X"7D",X"3F",X"7C",X"F8",X"C0",X"07",X"03",X"00",X"00",X"00",X"06",X"0F",X"7C",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"1F",X"8F",X"87",X"83",X"B3",X"13",X"9B",X"81",X"E8",X"08",X"0D",X"1C",X"39",X"3B",X"FB",X"F1",
		X"FF",X"00",X"00",X"00",X"00",X"3E",X"FF",X"FF",X"07",X"FC",X"88",X"08",X"08",X"08",X"00",X"01",
		X"48",X"0E",X"81",X"87",X"FC",X"04",X"08",X"08",X"F8",X"CB",X"01",X"00",X"0F",X"80",X"C0",X"E0",
		X"00",X"03",X"07",X"07",X"01",X"03",X"03",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"A1",X"C1",X"C1",X"E1",X"3D",X"1F",X"0F",X"1F",X"E0",X"F1",X"F9",X"FC",X"7C",X"78",X"30",X"7C",
		X"FF",X"FF",X"83",X"00",X"00",X"10",X"1E",X"02",X"7B",X"FF",X"FF",X"8E",X"04",X"00",X"00",X"00",
		X"00",X"C1",X"FD",X"FF",X"FF",X"83",X"09",X"08",X"74",X"3F",X"0F",X"07",X"0F",X"DF",X"FC",X"F8",
		X"00",X"00",X"00",X"00",X"00",X"01",X"03",X"07",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"DF",X"C7",X"03",X"83",X"83",X"C1",X"51",X"C9",X"FF",X"F7",X"18",X"08",X"0D",X"1C",X"1C",X"38",
		X"01",X"FF",X"FF",X"10",X"30",X"20",X"20",X"10",X"00",X"3F",X"FF",X"E8",X"10",X"30",X"20",X"30",
		X"0C",X"06",X"01",X"FF",X"FF",X"80",X"80",X"80",X"30",X"80",X"C0",X"60",X"1F",X"FF",X"F0",X"01",
		X"0E",X"7C",X"F8",X"E0",X"C0",X"C1",X"8F",X"8F",X"00",X"00",X"00",X"00",X"01",X"01",X"03",X"07",
		X"89",X"21",X"31",X"81",X"C1",X"6D",X"7D",X"38",X"39",X"7B",X"7B",X"F3",X"E1",X"C0",X"80",X"00",
		X"00",X"00",X"80",X"C0",X"E1",X"7F",X"7F",X"3F",X"10",X"10",X"00",X"01",X"03",X"07",X"FE",X"FC",
		X"00",X"00",X"00",X"04",X"0E",X"FF",X"FD",X"F8",X"01",X"01",X"08",X"1C",X"FF",X"FB",X"E1",X"00",
		X"80",X"C0",X"F0",X"FC",X"EF",X"07",X"03",X"00",X"0F",X"0F",X"07",X"03",X"01",X"00",X"00",X"00",
		X"1B",X"25",X"25",X"1B",X"1B",X"25",X"25",X"1B",X"00",X"03",X"03",X"00",X"23",X"00",X"03",X"03",
		X"00",X"00",X"E6",X"57",X"89",X"FE",X"10",X"E0",X"00",X"00",X"01",X"06",X"08",X"FF",X"21",X"C0",
		X"00",X"00",X"00",X"00",X"00",X"01",X"02",X"01",X"00",X"00",X"00",X"F0",X"10",X"10",X"18",X"08",
		X"00",X"00",X"00",X"3F",X"60",X"E0",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"28",X"28",X"F8",X"00",X"00",X"00",X"00",X"00",X"20",X"00",X"0F",X"18",X"38",X"30",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"F0",X"10",X"10",X"18",X"08",X"28",X"28",X"F8",
		X"3F",X"60",X"E0",X"C0",X"00",X"20",X"00",X"0F",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"FC",X"14",X"16",X"02",X"18",X"38",X"30",X"00",X"07",X"0C",X"1C",X"18",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"02",X"FE",X"02",X"03",X"05",X"05",X"FF",X"00",
		X"00",X"07",X"0C",X"1C",X"18",X"00",X"01",X"03",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"C0",X"C0",X"80",X"00",X"00",X"07",X"06",X"00",X"00",X"01",X"01",X"FF",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"70",X"90",X"F8",X"00",X"00",X"C0",X"C0",X"00",X"4C",X"94",X"65",X"00",X"00",X"00",X"01",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"00",X"00",X"00",X"C0",X"C0",X"80",X"00",
		X"01",X"FF",X"00",X"00",X"00",X"01",X"01",X"FF",X"00",X"03",X"02",X"02",X"02",X"02",X"02",X"03",
		X"00",X"FC",X"14",X"14",X"0C",X"08",X"F8",X"08",X"00",X"07",X"0C",X"1C",X"18",X"00",X"3F",X"60",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"18",X"50",X"50",X"F0",X"00",X"00",X"00",X"00",
		X"E0",X"C0",X"00",X"0F",X"18",X"38",X"B0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",
		X"00",X"00",X"00",X"00",X"80",X"80",X"80",X"00",X"00",X"00",X"00",X"00",X"1F",X"10",X"1C",X"0D",
		X"02",X"02",X"04",X"04",X"04",X"04",X"04",X"04",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"10",X"A8",X"28",X"28",X"10",X"00",X"02",X"02",X"01",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
