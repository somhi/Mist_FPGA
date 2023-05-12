-- Audio for Kee Games Ultra Tank
-- First attempt at modeling the analog sound circuits used in Ultra Tank, may be room for improvement as
-- I do not have a real board to compare.
-- (c) 2017 James Sweet
--
-- This is free software: you can redistribute
-- it and/or modify it under the terms of the GNU General
-- Public License as published by the Free Software
-- Foundation, either version 3 of the License, or (at your
-- option) any later version.
--
-- This is distributed in the hope that it will
-- be useful, but WITHOUT ANY WARRANTY; without even the
-- implied warranty of MERCHANTABILITY or FITNESS FOR A
-- PARTICULAR PURPOSE. See the GNU General Public License
-- for more details.

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity audio is 
port(		
			Clk_6					: in  std_logic;
			Reset_n				: in	std_logic;
			Load_n				: in	std_logic_vector(8 downto 1);
			Fire1					: in  std_logic;
			Fire2					: in  std_logic;
			Write_Explosion_n	: in  std_logic;
			Attract				: in  std_logic;
			Attract_n			: in  std_logic;
			PRAM					: in	std_logic_vector(7 downto 0);
			DBus_n				: in  std_logic_vector(7 downto 0);
			HCount				: in  std_logic_vector(8 downto 0);
			VCount				: in  std_logic_vector(7 downto 0);
			Audio1				: out std_logic_vector(6 downto 0);
			Audio2	   		: out std_logic_vector(6 downto 0));
end audio;

architecture rtl of audio is
signal H4							: std_logic;
signal V2							: std_logic;

signal Noise						: std_logic;
signal Noise_Shift				: std_logic_vector(15 downto 0);
signal Shift_in  					: std_logic;

signal Crash						: std_logic_vector(3 downto 0);
signal Explosion					: std_logic_vector(3 downto 0);

signal Mtr1_Freq					: std_logic_vector(3 downto 0);
signal Mtr2_Freq					: std_logic_vector(3 downto 0);
signal Motor1_speed				: std_logic_vector(3 downto 0);
signal Motor1_snd					: std_logic_vector(5 downto 0);
signal Motor2_speed				: std_logic_vector(3 downto 0);
signal Motor2_snd					: std_logic_vector(5 downto 0);

signal Screech1					: std_logic := '0';
signal Screech2					: std_logic := '0';
signal Shell_fire1				: std_logic_vector(3 downto 0) := (others => '0');
signal Shell_fire2				: std_logic_vector(3 downto 0) := (others => '0');

signal ena_count					: std_logic_vector(10 downto 0) := (others => '0');
signal ena_3k						: std_logic := '0';

signal explosion_prefilter    : std_logic_vector(3 downto 0);
signal explosion_filter_t1    : std_logic_vector(3 downto 0);
signal explosion_filter_t2    : std_logic_vector(3 downto 0);
signal explosion_filter_t3    : std_logic_vector(3 downto 0);
signal explosion_filtered     : std_logic_vector(5 downto 0);


begin

-- HCount
-- (0) 1H 	3 MHz
-- (1) 2H   1.5MHz
-- (2) 4H	750 kHz
-- (3) 8H	375 kHz
-- (4) 16H	187 kHz
-- (5) 32H	93 kHz
-- (6) 64H	46 kHz
-- (7) 128H 23 kHz
-- (8) 256H 12 kHz

H4 <= HCount(2);
V2 <= VCount(1);

-- Generate the 3kHz clock enable used by the filter
Enable: process(clk_6)
begin
	if rising_edge(CLK_6) then
		ena_count <= ena_count + "1";
		ena_3k <= '0';
		if (ena_count(10 downto 0) = "00000000000") then
			ena_3k <= '1';
		end if;
	end if;
end process;


-- LFSR that generates pseudo-random noise
Noise_gen: process(Attract_n, V2)
begin
	if (attract_n = '0') then
		noise_shift <= (others => '0');
		noise <= '0';
	elsif rising_edge(V2) then
		shift_in <= not(noise_shift(6) xor noise_shift(8));
		noise_shift <= shift_in & noise_shift(15 downto 1);
		noise <= noise_shift(0); 
	end if;
