library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity time_pilot_sprite_color_lut is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(7 downto 0);
	data : out std_logic_vector(3 downto 0)
);
end entity;

architecture prom of time_pilot_sprite_color_lut is
	type rom is array(0 to  255) of std_logic_vector(3 downto 0);
	signal rom_data: rom := (
		"0000","1101","1111","0101","0000","1110","0110","1010","0000","0100","1001","0001","0000","0100","1001","0001",
		"0000","0100","1001","0001","0000","1100","0101","0001","0000","1110","0101","0001","0000","1101","0101","0001",
		"0000","1011","0101","0001","0000","0001","1111","0100","0000","0001","1111","0100","0000","0001","1111","0100",
		"0000","1000","0111","1100","0000","0001","1111","0100","0000","0001","1111","0100","0000","1010","0101","0001",
		"0000","0101","1001","0001","0000","1011","1101","0101","0000","0110","0101","0001","0000","1010","0011","0001",
		"0000","1100","0011","0001","0000","1110","0011","0001","0000","1101","0011","0001","0000","1011","0011","0001",
		"0000","1110","1100","1111","0000","0101","0011","0001","0000","1110","0110","1001","0000","0100","1001","0101",
		"0000","1001","1110","0110","0000","0100","1110","0101","0000","1001","1110","0101","0000","1011","0101","0001",
		"0000","1100","0111","0001","0000","0101","1111","1001","0000","0101","0100","1001","0000","1010","0011","0001",
		"0000","1100","0010","0011","0000","1100","0110","0011","0000","1100","0110","1001","0000","1100","0110","0001",
		"0000","1110","0110","1100","0000","1100","0010","1111","0000","1100","0010","1001","0000","1100","0010","0001",
		"0000","0001","1000","1111","0000","1110","0110","1111","0000","1001","1010","1111","0000","0101","0110","1111",
		"0000","1011","1001","0101","0000","1010","0110","1100","0000","1010","0110","1001","0000","1010","0010","1001",
		"0000","0110","0001","1111","0000","0100","0001","1111","0000","1010","0011","0001","0000","1010","0010","1100",
		"0000","0101","1001","0001","0000","1010","0010","0001","0000","1110","0010","1001","0000","1110","0010","1100",
		"0000","0001","0100","1111","0000","0001","0100","1111","0000","1111","1111","1111","0000","0000","0000","0000");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;