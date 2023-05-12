library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity interact is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(10 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of interact is
	type rom is array(0 to  2047) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"3E",X"40",X"32",X"02",X"28",X"C3",X"0C",X"00",X"F3",X"C3",X"04",X"08",X"3E",X"38",X"32",X"00",
		X"30",X"AF",X"32",X"00",X"10",X"32",X"00",X"18",X"06",X"3E",X"21",X"C0",X"5F",X"F9",X"77",X"23",
		X"05",X"C2",X"1E",X"00",X"3A",X"00",X"08",X"B7",X"CA",X"00",X"08",X"3A",X"00",X"30",X"77",X"3E",
		X"80",X"32",X"DB",X"5F",X"C3",X"8C",X"01",X"FF",X"E5",X"D5",X"C5",X"F5",X"3A",X"F5",X"5F",X"B7",
		X"C2",X"6A",X"00",X"21",X"C0",X"5F",X"7E",X"1F",X"1F",X"1F",X"E6",X"07",X"F5",X"11",X"F6",X"5F",
		X"83",X"5F",X"3A",X"00",X"30",X"12",X"F1",X"3D",X"C2",X"5D",X"00",X"3E",X"06",X"87",X"87",X"87",
		X"AE",X"E6",X"F8",X"AE",X"F6",X"40",X"77",X"32",X"00",X"30",X"2A",X"EF",X"5F",X"23",X"22",X"EF",
		X"5F",X"11",X"06",X"38",X"21",X"C8",X"5F",X"01",X"CF",X"5F",X"1A",X"2F",X"A6",X"C2",X"89",X"00",
		X"2B",X"0B",X"1D",X"F2",X"7A",X"00",X"C3",X"24",X"01",X"F5",X"0A",X"2F",X"E3",X"A4",X"E1",X"CA",
		X"80",X"00",X"11",X"02",X"07",X"F5",X"21",X"C9",X"5F",X"7E",X"87",X"D2",X"9F",X"00",X"1D",X"C2",
		X"9A",X"00",X"23",X"15",X"C2",X"99",X"00",X"F1",X"1D",X"FA",X"24",X"01",X"16",X"08",X"0F",X"D2",
		X"B5",X"00",X"5A",X"3E",X"80",X"15",X"C2",X"AE",X"00",X"57",X"0A",X"B2",X"02",X"79",X"D6",X"C9",
		X"87",X"87",X"87",X"83",X"3D",X"FE",X"02",X"21",X"D2",X"5F",X"C2",X"D3",X"00",X"7E",X"2F",X"77",
		X"C3",X"24",X"01",X"FE",X"07",X"DA",X"E9",X"00",X"57",X"3A",X"00",X"38",X"2F",X"E6",X"80",X"B6",
		X"7A",X"CA",X"F5",X"00",X"FE",X"17",X"D2",X"F0",X"00",X"21",X"75",X"01",X"85",X"6F",X"7E",X"11",
		X"C6",X"23",X"C3",X"03",X"01",X"C6",X"23",X"FE",X"41",X"DA",X"03",X"01",X"FE",X"5B",X"D2",X"03",
		X"01",X"C6",X"20",X"57",X"3A",X"00",X"38",X"E6",X"C0",X"EE",X"80",X"7A",X"C2",X"16",X"01",X"FE",
		X"60",X"DA",X"16",X"01",X"D6",X"60",X"32",X"D1",X"5F",X"21",X"D0",X"5F",X"7E",X"B7",X"CA",X"23",
		X"01",X"36",X"80",X"34",X"01",X"00",X"38",X"11",X"C2",X"5F",X"21",X"C9",X"5F",X"0A",X"F6",X"C0",
		X"FE",X"0A",X"2F",X"12",X"A6",X"77",X"03",X"13",X"23",X"3E",X"07",X"B9",X"C2",X"31",X"01",X"21",
		X"C1",X"5F",X"46",X"3A",X"07",X"38",X"2F",X"77",X"A0",X"47",X"1F",X"1F",X"1F",X"1F",X"E6",X"0F",
		X"21",X"F2",X"5F",X"77",X"2B",X"78",X"E6",X"0F",X"77",X"3A",X"F5",X"5F",X"B7",X"C2",X"6A",X"01",
		X"21",X"C0",X"5F",X"7E",X"EE",X"C0",X"77",X"32",X"00",X"30",X"2A",X"F3",X"5F",X"7D",X"B4",X"E5",
		X"C0",X"E1",X"F1",X"C1",X"D1",X"E1",X"FB",X"C9",X"08",X"09",X"0D",X"20",X"2A",X"5E",X"2C",X"5F",
		X"2E",X"2F",X"3C",X"3E",X"22",X"27",X"24",X"25",X"21",X"3A",X"28",X"29",X"FB",X"CD",X"73",X"05",
		X"01",X"E8",X"01",X"CD",X"D3",X"01",X"3A",X"00",X"4C",X"FE",X"31",X"F5",X"03",X"01",X"06",X"02",
		X"CC",X"D3",X"01",X"01",X"17",X"02",X"CD",X"36",X"06",X"CD",X"E0",X"07",X"47",X"F1",X"78",X"C2",
		X"B7",X"01",X"FE",X"72",X"CA",X"00",X"4C",X"FE",X"6C",X"C2",X"96",X"01",X"06",X"01",X"0E",X"01",
		X"11",X"00",X"00",X"CD",X"1C",X"02",X"B7",X"C2",X"00",X"00",X"3A",X"00",X"4C",X"FE",X"31",X"CA",
		X"00",X"4C",X"C7",X"0A",X"FE",X"FF",X"C8",X"CD",X"2F",X"06",X"03",X"0A",X"5F",X"03",X"0A",X"57",
		X"03",X"CD",X"4F",X"05",X"03",X"C3",X"D3",X"01",X"03",X"12",X"23",X"44",X"45",X"50",X"52",X"45",
		X"53",X"53",X"00",X"03",X"26",X"0E",X"4C",X"20",X"54",X"4F",X"20",X"4C",X"4F",X"41",X"44",X"20",
		X"54",X"41",X"50",X"45",X"00",X"FF",X"03",X"3A",X"14",X"52",X"20",X"54",X"4F",X"20",X"52",X"45",
		X"53",X"54",X"41",X"52",X"54",X"00",X"FF",X"04",X"01",X"02",X"07",X"00",X"F3",X"AF",X"32",X"D3",
		X"5F",X"D5",X"C5",X"CD",X"CA",X"02",X"CD",X"DD",X"02",X"01",X"1D",X"00",X"CD",X"F6",X"07",X"01",
		X"64",X"01",X"1E",X"00",X"CD",X"B1",X"03",X"C1",X"C5",X"01",X"05",X"00",X"11",X"D4",X"5F",X"CD",
		X"1A",X"03",X"C1",X"B7",X"CA",X"5D",X"02",X"32",X"D3",X"5F",X"78",X"B7",X"C2",X"38",X"02",X"D1",
		X"7A",X"B7",X"C2",X"58",X"02",X"CD",X"E3",X"02",X"3A",X"D3",X"5F",X"FB",X"C9",X"C5",X"2A",X"DD",
		X"5F",X"7C",X"B5",X"CA",X"6F",X"02",X"22",X"D4",X"5F",X"2A",X"DF",X"5F",X"22",X"D6",X"5F",X"3A",
		X"D8",X"5F",X"FE",X"FD",X"C2",X"7B",X"02",X"C1",X"C3",X"4F",X"02",X"FE",X"FE",X"C2",X"AE",X"02",
		X"21",X"D9",X"5F",X"01",X"01",X"00",X"CD",X"1A",X"03",X"C1",X"B7",X"CA",X"99",X"02",X"32",X"D3",
		X"5F",X"78",X"B7",X"C2",X"38",X"02",X"C3",X"4F",X"02",X"2A",X"D6",X"5F",X"EB",X"2A",X"D4",X"5F",
		X"3A",X"D9",X"5F",X"77",X"23",X"1B",X"7A",X"B3",X"C2",X"A0",X"02",X"C3",X"38",X"02",X"2A",X"D4",
		X"5F",X"EB",X"2A",X"D6",X"5F",X"44",X"4D",X"CD",X"00",X"03",X"C1",X"B7",X"CA",X"38",X"02",X"32",
		X"D3",X"5F",X"78",X"B7",X"C2",X"38",X"02",X"C3",X"4F",X"02",X"0F",X"2F",X"E6",X"40",X"32",X"02",
		X"28",X"3A",X"C0",X"5F",X"F6",X"07",X"32",X"C0",X"5F",X"32",X"00",X"30",X"C9",X"F5",X"3E",X"FF",
		X"C3",X"E5",X"02",X"F5",X"AF",X"E5",X"21",X"DB",X"5F",X"AE",X"E6",X"40",X"AE",X"77",X"32",X"00",
		X"10",X"21",X"C0",X"5F",X"7E",X"E6",X"07",X"F6",X"38",X"77",X"32",X"00",X"30",X"E1",X"F1",X"C9",
		X"E5",X"CD",X"DD",X"02",X"AF",X"32",X"D3",X"5F",X"CD",X"1A",X"03",X"21",X"D3",X"5F",X"B6",X"77",
		X"78",X"B1",X"C2",X"08",X"03",X"E1",X"3A",X"D3",X"5F",X"C9",X"E5",X"C5",X"CD",X"4F",X"03",X"C1",
		X"67",X"D2",X"36",X"03",X"6F",X"7B",X"84",X"5F",X"7A",X"CE",X"00",X"57",X"79",X"94",X"4F",X"7A",
		X"DE",X"00",X"47",X"7D",X"E1",X"C9",X"CD",X"9A",X"03",X"DA",X"24",X"03",X"12",X"13",X"0B",X"25",
		X"CA",X"4C",X"03",X"78",X"B1",X"C2",X"36",X"03",X"3E",X"04",X"E1",X"C9",X"E1",X"AF",X"C9",X"CD",
		X"D0",X"03",X"FE",X"15",X"DA",X"4F",X"03",X"CD",X"D0",X"03",X"FE",X"21",X"D2",X"4F",X"03",X"FE",
		X"15",X"D2",X"57",X"03",X"C5",X"FE",X"0D",X"3F",X"0E",X"80",X"DA",X"A8",X"03",X"CD",X"D0",X"03",
		X"FE",X"21",X"D2",X"95",X"03",X"FE",X"15",X"0E",X"40",X"DA",X"A5",X"03",X"CD",X"D0",X"03",X"FE",
		X"0D",X"D2",X"95",X"03",X"CD",X"D0",X"03",X"FE",X"21",X"D2",X"95",X"03",X"FE",X"15",X"DA",X"95",
		X"03",X"00",X"3E",X"01",X"01",X"3E",X"02",X"C1",X"37",X"C9",X"C5",X"0E",X"80",X"CD",X"D0",X"03",
		X"FE",X"15",X"D2",X"95",X"03",X"FE",X"0D",X"3F",X"79",X"1F",X"4F",X"D2",X"9D",X"03",X"B7",X"C1",
		X"C9",X"C5",X"CD",X"D0",X"03",X"FE",X"21",X"D2",X"CC",X"03",X"FE",X"15",X"DA",X"CC",X"03",X"0B",
		X"78",X"B1",X"C2",X"B2",X"03",X"7B",X"B7",X"C4",X"CA",X"02",X"C1",X"C9",X"C1",X"C3",X"B1",X"03",
		X"E5",X"2A",X"DA",X"5F",X"3A",X"00",X"30",X"AD",X"F2",X"D4",X"03",X"AD",X"32",X"DA",X"5F",X"95",
		X"E1",X"E6",X"7F",X"C9",X"C5",X"06",X"08",X"79",X"0F",X"4F",X"9F",X"E6",X"08",X"C6",X"08",X"CD",
		X"F8",X"03",X"05",X"C2",X"E7",X"03",X"C1",X"C9",X"D6",X"02",X"CD",X"FF",X"03",X"3E",X"02",X"E5",
		X"2A",X"DA",X"5F",X"85",X"E6",X"7F",X"6F",X"3A",X"00",X"30",X"E6",X"7F",X"BD",X"C2",X"07",X"04",
		X"7C",X"EE",X"80",X"32",X"00",X"10",X"67",X"22",X"DA",X"5F",X"E1",X"C9",X"3A",X"00",X"30",X"E6",
		X"7F",X"32",X"DA",X"5F",X"78",X"B1",X"C8",X"3E",X"1B",X"CD",X"F8",X"03",X"0B",X"C3",X"24",X"04",
		X"CD",X"33",X"04",X"3E",X"08",X"CD",X"F8",X"03",X"01",X"01",X"00",X"C3",X"24",X"04",X"79",X"B7",
		X"C8",X"E5",X"D5",X"57",X"2A",X"E1",X"5F",X"7C",X"B5",X"C2",X"4F",X"04",X"21",X"7A",X"06",X"7A",
		X"FE",X"61",X"DA",X"5A",X"04",X"D6",X"43",X"C3",X"6F",X"04",X"FE",X"1E",X"3D",X"DA",X"6F",X"04",
		X"D6",X"1D",X"57",X"2A",X"E3",X"5F",X"7C",X"B5",X"7A",X"C2",X"6F",X"04",X"21",X"6E",X"06",X"5E",
		X"23",X"56",X"23",X"E5",X"D5",X"CD",X"18",X"05",X"D1",X"7A",X"C6",X"07",X"1F",X"1F",X"1F",X"E6",
		X"1F",X"EB",X"E3",X"CD",X"1D",X"05",X"22",X"E5",X"5F",X"E1",X"D1",X"D5",X"C5",X"01",X"00",X"00",
		X"CD",X"9D",X"04",X"C1",X"D1",X"E1",X"C9",X"CD",X"F7",X"05",X"CD",X"B3",X"05",X"E5",X"21",X"DB",
		X"04",X"22",X"EB",X"5F",X"E1",X"7C",X"B7",X"C8",X"7D",X"B7",X"C8",X"C5",X"D5",X"E5",X"22",X"E9",
		X"5F",X"E5",X"C5",X"D5",X"E5",X"2A",X"EB",X"5F",X"CD",X"DA",X"04",X"E1",X"D1",X"C1",X"0C",X"1C",
		X"2D",X"C2",X"B2",X"04",X"E3",X"7D",X"E3",X"6F",X"79",X"95",X"4F",X"7B",X"95",X"5F",X"04",X"14",
		X"25",X"C2",X"B2",X"04",X"E1",X"E1",X"D1",X"C1",X"37",X"C9",X"E9",X"CD",X"ED",X"04",X"C8",X"3A",
		X"EE",X"5F",X"4F",X"CD",X"2D",X"05",X"47",X"79",X"AE",X"A0",X"AE",X"77",X"C9",X"3A",X"EA",X"5F",
		X"C6",X"07",X"1F",X"1F",X"1F",X"E6",X"1F",X"D5",X"59",X"16",X"00",X"2A",X"E5",X"5F",X"CD",X"1D",
		X"05",X"78",X"1F",X"1F",X"1F",X"E6",X"1F",X"5F",X"16",X"00",X"19",X"78",X"E6",X"07",X"5F",X"7E",
		X"87",X"1D",X"F2",X"10",X"05",X"9F",X"D1",X"C9",X"16",X"00",X"21",X"00",X"00",X"D5",X"B7",X"1F",
		X"D2",X"24",X"05",X"19",X"EB",X"29",X"EB",X"B7",X"C2",X"1F",X"05",X"D1",X"C9",X"6B",X"26",X"00",
		X"29",X"29",X"29",X"29",X"29",X"7A",X"1F",X"1F",X"E6",X"3F",X"B5",X"6F",X"7A",X"EB",X"E6",X"03",
		X"21",X"4B",X"05",X"85",X"6F",X"7E",X"2A",X"E7",X"5F",X"19",X"C9",X"03",X"0C",X"30",X"C0",X"CD",
		X"F7",X"05",X"0A",X"CD",X"5C",X"05",X"D0",X"03",X"C3",X"52",X"05",X"79",X"CD",X"3F",X"04",X"D0",
		X"3A",X"EA",X"5F",X"3C",X"82",X"FE",X"67",X"57",X"D8",X"3A",X"E9",X"5F",X"3C",X"83",X"5F",X"16",
		X"06",X"37",X"C9",X"0E",X"00",X"E5",X"D5",X"79",X"CD",X"E8",X"05",X"4F",X"21",X"00",X"40",X"11",
		X"A0",X"09",X"71",X"23",X"1B",X"7A",X"B3",X"C2",X"82",X"05",X"D1",X"E1",X"C9",X"CD",X"F7",X"05",
		X"21",X"D2",X"05",X"22",X"EB",X"5F",X"CD",X"B3",X"05",X"CD",X"E8",X"05",X"32",X"ED",X"5F",X"C3",
		X"A5",X"04",X"CD",X"F7",X"05",X"21",X"DF",X"04",X"22",X"EB",X"5F",X"60",X"69",X"CD",X"BE",X"05",
		X"C3",X"A5",X"04",X"60",X"69",X"5E",X"23",X"56",X"23",X"EB",X"22",X"E5",X"5F",X"EB",X"5E",X"23",
		X"56",X"23",X"D5",X"7E",X"23",X"CD",X"2F",X"06",X"5E",X"23",X"56",X"23",X"7E",X"E1",X"01",X"00",
		X"00",X"C9",X"CD",X"ED",X"04",X"C8",X"CD",X"2D",X"05",X"47",X"A6",X"4F",X"3A",X"EE",X"5F",X"A0",
		X"B9",X"C0",X"3A",X"ED",X"5F",X"C3",X"E8",X"04",X"E6",X"03",X"C5",X"4F",X"87",X"87",X"81",X"87",
		X"87",X"81",X"87",X"87",X"81",X"C1",X"C9",X"E5",X"21",X"00",X"40",X"22",X"E7",X"5F",X"E1",X"C9",
		X"E5",X"D5",X"C5",X"CD",X"F7",X"05",X"79",X"CD",X"E8",X"05",X"CD",X"E2",X"04",X"C1",X"D1",X"E1",
		X"CD",X"F7",X"05",X"E5",X"D5",X"C5",X"50",X"59",X"78",X"E6",X"03",X"47",X"CD",X"2D",X"05",X"7E",
		X"0F",X"0F",X"05",X"F2",X"20",X"06",X"07",X"07",X"E6",X"03",X"C1",X"D1",X"E1",X"C9",X"79",X"CD",
		X"E8",X"05",X"32",X"EE",X"5F",X"C9",X"D5",X"3A",X"DB",X"5F",X"E6",X"C0",X"CD",X"5E",X"06",X"32",
		X"00",X"10",X"32",X"DB",X"5F",X"0B",X"3A",X"DC",X"5F",X"E6",X"80",X"CD",X"5E",X"06",X"57",X"03",
		X"0A",X"0F",X"0F",X"E6",X"40",X"B2",X"32",X"00",X"18",X"32",X"DC",X"5F",X"D1",X"C9",X"57",X"0A",
		X"03",X"E6",X"07",X"B2",X"57",X"03",X"0A",X"E6",X"07",X"17",X"17",X"17",X"B2",X"C9",X"05",X"05",
		X"00",X"50",X"20",X"50",X"00",X"20",X"00",X"70",X"00",X"20",X"00",X"00",X"00",X"00",X"00",X"20",
		X"20",X"20",X"00",X"20",X"50",X"50",X"00",X"00",X"00",X"50",X"F8",X"50",X"F8",X"50",X"70",X"A0",
		X"70",X"28",X"70",X"C8",X"D0",X"20",X"58",X"98",X"20",X"50",X"20",X"50",X"28",X"20",X"40",X"00",
		X"00",X"00",X"20",X"40",X"40",X"40",X"20",X"20",X"10",X"10",X"10",X"20",X"A8",X"70",X"F8",X"70",
		X"A8",X"00",X"20",X"70",X"20",X"00",X"00",X"00",X"00",X"20",X"40",X"00",X"00",X"70",X"00",X"00",
		X"00",X"00",X"00",X"00",X"20",X"08",X"10",X"20",X"40",X"80",X"70",X"88",X"88",X"88",X"70",X"20",
		X"60",X"20",X"20",X"70",X"F8",X"08",X"F8",X"80",X"F8",X"F8",X"08",X"38",X"08",X"F8",X"90",X"90",
		X"F8",X"10",X"10",X"F0",X"80",X"F0",X"08",X"F0",X"F8",X"80",X"F8",X"88",X"F8",X"F8",X"08",X"10",
		X"20",X"20",X"F8",X"88",X"F8",X"88",X"F8",X"F8",X"88",X"F8",X"08",X"F8",X"00",X"20",X"00",X"20",
		X"00",X"00",X"20",X"00",X"20",X"40",X"10",X"20",X"40",X"20",X"10",X"00",X"70",X"00",X"70",X"00",
		X"40",X"20",X"10",X"20",X"40",X"F8",X"88",X"38",X"00",X"20",X"30",X"48",X"50",X"40",X"38",X"70",
		X"88",X"F8",X"88",X"88",X"F8",X"88",X"F0",X"88",X"F8",X"F8",X"80",X"80",X"80",X"F8",X"F0",X"88",
		X"88",X"88",X"F0",X"F8",X"80",X"E0",X"80",X"F8",X"F8",X"80",X"E0",X"80",X"80",X"F8",X"80",X"98",
		X"88",X"F8",X"88",X"88",X"F8",X"88",X"88",X"70",X"20",X"20",X"20",X"70",X"08",X"08",X"08",X"88",
		X"F8",X"88",X"90",X"E0",X"90",X"88",X"80",X"80",X"80",X"80",X"F8",X"88",X"D8",X"A8",X"88",X"88",
		X"88",X"C8",X"A8",X"98",X"88",X"F8",X"88",X"88",X"88",X"F8",X"F8",X"88",X"F8",X"80",X"80",X"F8",
		X"88",X"A8",X"90",X"E8",X"F8",X"88",X"F8",X"90",X"88",X"F8",X"80",X"F8",X"08",X"F8",X"F8",X"20",
		X"20",X"20",X"20",X"88",X"88",X"88",X"88",X"F8",X"88",X"88",X"50",X"70",X"20",X"88",X"88",X"A8",
		X"D8",X"88",X"88",X"50",X"20",X"50",X"88",X"88",X"50",X"20",X"20",X"20",X"F8",X"10",X"20",X"40",
		X"F8",X"30",X"20",X"20",X"20",X"30",X"80",X"40",X"20",X"10",X"08",X"60",X"20",X"20",X"20",X"60",
		X"20",X"50",X"88",X"00",X"00",X"00",X"00",X"00",X"00",X"F8",X"20",X"10",X"00",X"00",X"00",X"21",
		X"DC",X"5F",X"7E",X"EE",X"80",X"77",X"32",X"00",X"18",X"F5",X"C5",X"60",X"69",X"01",X"FF",X"FF",
		X"09",X"DA",X"D0",X"07",X"C1",X"F1",X"FA",X"BF",X"07",X"1B",X"7A",X"B3",X"C2",X"BF",X"07",X"C9",
		X"3A",X"D0",X"5F",X"B7",X"CA",X"E0",X"07",X"3A",X"D0",X"5F",X"B7",X"C8",X"07",X"3E",X"00",X"32",
		X"D0",X"5F",X"3A",X"D1",X"5F",X"C9",X"C5",X"0B",X"78",X"B1",X"C2",X"F7",X"07",X"C1",X"C9",X"FF");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