end process;


-- Screech sound used for shell fire. These can be tuned slightly differently to model variations in analog sound hardware.
ShellFire1: entity work.screech
generic map( -- These values can be tweaked to tune the screech sound
		Inc1 => 24, -- Ramp increase rate when noise = 0
		Inc2 => 33, -- Ramp increase rate when noise = 1
		Dec1 => 29, -- Ramp decrease rate when noise = 0
		Dec2 => 16  -- Ramp decrease rate when noise = 1
		)
port map(
		Clk => H4,
		Noise => noise,
		Screech_out => screech1
		);
		
		
ShellFire2: entity work.screech
generic map( -- These values can be tweaked to tune the screech sound
		Inc1 => 24, -- Ramp increase rate when noise = 0
		Inc2 => 34, -- Ramp increase rate when noise = 1
		Dec1 => 23, -- Ramp decrease rate when noise = 0
		Dec2 => 12  -- Ramp decrease rate when noise = 1
		)
port map(
		Clk => H4,
		Noise => noise,
		Screech_out => screech2
		);

-- Convert shell fire screech sound from 1 bit to 4 bits wide and enable via fire1 and fire2 signals
Fire_ctrl: process(fire1, fire2, screech1, screech2)
begin
	if (fire1 and screech1) = '1' then
		shell_fire1 <= "1111";
	else
		shell_fire1 <= "0000";
	end if;
	
	if (fire2 and screech2) = '1' then
		shell_fire2 <= "1111";
	else
		shell_fire2 <= "0000";
	end if;
end process;
		
	
Explosion_sound: process(Clk_6, DBus_n, Write_Explosion_n, Explosion, noise)		
begin
	if rising_edge(clk_6) then
		if Write_Explosion_n = '0' then
			explosion <= not DBus_n(3 downto 0);
		end if;
		if noise = '1' then
			explosion_prefilter <= explosion;
		else
			explosion_prefilter <= "0000";
		end if;
	end if;
end process;

---- Very simple low pass filter, borrowed from MikeJ's Asteroids code
Crash_filter: process(clk_6)
begin
	if rising_edge(clk_6) then
		if (ena_3k = '1') then
			explosion_filter_t1 <= explosion_prefilter;
			explosion_filter_t2 <= explosion_filter_t1;
			explosion_filter_t3 <= explosion_filter_t2;
		end if;
		explosion_filtered <=  ("00" & explosion_filter_t1) +
								     ('0'  & explosion_filter_t2 & '0') +
								     ("00" & explosion_filter_t3);
	end if;
end process;	


Motor1_latch: process(Load_n, PRAM)
begin
	if Load_n(1) = '0' then
		Motor1_speed <= PRAM(3 downto 0);
	end if;
end process;

Motor1: entity work.EngineSound 
generic map( 
		Freq_tune => 50 -- Tuning pot for engine sound frequency
		)
port map(		
		Clk_6 => clk_6,
	   Reset => Attract,	
		Ena_3k => ena_3k,
		EngineData => motor1_speed,
		Motor => motor1_snd
		);
	

Motor2_latch: process(Load_n, PRAM)
begin
	if Load_n(2) = '0' then
		Motor2_speed <= PRAM(3 downto 0);
	end if;
end process;
	
Motor2: entity work.EngineSound 
generic map( 
		Freq_tune => 48 -- Tuning pot for engine sound frequency
		)
port map(		
		Clk_6 => clk_6, 
		Reset => Attract,
		Ena_3k => ena_3k,
		EngineData => motor2_speed,
		Motor => motor2_snd
		);		
	
	
-- Audio mixer, also mutes sound in attract mode
Audio1 <= ('0' & motor1_snd) + ("00" & shell_fire1) + ('0' & explosion_filtered); -- when attract = '0'
				--else "0000000";
				
Audio2 <= ('0' & motor2_snd) + ("00" & shell_fire2) + ('0' & explosion_filtered); -- when attract = '0'
				--else "0000000";	
		

end rtl;