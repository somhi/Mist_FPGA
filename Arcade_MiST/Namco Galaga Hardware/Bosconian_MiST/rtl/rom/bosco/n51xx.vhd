library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity n51xx is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(9 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of n51xx is
	type rom is array(0 to  1023) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"68",X"7E",X"50",X"12",X"3F",X"04",X"3D",X"01",X"54",X"1B",X"51",X"59",X"83",X"25",X"D0",X"CD",
		X"25",X"D0",X"00",X"12",X"B0",X"DC",X"57",X"8A",X"9A",X"1D",X"57",X"90",X"1A",X"AF",X"CD",X"51",
		X"1B",X"54",X"56",X"84",X"56",X"50",X"3E",X"04",X"3C",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"68",X"22",X"00",X"00",X"68",X"08",X"00",X"00",X"90",X"53",X"68",X"22",X"91",X"52",X"68",X"22",
		X"90",X"52",X"68",X"22",X"91",X"53",X"68",X"22",X"68",X"22",X"00",X"00",X"68",X"22",X"00",X"00",
		X"6A",X"4F",X"00",X"00",X"6A",X"4F",X"00",X"00",X"6A",X"4F",X"00",X"00",X"6A",X"4F",X"00",X"00",
		X"6A",X"4F",X"00",X"00",X"6A",X"4F",X"00",X"00",X"6A",X"4F",X"00",X"00",X"6A",X"4F",X"58",X"80",
		X"90",X"1B",X"0A",X"C2",X"1B",X"71",X"B8",X"C1",X"59",X"8F",X"9C",X"1D",X"5A",X"8A",X"9F",X"0A",
		X"1D",X"90",X"07",X"91",X"53",X"3E",X"64",X"59",X"88",X"90",X"1D",X"58",X"89",X"16",X"1D",X"83",
		X"0D",X"B1",X"68",X"BE",X"5A",X"82",X"13",X"84",X"1A",X"13",X"85",X"1D",X"81",X"13",X"87",X"1D",
		X"80",X"13",X"86",X"1D",X"9F",X"88",X"0A",X"0A",X"0A",X"0A",X"90",X"07",X"69",X"7E",X"83",X"13",
		X"4F",X"6A",X"39",X"59",X"8A",X"0B",X"BA",X"CA",X"0B",X"E7",X"0B",X"85",X"0B",X"08",X"0B",X"08",
		X"0B",X"0F",X"2D",X"7F",X"18",X"1F",X"18",X"1F",X"18",X"1D",X"4C",X"61",X"87",X"84",X"0D",X"4D",
		X"61",X"A4",X"84",X"0D",X"4E",X"61",X"C6",X"62",X"65",X"82",X"13",X"5A",X"0B",X"18",X"0B",X"18",
		X"0B",X"0F",X"2D",X"7F",X"08",X"1F",X"08",X"1F",X"08",X"1D",X"58",X"83",X"0D",X"B0",X"69",X"F9",
		X"59",X"88",X"0D",X"B0",X"69",X"20",X"8A",X"0D",X"B0",X"CF",X"18",X"0D",X"B0",X"D9",X"E0",X"5A",
		X"83",X"0D",X"4E",X"69",X"D9",X"4F",X"69",X"D7",X"E0",X"B1",X"CF",X"5A",X"83",X"3A",X"69",X"D9",
		X"59",X"8F",X"9C",X"0F",X"1D",X"8B",X"0D",X"B0",X"EB",X"69",X"3D",X"16",X"8F",X"B4",X"69",X"39",
		X"3B",X"F4",X"69",X"3D",X"33",X"8B",X"19",X"69",X"3D",X"B0",X"69",X"3D",X"37",X"8C",X"0D",X"B0",
		X"C3",X"69",X"52",X"16",X"8F",X"BC",X"69",X"4F",X"3A",X"CB",X"D2",X"32",X"8C",X"19",X"D2",X"B8",
		X"D2",X"36",X"58",X"83",X"0D",X"B0",X"EF",X"8A",X"59",X"0D",X"B0",X"E1",X"18",X"0D",X"B1",X"E1",
		X"E9",X"B0",X"E4",X"EF",X"15",X"4C",X"E9",X"8F",X"09",X"15",X"4C",X"EF",X"8F",X"09",X"09",X"8F",
		X"59",X"0D",X"02",X"59",X"8A",X"0D",X"B0",X"69",X"7C",X"9F",X"07",X"FE",X"90",X"07",X"58",X"89",
		X"3E",X"60",X"16",X"2E",X"68",X"97",X"C2",X"83",X"0D",X"8D",X"09",X"2E",X"DF",X"90",X"1D",X"82",
		X"0D",X"88",X"0A",X"23",X"0E",X"10",X"0A",X"90",X"0E",X"1D",X"BA",X"DF",X"99",X"1A",X"1D",X"8B",
		X"09",X"E3",X"19",X"2C",X"81",X"0D",X"8E",X"09",X"2E",X"69",X"C1",X"90",X"1D",X"80",X"0D",X"88",
		X"0B",X"1F",X"0B",X"08",X"23",X"0E",X"10",X"0A",X"90",X"0E",X"1D",X"BA",X"69",X"C1",X"99",X"1A",
		X"1D",X"8C",X"09",X"C5",X"19",X"2C",X"91",X"88",X"1D",X"08",X"23",X"0E",X"10",X"0A",X"90",X"0E",
		X"1D",X"BA",X"D6",X"99",X"1A",X"1D",X"2C",X"92",X"DA",X"91",X"89",X"59",X"23",X"1E",X"11",X"0A",
		X"90",X"1E",X"1D",X"62",X"65",X"92",X"58",X"83",X"1D",X"59",X"8D",X"90",X"0A",X"1D",X"83",X"0D",
		X"B0",X"69",X"20",X"89",X"0A",X"9A",X"1D",X"69",X"20",X"5A",X"83",X"91",X"0F",X"87",X"1D",X"82",
		X"91",X"0F",X"23",X"0C",X"87",X"1F",X"1D",X"58",X"82",X"0D",X"5A",X"B0",X"D4",X"80",X"13",X"62",
		X"72",X"86",X"1D",X"D8",X"80",X"13",X"86",X"1D",X"5A",X"83",X"92",X"0F",X"23",X"1C",X"89",X"1D",
		X"82",X"92",X"0F",X"89",X"1F",X"1D",X"58",X"82",X"0D",X"5A",X"81",X"B0",X"F4",X"13",X"62",X"72",
		X"88",X"1D",X"69",X"20",X"13",X"88",X"1D",X"69",X"20",X"59",X"89",X"90",X"07",X"0A",X"1D",X"8D",
		X"0A",X"1D",X"5A",X"84",X"9B",X"0A",X"0A",X"58",X"83",X"91",X"1D",X"9F",X"02",X"69",X"7E",X"1B",
		X"51",X"56",X"5A",X"0D",X"23",X"01",X"08",X"0D",X"21",X"01",X"08",X"AC",X"DE",X"84",X"56",X"51",
		X"1B",X"50",X"3E",X"04",X"3C",X"59",X"89",X"0D",X"84",X"5A",X"1D",X"59",X"8A",X"0D",X"5A",X"85",
		X"1D",X"2C",X"3D",X"0A",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"9F",X"2C",X"00",X"00",X"9E",X"2C",X"00",X"00",X"9D",X"2C",X"00",X"00",X"95",X"2C",X"00",X"00",
		X"9C",X"2C",X"00",X"00",X"99",X"2C",X"00",X"00",X"97",X"2C",X"00",X"00",X"96",X"2C",X"00",X"00",
		X"9B",X"2C",X"00",X"00",X"93",X"2C",X"00",X"00",X"9A",X"2C",X"00",X"00",X"94",X"2C",X"00",X"00",
		X"91",X"2C",X"00",X"00",X"92",X"2C",X"00",X"00",X"90",X"2C",X"00",X"00",X"98",X"2C",X"00",X"00",
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
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
