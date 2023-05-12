library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity a1 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(10 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of a1 is
	type rom is array(0 to  2047) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"E6",X"0A",X"07",X"B0",X"B0",X"B5",X"BC",X"B2",X"B1",X"C4",X"E6",X"0A",X"07",X"C4",X"B8",X"B7",
		X"B9",X"C2",X"C0",X"C5",X"E8",X"0A",X"09",X"B0",X"B0",X"B0",X"BE",X"B9",X"BF",X"B3",X"B0",X"A1",
		X"E8",X"0A",X"09",X"B0",X"B0",X"C3",X"BE",X"B9",X"BF",X"B3",X"B0",X"A2",X"C8",X"09",X"09",X"B0",
		X"C4",X"B9",X"B4",X"B5",X"C2",X"B3",X"B0",X"A1",X"C8",X"09",X"09",X"C3",X"C4",X"B9",X"B4",X"B5",
		X"C2",X"B3",X"B0",X"A2",X"E8",X"0A",X"12",X"B0",X"B0",X"B0",X"B0",X"B0",X"B0",X"B0",X"B0",X"B0",
		X"C9",X"B1",X"BC",X"C0",X"B0",X"B5",X"B5",X"C2",X"B6",X"EA",X"0A",X"05",X"C3",X"C5",X"BE",X"BF",
		X"B2",X"8A",X"09",X"05",X"B0",X"B0",X"A0",X"A0",X"A0",X"CA",X"09",X"07",X"B7",X"BE",X"B9",X"B8",
		X"C4",X"BF",X"BE",X"EC",X"0A",X"04",X"BB",X"BE",X"B1",X"C4",X"3B",X"0B",X"14",X"A0",X"A8",X"A9",
		X"A1",X"B0",X"B4",X"B5",X"C4",X"B9",X"BD",X"B9",X"BC",X"B0",X"BF",X"B3",X"BD",X"B1",X"BE",X"B0",
		X"AC",X"40",X"0B",X"03",X"B0",X"B0",X"B0",X"E0",X"08",X"03",X"B0",X"B0",X"B0",X"5F",X"0B",X"03",
		X"B0",X"B0",X"B0",X"40",X"0B",X"03",X"C0",X"C5",X"A1",X"E0",X"08",X"03",X"C0",X"C5",X"A2",X"5F",
		X"0B",X"03",X"D2",X"F5",X"F0",X"40",X"0B",X"16",X"C0",X"C5",X"A2",X"B0",X"B0",X"B0",X"B5",X"C2",
		X"BF",X"B3",X"C3",X"B0",X"B8",X"B7",X"B9",X"B8",X"B0",X"B0",X"B0",X"C0",X"C5",X"A1",X"5F",X"0B",
		X"16",X"D1",X"F5",X"F0",X"E0",X"E0",X"E0",X"E8",X"E9",X"E7",X"E8",X"E0",X"F3",X"E3",X"EF",X"F2",
		X"E5",X"E0",X"E0",X"E0",X"D2",X"F5",X"F0",X"7F",X"0B",X"09",X"C9",X"B1",X"BC",X"C0",X"B0",X"B5",
		X"B5",X"C2",X"B6",X"7F",X"0B",X"06",X"C4",X"B9",X"B4",X"B5",X"C2",X"B3",X"F0",X"0A",X"11",X"BE",
		X"BF",X"C4",X"C4",X"C5",X"B2",X"B0",X"C4",X"C2",X"B1",X"C4",X"C3",X"B0",X"B8",X"C3",X"C5",X"C0",
		X"72",X"0B",X"18",X"C3",X"C4",X"C0",X"B0",X"A0",X"A0",X"A0",X"A0",X"B0",X"B0",X"C2",X"BF",X"B6",
		X"B0",X"BB",X"BE",X"B1",X"C4",X"B0",X"C3",X"C5",X"BE",X"BF",X"B2",X"D6",X"0A",X"0E",X"0F",X"0E",
		X"0D",X"0C",X"B0",X"DF",X"DE",X"DD",X"DC",X"AF",X"AE",X"AD",X"B0",X"AC",X"B6",X"09",X"03",X"BF",
		X"C7",X"C4",X"6E",X"0A",X"05",X"B4",X"BE",X"C5",X"BF",X"C2",X"96",X"0A",X"0A",X"B5",X"BE",X"BF",
		X"B0",X"C2",X"B5",X"C9",X"B1",X"BC",X"C0",X"58",X"0A",X"07",X"CB",X"B0",X"C9",X"B4",X"B1",X"B5",
		X"C2",X"11",X"0A",X"05",X"F2",X"EF",X"F5",X"EE",X"E4",X"89",X"0A",X"0A",X"F0",X"EC",X"E1",X"F9",
		X"E5",X"F2",X"E0",X"F4",X"F7",X"EF",X"67",X"0A",X"07",X"F2",X"E5",X"E1",X"E4",X"F9",X"E0",X"FB",
		X"67",X"0A",X"07",X"BE",X"BF",X"B9",X"C3",X"C3",X"B9",X"BD",X"2A",X"0B",X"13",X"C3",X"BB",X"BE",
		X"B1",X"C4",X"B0",X"C9",X"BD",X"B5",X"BE",X"B5",X"B0",X"C9",X"BF",X"C2",X"C4",X"C3",X"B5",X"B4",
		X"CD",X"0A",X"0E",X"81",X"83",X"B0",X"B0",X"C2",X"C5",X"BF",X"B0",X"B4",X"BE",X"B5",X"B6",X"B5",
		X"B4",X"4C",X"09",X"02",X"80",X"82",X"15",X"0B",X"11",X"C3",X"C4",X"C0",X"B0",X"B0",X"B0",X"B0",
		X"B0",X"B0",X"5D",X"5F",X"B0",X"B0",X"BB",X"BE",X"B1",X"C4",X"54",X"0A",X"02",X"5C",X"5E",X"59",
		X"0A",X"07",X"DF",X"DE",X"DD",X"DC",X"AF",X"AE",X"AD",X"98",X"0A",X"04",X"B5",X"BD",X"B1",X"B7",
		X"D8",X"09",X"04",X"C2",X"B5",X"C6",X"BF",X"87",X"0A",X"04",X"EF",X"F6",X"E5",X"F2",X"C7",X"09",
		X"04",X"E7",X"E1",X"ED",X"E5",X"07",X"06",X"04",X"05",X"03",X"04",X"01",X"00",X"04",X"07",X"05",
		X"04",X"01",X"00",X"04",X"03",X"00",X"04",X"7A",X"64",X"25",X"64",X"D0",X"63",X"7B",X"63",X"26",
		X"63",X"D1",X"62",X"7C",X"62",X"27",X"62",X"CE",X"64",X"79",X"64",X"24",X"64",X"CF",X"63",X"7A",
		X"63",X"25",X"63",X"D0",X"62",X"7B",X"62",X"00",X"06",X"00",X"00",X"01",X"80",X"03",X"E6",X"67",
		X"F0",X"F9",X"99",X"FC",X"3E",X"60",X"03",X"00",X"00",X"00",X"C0",X"00",X"67",X"30",X"FF",X"99",
		X"C0",X"3F",X"E6",X"70",X"00",X"19",X"9C",X"C0",X"06",X"67",X"33",X"99",X"99",X"CC",X"26",X"06",
		X"00",X"09",X"81",X"80",X"0E",X"67",X"F9",X"F0",X"01",X"FE",X"7C",X"00",X"00",X"00",X"0F",X"80",
		X"00",X"03",X"E6",X"67",X"F0",X"F9",X"99",X"FC",X"00",X"66",X"03",X"00",X"19",X"80",X"C3",X"3E",
		X"67",X"30",X"CF",X"99",X"CC",X"00",X"06",X"00",X"00",X"01",X"80",X"00",X"00",X"08",X"00",X"00",
		X"02",X"00",X"03",X"FC",X"9F",X"30",X"FF",X"27",X"CC",X"00",X"00",X"00",X"00",X"00",X"00",X"03",
		X"E6",X"67",X"30",X"F9",X"99",X"CC",X"3E",X"66",X"03",X"00",X"19",X"80",X"C0",X"06",X"67",X"F3",
		X"99",X"99",X"FC",X"26",X"06",X"00",X"09",X"81",X"80",X"0E",X"67",X"FC",X"F0",X"19",X"FF",X"3C",
		X"00",X"06",X"00",X"00",X"01",X"80",X"03",X"FE",X"67",X"F0",X"FF",X"99",X"FC",X"00",X"00",X"00",
		X"00",X"00",X"00",X"03",X"FC",X"9C",X"F0",X"FF",X"27",X"3C",X"00",X"08",X"00",X"00",X"02",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"F3",X"FC",X"F0",X"FC",X"FF",X"3C",X"00",X"0C",
		X"00",X"00",X"03",X"00",X"03",X"CC",X"CF",X"F0",X"F3",X"33",X"FC",X"3C",X"CC",X"00",X"00",X"03",
		X"00",X"00",X"00",X"CF",X"F3",X"93",X"33",X"FC",X"24",X"C0",X"00",X"09",X"30",X"00",X"0E",X"4C",
		X"CF",X"F0",X"00",X"33",X"FC",X"00",X"0C",X"FF",X"0F",X"FF",X"00",X"03",X"FF",X"C0",X"00",X"00",
		X"33",X"9C",X"00",X"0C",X"E7",X"0F",X"33",X"39",X"C3",X"CC",X"CE",X"70",X"F3",X"33",X"9C",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"80",X"00",X"00",X"20",X"00",X"00",
		X"08",X"00",X"00",X"0E",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"18",X"00",X"00",X"06",
		X"00",X"03",X"F8",X"1F",X"F0",X"FE",X"07",X"FC",X"00",X"18",X"00",X"00",X"06",X"00",X"03",X"F9",
		X"9F",X"F0",X"FE",X"67",X"FC",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"7E",X"67",X"F3",X"9F",
		X"99",X"FC",X"20",X"06",X"00",X"08",X"01",X"80",X"0E",X"7E",X"67",X"F0",X"1F",X"99",X"FC",X"00",
		X"00",X"00",X"00",X"00",X"00",X"03",X"F9",X"9F",X"F0",X"FE",X"67",X"FC",X"00",X"18",X"00",X"00",
		X"06",X"00",X"03",X"F8",X"1F",X"F0",X"FE",X"07",X"FC",X"00",X"18",X"00",X"00",X"06",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"FF",X"F8",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"0C",X"FF",X"F8",X"01",X"00",X"00",X"00",X"40",X"00",X"00",X"1C",X"FF",X"86",X"00",X"00",X"01",
		X"40",X"00",X"00",X"73",X"9F",X"FE",X"7C",X"20",X"08",X"00",X"08",X"02",X"00",X"0E",X"7F",X"F9",
		X"F0",X"00",X"00",X"1C",X"00",X"00",X"05",X"07",X"3F",X"E1",X"81",X"00",X"00",X"00",X"40",X"00",
		X"00",X"33",X"FF",X"E0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"FF",X"FE",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"CF",X"3C",X"F0",X"F3",
		X"CF",X"3C",X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"CF",X"3C",X"F0",X"F3",X"CF",X"3C",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"4F",X"3C",X"F3",X"93",X"CF",X"3C",X"24",X"00",X"00",X"09",
		X"00",X"00",X"0E",X"4F",X"3C",X"F0",X"13",X"CF",X"3C",X"00",X"00",X"00",X"00",X"00",X"00",X"03",
		X"CF",X"3C",X"F0",X"F3",X"CF",X"3C",X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"CF",X"3C",X"F0",
		X"F3",X"CF",X"3C",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"03",X"CC",X"F3",X"30",X"F3",X"3C",X"CC",X"00",X"C0",X"33",X"00",X"30",X"0C",X"C3",X"FC",X"CF",
		X"30",X"FF",X"33",X"CC",X"00",X"0C",X"00",X"00",X"03",X"00",X"00",X"7F",X"CF",X"F3",X"9F",X"F3",
		X"FC",X"20",X"00",X"00",X"08",X"00",X"00",X"0E",X"7F",X"F3",X"F0",X"1F",X"FC",X"FC",X"00",X"03",
		X"00",X"00",X"00",X"C0",X"03",X"FF",X"33",X"F0",X"FF",X"CC",X"FC",X"00",X"30",X"00",X"00",X"0C",
		X"00",X"03",X"33",X"3C",X"F0",X"CC",X"CF",X"3C",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"00",X"01",X"01",X"00",X"00",X"00",X"02",
		X"03",X"02",X"00",X"03",X"00",X"00",X"00",X"00",X"01",X"01",X"02",X"03",X"01",X"00",X"00",X"00",
		X"01",X"01",X"02",X"03",X"01",X"00",X"00",X"02",X"01",X"02",X"01",X"03",X"01",X"00",X"00",X"01",
		X"02",X"02",X"02",X"02",X"02",X"00",X"00",X"01",X"02",X"02",X"02",X"02",X"02",X"00",X"00",X"02",
		X"02",X"03",X"03",X"02",X"02",X"00",X"00",X"02",X"02",X"03",X"02",X"02",X"03",X"00",X"00",X"00",
		X"01",X"01",X"02",X"03",X"01",X"00",X"00",X"00",X"01",X"01",X"02",X"03",X"01",X"00",X"00",X"02",
		X"01",X"02",X"01",X"03",X"01",X"00",X"00",X"00",X"02",X"02",X"02",X"02",X"02",X"00",X"00",X"00",
		X"02",X"02",X"02",X"02",X"02",X"00",X"00",X"02",X"02",X"03",X"03",X"02",X"02",X"00",X"00",X"01",
		X"02",X"02",X"02",X"02",X"02",X"00",X"00",X"01",X"02",X"02",X"02",X"02",X"02",X"00",X"00",X"02",
		X"02",X"03",X"03",X"02",X"02",X"00",X"00",X"01",X"02",X"03",X"02",X"02",X"03",X"00",X"00",X"03",
		X"04",X"05",X"05",X"04",X"05",X"06",X"06",X"05",X"06",X"07",X"07",X"07",X"07",X"07",X"07",X"03",
		X"02",X"02",X"01",X"02",X"02",X"01",X"01",X"01",X"01",X"01",X"01",X"02",X"01",X"02",X"01",X"20",
		X"20",X"30",X"60",X"50",X"30",X"30",X"50",X"40",X"80",X"60",X"A0",X"50",X"80",X"80",X"A0",X"20",
		X"40",X"40",X"60",X"40",X"60",X"70",X"90",X"60",X"70",X"90",X"B0",X"80",X"A8",X"C8",X"F4",X"03",
		X"02",X"02",X"01",X"01",X"03",X"01",X"03",X"01",X"02",X"03",X"04",X"02",X"02",X"02",X"02",X"F0",
		X"F0",X"F0",X"F0",X"F4",X"F0",X"E8",X"E0",X"F0",X"C8",X"F0",X"C8",X"01",X"00",X"01",X"01",X"01",
		X"00",X"00",X"01",X"01",X"01",X"01",X"00",X"01",X"01",X"01",X"01",X"00",X"00",X"01",X"01",X"01",
		X"00",X"01",X"01",X"00",X"01",X"00",X"01",X"01",X"01",X"01",X"00",X"00",X"01",X"00",X"01",X"02",
		X"02",X"00",X"07",X"06",X"06",X"07",X"00",X"00",X"03",X"00",X"03",X"09",X"08",X"00",X"00",X"08",
		X"09",X"04",X"07",X"09",X"04",X"00",X"00",X"07",X"00",X"09",X"05",X"06",X"08",X"00",X"05",X"06",
		X"00",X"08",X"00",X"80",X"05",X"06",X"08",X"80",X"04",X"07",X"09",X"80",X"02",X"06",X"07",X"80",
		X"03",X"08",X"09",X"A9",X"B5",X"84",X"08",X"64",X"0B",X"01",X"02",X"00",X"02",X"FB",X"09",X"03",
		X"58",X"0A",X"A9",X"B5",X"7B",X"0B",X"9B",X"08",X"00",X"03",X"01",X"03",X"E3",X"09",X"02",X"86",
		X"09",X"09",X"49",X"59",X"3A",X"4D",X"42",X"55",X"46",X"41",X"44",X"4C",X"0D",X"09",X"52",X"54",
		X"53",X"0D",X"3B",X"0D",X"4D",X"53",X"54",X"45",X"4E",X"30",X"09",X"4C",X"44",X"41",X"09",X"5A",
		X"20",X"3A",X"4D",X"42",X"55",X"46",X"41",X"44",X"48",X"0D",X"09",X"43",X"4D",X"50",X"09",X"49",
		X"20",X"2F",X"42",X"48",X"0D",X"09",X"42",X"4E",X"45",X"09",X"52",X"20",X"3A",X"4D",X"53",X"54",
		X"31",X"31",X"32",X"0D",X"09",X"4C",X"44",X"41",X"09",X"5A",X"20",X"3A",X"4D",X"42",X"55",X"46",
		X"41",X"44",X"4C",X"0D",X"09",X"43",X"4D",X"50",X"09",X"49",X"20",X"2F",X"41",X"32",X"48",X"0D",
		X"09",X"42",X"43",X"43",X"09",X"52",X"20",X"3A",X"4D",X"53",X"54",X"31",X"32",X"31",X"0D",X"09",
		X"42",X"43",X"53",X"09",X"52",X"20",X"3A",X"4D",X"53",X"54",X"31",X"32",X"38",X"0D",X"4D",X"53",
		X"54",X"31",X"31",X"32",X"09",X"43",X"4D",X"50",X"09",X"49",X"20",X"2F",X"38",X"0D",X"09",X"42",
		X"4E",X"45",X"09",X"52",X"20",X"3A",X"4D",X"53",X"54",X"31",X"32",X"31",X"0D",X"09",X"4C",X"44",
		X"41",X"09",X"5A",X"20",X"3A",X"4D",X"42",X"55",X"46",X"41",X"44",X"4C",X"0D",X"09",X"43",X"4D",
		X"50",X"09",X"49",X"20",X"2F",X"35",X"45",X"48",X"0D",X"09",X"42",X"43",X"43",X"09",X"52",X"20",
		X"3A",X"4D",X"53",X"54",X"31",X"32",X"38",X"0D",X"4D",X"53",X"54",X"31",X"32",X"31",X"09",X"54",
		X"59",X"41",X"0D",X"09",X"43",X"4C",X"43",X"0D",X"09",X"41",X"44",X"43",X"09",X"5A",X"20",X"3A",
		X"4D",X"42",X"55",X"46",X"41",X"44",X"4C",X"0D",X"09",X"41",X"4E",X"44",X"09",X"49",X"20",X"2F",
		X"31",X"46",X"48",X"0D",X"09",X"43",X"4D",X"50",X"09",X"49",X"20",X"2F",X"32",X"0D",X"09",X"42",
		X"45",X"51",X"09",X"52",X"20",X"3A",X"4D",X"53",X"54",X"31",X"32",X"38",X"0D",X"09",X"43",X"4D",
		X"50",X"09",X"49",X"20",X"2F",X"31",X"44",X"48",X"0D",X"09",X"42",X"4E",X"45",X"09",X"52",X"20",
		X"3A",X"4D",X"53",X"54",X"45",X"4E",X"31",X"0D",X"4D",X"53",X"54",X"31",X"32",X"38",X"09",X"4C",
		X"44",X"41",X"09",X"49",X"20",X"2F",X"31",X"30",X"48",X"0D",X"09",X"52",X"54",X"53",X"0D",X"4D",
		X"53",X"54",X"31",X"30",X"33",X"09",X"49",X"4E",X"59",X"0D",X"4D",X"53",X"54",X"31",X"30",X"34",
		X"09",X"49",X"4E",X"58",X"0D",X"4D",X"53",X"54",X"45",X"4E",X"31",X"09",X"4C",X"44",X"41",X"09",
		X"49",X"59",X"3A",X"4D",X"42",X"55",X"46",X"41",X"44",X"4C",X"0D",X"09",X"43",X"4D",X"50",X"09",
		X"49",X"20",X"2F",X"31",X"31",X"48",X"0D",X"09",X"42",X"43",X"43",X"09",X"52",X"20",X"3A",X"4D",
		X"53",X"54",X"31",X"30",X"32",X"0D",X"09",X"43",X"4D",X"50",X"09",X"49",X"20",X"2F",X"39",X"30",
		X"48",X"0D",X"09",X"42",X"43",X"53",X"09",X"52",X"20",X"3A",X"4D",X"53",X"54",X"31",X"30",X"32",
		X"0D",X"09",X"4C",X"44",X"41",X"09",X"49",X"20",X"2F",X"30",X"0D",X"4D",X"53",X"54",X"31",X"30",
		X"32",X"09",X"52",X"54",X"53",X"0D",X"3B",X"0D",X"4D",X"53",X"31",X"30",X"58",X"09",X"54",X"58");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
