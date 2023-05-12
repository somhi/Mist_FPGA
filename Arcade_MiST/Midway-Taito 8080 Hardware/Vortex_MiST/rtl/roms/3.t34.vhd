library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity rom3t34 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(10 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of rom3t34 is
	type rom is array(0 to  2047) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"10",X"10",X"10",X"42",X"10",X"74",X"10",X"A6",X"0F",X"10",X"0F",X"42",X"0F",X"74",X"0F",X"A6",
		X"E3",X"F0",X"07",X"E3",X"FF",X"07",X"E0",X"E0",X"30",X"30",X"7F",X"7F",X"06",X"06",X"F0",X"FF",
		X"70",X"2A",X"3E",X"12",X"86",X"00",X"CA",X"A7",X"C1",X"C1",X"03",X"03",X"FF",X"FF",X"E5",X"F5",
		X"C2",X"C3",X"16",X"41",X"F1",X"E1",X"DC",X"C3",X"12",X"36",X"C3",X"23",X"12",X"2D",X"FE",X"7D",
		X"00",X"FF",X"1F",X"00",X"00",X"E0",X"FF",X"03",X"FF",X"13",X"00",X"00",X"F0",X"1E",X"01",X"00",
		X"19",X"00",X"00",X"60",X"FF",X"06",X"00",X"00",X"00",X"80",X"60",X"19",X"06",X"00",X"80",X"FF",
		X"00",X"80",X"FF",X"01",X"FF",X"FF",X"FF",X"FF",X"C0",X"0F",X"03",X"00",X"00",X"FF",X"06",X"00",
		X"00",X"FF",X"18",X"00",X"FF",X"3C",X"00",X"00",X"40",X"8E",X"FF",X"FF",X"00",X"00",X"18",X"18",
		X"00",X"00",X"66",X"66",X"00",X"FF",X"66",X"00",X"7E",X"3C",X"00",X"FF",X"7E",X"00",X"FF",X"66",
		X"3C",X"00",X"FF",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"7E",X"00",X"00",X"3C",X"7E",X"00",X"FF",
		X"3E",X"F0",X"00",X"01",X"00",X"FF",X"E0",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"00",X"00",
		X"00",X"06",X"00",X"FF",X"60",X"80",X"06",X"19",X"03",X"1F",X"FF",X"00",X"80",X"00",X"19",X"60",
		X"00",X"FF",X"80",X"00",X"01",X"06",X"FF",X"00",X"FF",X"00",X"00",X"00",X"0F",X"C0",X"00",X"03",
		X"E0",X"60",X"0F",X"0B",X"E0",X"FF",X"0F",X"60",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"03",X"C0",X"FF",X"01",X"80",X"C0",X"00",X"01",X"FF",X"03",X"E0",X"60",X"03",X"03",X"E0",X"FF",
		X"0B",X"21",X"C3",X"2E",X"13",X"10",X"00",X"00",X"80",X"FF",X"FF",X"00",X"CD",X"FF",X"0C",X"86",
		X"0E",X"10",X"0E",X"49",X"0E",X"82",X"0E",X"BB",X"1E",X"41",X"0D",X"4F",X"0D",X"88",X"0D",X"C1",
		X"2B",X"08",X"50",X"11",X"CD",X"07",X"0C",X"86",X"10",X"11",X"CD",X"0D",X"0C",X"86",X"21",X"C9",
		X"C9",X"0C",X"EB",X"CD",X"3A",X"0B",X"20",X"E2",X"08",X"21",X"11",X"2E",X"07",X"60",X"86",X"CD",
		X"97",X"23",X"C3",X"77",X"19",X"67",X"FE",X"78",X"D3",X"C9",X"05",X"01",X"05",X"05",X"C9",X"78",
		X"CD",X"20",X"19",X"72",X"77",X"78",X"FE",X"3D",X"C3",X"40",X"11",X"61",X"FF",X"FF",X"FA",X"3A",
		X"7B",X"23",X"FA",X"32",X"C3",X"20",X"1F",X"41",X"C2",X"0B",X"13",X"56",X"07",X"3E",X"13",X"12",
		X"11",X"26",X"13",X"86",X"E2",X"3A",X"A7",X"20",X"97",X"23",X"C3",X"77",X"1F",X"3E",X"01",X"21",
		X"3A",X"12",X"20",X"E0",X"DC",X"C3",X"CD",X"13",X"79",X"CA",X"3A",X"13",X"20",X"E1",X"26",X"C3",
		X"10",X"10",X"10",X"10",X"26",X"10",X"26",X"26",X"09",X"F1",X"D1",X"C1",X"C9",X"E1",X"10",X"10",
		X"2A",X"13",X"20",X"D3",X"CD",X"2B",X"1D",X"58",X"26",X"26",X"26",X"26",X"26",X"26",X"C7",X"11",
		X"F1",X"CD",X"C3",X"09",X"03",X"EC",X"01",X"E6",X"01",X"21",X"0E",X"26",X"11",X"09",X"13",X"8D",
		X"C1",X"CA",X"CD",X"13",X"1D",X"58",X"7D",X"C3",X"D3",X"2A",X"2B",X"20",X"C7",X"11",X"A7",X"13",
		X"15",X"AA",X"FF",X"2B",X"B4",X"54",X"56",X"6B",X"CD",X"16",X"1D",X"AA",X"7D",X"C3",X"D8",X"16",
		X"04",X"01",X"FF",X"FF",X"CA",X"A7",X"13",X"82",X"A8",X"FF",X"14",X"28",X"FF",X"09",X"80",X"10",
		X"3E",X"13",X"C3",X"02",X"1F",X"71",X"E2",X"CA",X"A7",X"00",X"82",X"CA",X"4F",X"13",X"7F",X"C3",
		X"A7",X"20",X"E2",X"CA",X"C3",X"18",X"04",X"33",X"FE",X"18",X"C2",X"02",X"18",X"57",X"F5",X"3A",
		X"1C",X"65",X"1C",X"7A",X"1C",X"8F",X"1C",X"A4",X"1C",X"11",X"1C",X"26",X"1C",X"3B",X"1C",X"50",
		X"FF",X"C1",X"A0",X"80",X"61",X"73",X"00",X"01",X"C0",X"C0",X"82",X"86",X"C0",X"FF",X"CD",X"40",
		X"30",X"00",X"1E",X"1E",X"00",X"03",X"00",X"FF",X"00",X"FF",X"2F",X"20",X"01",X"33",X"FF",X"00",
		X"00",X"80",X"00",X"03",X"FF",X"FF",X"FF",X"FF",X"E0",X"F0",X"03",X"01",X"FF",X"00",X"70",X"00",
		X"7E",X"A0",X"FF",X"60",X"D0",X"C0",X"30",X"B9",X"FF",X"FF",X"60",X"60",X"61",X"73",X"E0",X"FF",
		X"0F",X"8F",X"00",X"01",X"00",X"FF",X"F0",X"F8",X"80",X"FF",X"97",X"90",X"FF",X"19",X"18",X"00",
		X"00",X"01",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"01",X"00",X"FF",X"00",X"38",X"00",X"00",X"C0",
		X"70",X"FF",X"3F",X"50",X"FF",X"3C",X"68",X"E0",X"FF",X"FF",X"FF",X"FF",X"B0",X"B0",X"3E",X"3F",
		X"8C",X"80",X"07",X"C7",X"00",X"FF",X"F8",X"7C",X"18",X"5C",X"C0",X"FF",X"4B",X"C8",X"FF",X"0C",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"00",X"1C",X"00",X"00",X"E0",X"FF",X"FF",
		X"1F",X"1F",X"B8",X"FF",X"1F",X"E8",X"FF",X"1F",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"D8",X"D8",
		X"FF",X"06",X"C6",X"C0",X"03",X"63",X"00",X"FF",X"B4",X"70",X"0F",X"2E",X"E0",X"FF",X"25",X"64",
		X"FF",X"FF",X"E0",X"07",X"FF",X"00",X"FF",X"FF",X"7C",X"3E",X"FF",X"00",X"0E",X"00",X"00",X"70",
		X"C0",X"C0",X"1F",X"17",X"C0",X"FF",X"1E",X"C0",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"07",X"80",X"FF",X"03",X"00",X"80",X"01",X"03",X"FF",X"07",X"C0",X"C0",X"06",X"07",X"C0",X"FF",
		X"86",X"CD",X"C3",X"0C",X"11",X"F6",X"00",X"00",X"FF",X"FF",X"FF",X"00",X"11",X"FF",X"1C",X"11",
		X"12",X"10",X"12",X"42",X"12",X"74",X"12",X"A6",X"11",X"10",X"11",X"42",X"11",X"74",X"11",X"A6",
		X"FF",X"7E",X"1E",X"1E",X"3C",X"3C",X"FF",X"FF",X"F3",X"F3",X"67",X"67",X"3F",X"FF",X"7E",X"3F",
		X"32",X"3D",X"22",X"43",X"C3",X"F1",X"03",X"66",X"3A",X"F5",X"22",X"43",X"CA",X"A7",X"11",X"2C",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"FF",X"1F",X"00",X"CC",X"33",X"00",X"FF",X"FF",X"80",X"F0",X"0F",X"01",X"F8",X"FF",
		X"1E",X"00",X"30",X"FF",X"00",X"00",X"FF",X"0C",X"CC",X"FF",X"00",X"00",X"FF",X"33",X"00",X"78",
		X"FE",X"00",X"DA",X"0C",X"13",X"60",X"46",X"C3",X"DA",X"FF",X"11",X"66",X"0C",X"06",X"BC",X"CD",
		X"00",X"FF",X"06",X"00",X"FF",X"0F",X"80",X"00",X"FF",X"13",X"FF",X"FF",X"00",X"00",X"06",X"06",
		X"80",X"80",X"19",X"19",X"80",X"FF",X"19",X"80",X"1F",X"0F",X"80",X"FF",X"1F",X"80",X"FF",X"19",
		X"0F",X"00",X"FF",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"1F",X"00",X"80",X"0F",X"1F",X"00",X"FF",
		X"0F",X"7C",X"00",X"FF",X"F8",X"C0",X"FF",X"07",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"80",X"00",
		X"98",X"60",X"01",X"06",X"FF",X"00",X"C0",X"00",X"60",X"00",X"06",X"98",X"00",X"01",X"00",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"03",X"F0",X"00",X"FF",X"60",X"80",X"FF",X"01",
		X"00",X"00",X"7B",X"5F",X"00",X"FF",X"7F",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"1F",X"00",X"FF",X"0E",X"00",X"00",X"04",X"0E",X"FF",X"1F",X"00",X"00",X"1F",X"1B",X"00",X"FF",
		X"11",X"2B",X"0C",X"79",X"F5",X"C3",X"00",X"12",X"FF",X"FF",X"FF",X"00",X"00",X"FF",X"0C",X"21",
		X"E6",X"3D",X"32",X"1F",X"20",X"D1",X"01",X"3E",X"32",X"10",X"20",X"D0",X"D1",X"3A",X"3D",X"20",
		X"E5",X"20",X"CD",X"D5",X"15",X"B4",X"00",X"CD",X"D8",X"32",X"11",X"20",X"20",X"B0",X"D3",X"2A",
		X"00",X"00",X"96",X"CD",X"3A",X"15",X"20",X"DA",X"D1",X"15",X"3A",X"E1",X"20",X"D6",X"00",X"A7",
		X"CA",X"A7",X"16",X"7D",X"03",X"3E",X"20",X"C3",X"C2",X"A7",X"16",X"87",X"ED",X"CD",X"00",X"40",
		X"16",X"5F",X"1A",X"17",X"02",X"32",X"13",X"20",X"97",X"11",X"05",X"32",X"3A",X"20",X"20",X"D1",
		X"03",X"32",X"7D",X"20",X"04",X"32",X"CD",X"20",X"32",X"1A",X"20",X"01",X"D3",X"2A",X"7C",X"20",
		X"32",X"97",X"20",X"DF",X"00",X"3A",X"6F",X"22",X"17",X"88",X"20",X"26",X"DF",X"3A",X"F5",X"20",
		X"17",X"88",X"5E",X"C3",X"3A",X"05",X"20",X"CF",X"8D",X"CD",X"F1",X"18",X"DF",X"32",X"CD",X"20",
		X"40",X"ED",X"A7",X"00",X"7D",X"C2",X"21",X"16",X"C2",X"A7",X"1B",X"87",X"12",X"C3",X"CD",X"1B",
		X"16",X"AA",X"D0",X"3A",X"C6",X"20",X"32",X"10",X"20",X"DA",X"C3",X"35",X"16",X"7D",X"D2",X"07",
		X"16",X"09",X"DD",X"3A",X"47",X"20",X"D5",X"3A",X"20",X"D0",X"D1",X"3A",X"3C",X"20",X"C3",X"3C",
		X"20",X"D5",X"ED",X"CD",X"00",X"40",X"C3",X"A7",X"90",X"20",X"96",X"D2",X"3E",X"1B",X"32",X"50",
		X"3A",X"17",X"20",X"DD",X"50",X"FE",X"D5",X"D2",X"42",X"20",X"D8",X"3A",X"A7",X"20",X"6F",X"C2",
		X"D3",X"2A",X"E5",X"20",X"B4",X"CD",X"00",X"15",X"3C",X"16",X"DD",X"32",X"11",X"20",X"20",X"B0",
		X"20",X"D9",X"16",X"5F",X"1A",X"17",X"B7",X"4F",X"33",X"C3",X"00",X"18",X"00",X"00",X"3A",X"E1",
		X"17",X"17",X"5F",X"17",X"C3",X"9F",X"03",X"F7",X"13",X"17",X"CE",X"1A",X"B7",X"00",X"17",X"17",
		X"FF",X"FE",X"00",X"FE",X"00",X"FF",X"01",X"FF",X"FF",X"00",X"FD",X"FF",X"FE",X"FF",X"FE",X"FE",
		X"00",X"02",X"FF",X"02",X"FF",X"01",X"FE",X"01",X"01",X"00",X"02",X"01",X"01",X"01",X"01",X"02",
		X"DA",X"03",X"17",X"49",X"3C",X"2F",X"A7",X"4F",X"7B",X"57",X"E0",X"E6",X"3E",X"26",X"FE",X"79",
		X"3C",X"20",X"07",X"E6",X"D7",X"32",X"3E",X"20",X"63",X"CA",X"CD",X"17",X"1B",X"9C",X"D7",X"3A",
		X"A7",X"17",X"63",X"CA",X"CD",X"17",X"15",X"14",X"32",X"01",X"20",X"D2",X"79",X"0D",X"2F",X"C3",
		X"3E",X"20",X"32",X"01",X"20",X"D2",X"79",X"0D",X"D7",X"3A",X"3C",X"20",X"07",X"E6",X"D7",X"32",
		X"CD",X"20",X"15",X"96",X"7D",X"C3",X"3A",X"1B",X"49",X"C3",X"22",X"17",X"20",X"D3",X"B0",X"11",
		X"D2",X"C3",X"3A",X"16",X"20",X"D7",X"C2",X"A7",X"20",X"DD",X"03",X"FE",X"7B",X"C3",X"3D",X"17",
		X"00",X"3A",X"47",X"22",X"00",X"3A",X"32",X"20",X"16",X"D5",X"D1",X"3A",X"C3",X"20",X"1B",X"73",
		X"EB",X"20",X"DB",X"2A",X"22",X"20",X"20",X"EB",X"22",X"00",X"32",X"78",X"20",X"00",X"EB",X"2A",
		X"AE",X"3A",X"32",X"20",X"20",X"EE",X"32",X"78",X"22",X"EB",X"20",X"DB",X"EE",X"3A",X"47",X"20",
		X"7C",X"19",X"25",X"FE",X"24",X"DA",X"FE",X"17",X"20",X"AE",X"79",X"C9",X"C2",X"A7",X"17",X"B9",
		X"C3",X"27",X"17",X"26",X"21",X"E5",X"20",X"B1",X"DA",X"3E",X"17",X"26",X"26",X"CA",X"26",X"17",
		X"13",X"13",X"23",X"23",X"FE",X"7D",X"C2",X"C1",X"B0",X"11",X"1A",X"20",X"7E",X"47",X"70",X"12",
		X"17",X"F0",X"E1",X"F1",X"C1",X"D1",X"C9",X"FB",X"17",X"D3",X"C9",X"E1",X"F0",X"C3",X"C2",X"1A",
		X"00",X"00",X"00",X"00",X"05",X"C3",X"00",X"08",X"01",X"3E",X"F5",X"32",X"CD",X"20",X"03",X"C6",
		X"C0",X"07",X"00",X"01",X"40",X"04",X"00",X"01",X"80",X"03",X"80",X"03",X"C0",X"07",X"80",X"03",
		X"C0",X"00",X"C0",X"00",X"40",X"00",X"40",X"00",X"C0",X"07",X"C0",X"03",X"C0",X"0F",X"C0",X"01",
		X"80",X"01",X"60",X"00",X"00",X"01",X"00",X"00",X"C0",X"0F",X"C0",X"07",X"80",X"01",X"E0",X"01",
		X"00",X"03",X"00",X"00",X"00",X"02",X"00",X"00",X"C0",X"03",X"E0",X"07",X"80",X"03",X"F0",X"0F",
		X"00",X"07",X"00",X"00",X"00",X"00",X"00",X"00",X"F8",X"03",X"E0",X"03",X"E0",X"03",X"00",X"07",
		X"F8",X"07",X"00",X"01",X"00",X"00",X"00",X"00",X"E0",X"01",X"C0",X"01",X"F0",X"03",X"80",X"01",
		X"F0",X"00",X"80",X"00",X"30",X"00",X"00",X"00",X"E0",X"07",X"C0",X"00",X"E0",X"03",X"C0",X"00",
		X"60",X"00",X"60",X"00",X"20",X"00",X"20",X"00",X"E0",X"01",X"E0",X"03",X"E0",X"00",X"E0",X"07",
		X"80",X"00",X"E0",X"03",X"80",X"00",X"20",X"02",X"C0",X"01",X"C0",X"01",X"C0",X"01",X"E0",X"03",
		X"00",X"03",X"00",X"03",X"00",X"02",X"00",X"02",X"C0",X"03",X"E0",X"03",X"80",X"03",X"F0",X"03",
		X"00",X"06",X"80",X"01",X"00",X"00",X"80",X"00",X"E0",X"03",X"F0",X"03",X"80",X"07",X"80",X"01",
		X"00",X"00",X"C0",X"00",X"00",X"00",X"40",X"00",X"E0",X"07",X"C0",X"03",X"F0",X"0F",X"C0",X"01",
		X"00",X"00",X"E0",X"00",X"00",X"00",X"00",X"00",X"C0",X"07",X"C0",X"1F",X"E0",X"00",X"C0",X"07",
		X"20",X"00",X"F8",X"07",X"00",X"00",X"00",X"00",X"E0",X"00",X"E0",X"01",X"60",X"00",X"F0",X"03",
		X"40",X"00",X"C0",X"03",X"00",X"00",X"00",X"03",X"C0",X"00",X"F8",X"01",X"C0",X"00",X"F0",X"01",
		X"00",X"03",X"00",X"03",X"00",X"02",X"00",X"02",X"E0",X"03",X"C0",X"03",X"F0",X"03",X"80",X"03",
		X"1A",X"20",X"7D",X"77",X"BF",X"FE",X"13",X"C8",X"D0",X"3A",X"5F",X"20",X"14",X"16",X"B0",X"21",
		X"20",X"B1",X"1A",X"B7",X"12",X"17",X"1B",X"4F",X"C3",X"23",X"15",X"09",X"06",X"C5",X"11",X"00",
		X"CA",X"BE",X"15",X"32",X"13",X"13",X"C3",X"13",X"17",X"1A",X"79",X"12",X"47",X"B0",X"FE",X"7B",
		X"17",X"CC",X"00",X"00",X"B6",X"1A",X"13",X"77",X"15",X"1A",X"C1",X"78",X"C0",X"A7",X"C3",X"23",
		X"69",X"60",X"77",X"B6",X"2B",X"13",X"B6",X"1A",X"1A",X"2B",X"77",X"B6",X"23",X"13",X"E5",X"1A",
		X"A6",X"2F",X"E6",X"77",X"CA",X"07",X"15",X"65",X"23",X"77",X"44",X"13",X"E1",X"4D",X"1A",X"C9",
		X"A6",X"2F",X"E6",X"77",X"CA",X"E0",X"15",X"75",X"01",X"3E",X"D6",X"32",X"13",X"20",X"1A",X"2B",
		X"E5",X"2F",X"69",X"60",X"77",X"A6",X"07",X"E6",X"01",X"3E",X"D6",X"32",X"13",X"20",X"1A",X"23",
		X"2B",X"13",X"2F",X"1A",X"77",X"A6",X"E0",X"E6",X"88",X"CA",X"3E",X"15",X"32",X"01",X"20",X"D6",
		X"4F",X"20",X"DE",X"7C",X"47",X"00",X"3C",X"CD",X"19",X"CA",X"C3",X"02",X"02",X"14",X"D6",X"7D",
		X"1D",X"82",X"3C",X"CD",X"CD",X"15",X"1D",X"82",X"CD",X"15",X"1D",X"82",X"3C",X"CD",X"CD",X"15",
		X"DE",X"7C",X"47",X"00",X"57",X"CD",X"CD",X"15",X"3C",X"CD",X"C9",X"15",X"D6",X"7D",X"4F",X"20",
		X"57",X"CD",X"CD",X"15",X"1D",X"82",X"57",X"CD",X"1D",X"82",X"57",X"CD",X"CD",X"15",X"1D",X"82",
		X"E5",X"01",X"31",X"C3",X"00",X"02",X"D2",X"3A",X"C9",X"15",X"F5",X"3A",X"A7",X"20",X"FE",X"C8",
		X"3A",X"16",X"20",X"D7",X"C2",X"A7",X"16",X"AA",X"3D",X"20",X"D2",X"32",X"A7",X"20",X"AA",X"C2",
		X"D2",X"00",X"16",X"96",X"D0",X"3A",X"D6",X"20",X"10",X"3E",X"D2",X"32",X"C3",X"20",X"40",X"DA");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
