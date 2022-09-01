Top module:
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
entity top_module is
Port ( Sw : in STD_LOGIC_VECTOR (11 downto 0);
slc : in STD_LOGIC_VECTOR (1 downto 0);
LED : out STD_LOGIC_VECTOR (11 downto 0));
end top_module;
architecture Behavioral of top_module is
signal addition : STD_LOGIC_VECTOR (6 downto 0);
signal subtraction : STD_LOGIC_VECTOR (5 downto 0);
signal multiplication : STD_LOGIC_VECTOR (11 downto 0);
component adder
port(
Anum1 : in STD_LOGIC_VECTOR (5 downto 0);
Anum2 : in STD_LOGIC_VECTOR (5 downto 0);
Aoutput : out STD_LOGIC_VECTOR (6 downto 0)
end component;
component subtracter
port(
Snum1 : in STD_LOGIC_VECTOR (5 downto 0);
Snum2 : in STD_LOGIC_VECTOR (5 downto 0);
Soutput : out STD_LOGIC_VECTOR (5 downto 0));
end component;
component multiplier
port(
Mnum1 : in STD_LOGIC_VECTOR (5 downto 0);
Mnum2 : in STD_LOGIC_VECTOR (5 downto 0);
Moutput : out STD_LOGIC_VECTOR (11 downto 0));
end component;
component multiplexer
port(
Msum : in STD_LOGIC_VECTOR (6 downto 0);
Msub : in STD_LOGIC_VECTOR (5 downto 0);
Mmul : in STD_LOGIC_VECTOR (11 downto 0);
Mslc : in STD_LOGIC_VECTOR (1 downto 0);
MLED : out STD_LOGIC_VECTOR (11 downto 0));
end component;
begin
uut1 : adder port map(Anum1 => Sw(11 downto 6),Anum2 => Sw(5 downto 0),Aoutput =>
addition);
uut2 : subtracter port map(Snum1 => Sw(11 downto 6),Snum2 => Sw(5 downto 0),Soutput
=> subtraction);
uut3 : multiplier port map(Mnum1 => Sw(11 downto 6),Mnum2 => Sw(5 downto 0),Moutput
=> multiplication);
uut4 : multiplexer port map(Msum => addition , Msub => subtraction , Mmul =>
multiplication , Mslc => slc , MLED => LED);
end Behavioral;
adder:
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
entity adder is
port(
Anum1 : in STD_LOGIC_VECTOR (5 downto 0);
Anum2 : in STD_LOGIC_VECTOR (5 downto 0);
Aoutput : out STD_LOGIC_VECTOR (6 downto 0));
end adder;
architecture Behavioral of adder is
begin
Aoutput <= ("0" & Anum1) + ("0" & Anum2);
end Behavioral;
multiplier:
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
entity multiplier is
port(
Mnum1 : in STD_LOGIC_VECTOR (5 downto 0);
Mnum2 : in STD_LOGIC_VECTOR (5 downto 0);
Moutput : out STD_LOGIC_VECTOR (11 downto 0));
end multiplier;
architecture Behavioral of multiplier is
begin
Moutput <= Mnum1 * Mnum2;
end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
subtracter:
entity subtracter is
port(
Snum1 : in STD_LOGIC_VECTOR (5 downto 0);
Snum2 : in STD_LOGIC_VECTOR (5 downto 0);
Soutput : out STD_LOGIC_VECTOR (5 downto 0));
end subtracter;
architecture Behavioral of subtracter is
begin
process (Snum1,Snum2)
begin
if Snum1 > Snum2 then
Soutput <= Snum1 - Snum2;
elsif Snum2 > Snum1 then
Soutput <= Snum2 - Snum1;
else
Soutput <= "000000";
end if;
end process;
end Behavioral;
multiplexer:
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
entity multiplexer is
port(
Msum : in STD_LOGIC_VECTOR (6 downto 0);
Msub : in STD_LOGIC_VECTOR (5 downto 0);
Mmul : in STD_LOGIC_VECTOR (11 downto 0);
Mslc : in STD_LOGIC_VECTOR (1 downto 0);
MLED : out STD_LOGIC_VECTOR (11 downto 0));
end multiplexer;
architecture Behavioral of multiplexer is
begin
process (Msum, Msub, Mmul, Mslc)
begin
if Mslc = "00" then
MLED(5 downto 0) <= "000001";
MLED(11 downto 6) <= "000000";
elsif Mslc = "01" then
MLED(6 downto 0) <= Msum;
MLED(11 downto 7) <= "00000";
elsif Mslc = "11" then
MLED <= Mmul;
elsif Mslc = "10" then
MLED(5 downto 0) <= Msub;
MLED(11 downto 6) <= "000000";
end if;
end process;
end Behavioral;
Constrants:
# Switches
set_property PACKAGE_PIN V17 [get_ports {Sw[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Sw[0]}]
set_property PACKAGE_PIN V16 [get_ports {Sw[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Sw[1]}]
set_property PACKAGE_PIN W16 [get_ports {Sw[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Sw[2]}]
set_property PACKAGE_PIN W17 [get_ports {Sw[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Sw[3]}]
set_property PACKAGE_PIN W15 [get_ports {Sw[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Sw[4]}]
set_property PACKAGE_PIN V15 [get_ports {Sw[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Sw[5]}]
set_property PACKAGE_PIN W14 [get_ports {Sw[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Sw[6]}]
set_property PACKAGE_PIN W13 [get_ports {Sw[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Sw[7]}]
set_property PACKAGE_PIN V2 [get_ports {Sw[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Sw[8]}]
set_property PACKAGE_PIN T3 [get_ports {Sw[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Sw[9]}]
set_property PACKAGE_PIN T2 [get_ports {Sw[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Sw[10]}]
set_property PACKAGE_PIN R3 [get_ports {Sw[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Sw[11]}]
set_property PACKAGE_PIN T1 [get_ports {slc[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {slc[0]}]
set_property PACKAGE_PIN R2 [get_ports {slc[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {slc[1]}]
# LEDs
set_property PACKAGE_PIN U16 [get_ports {LED[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[0]}]
set_property PACKAGE_PIN E19 [get_ports {LED[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[1]}]
set_property PACKAGE_PIN U19 [get_ports {LED[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[2]}]
set_property PACKAGE_PIN V19 [get_ports {LED[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[3]}]
set_property PACKAGE_PIN W18 [get_ports {LED[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[4]}]
set_property PACKAGE_PIN U15 [get_ports {LED[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[5]}]
set_property PACKAGE_PIN U14 [get_ports {LED[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[6]}]
set_property PACKAGE_PIN V14 [get_ports {LED[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[7]}]
set_property PACKAGE_PIN V13 [get_ports {LED[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[8]}]
set_property PACKAGE_PIN V3 [get_ports {LED[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[9]}]
set_property PACKAGE_PIN W3 [get_ports {LED[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[10]}]
set_property PACKAGE_PIN U3 [get_ports {LED[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[11]}]
Testbench for adder:
library ieee;
use ieee.std_logic_1164.all;
entity tb_adder is
end tb_adder;
architecture tb of tb_adder is
 component adder
 port (Anum1 : in std_logic_vector (5 downto 0);
 Anum2 : in std_logic_vector (5 downto 0);
 Aoutput : out std_logic_vector (6 downto 0));
 end component;
 signal Anum1 : std_logic_vector (5 downto 0);
 signal Anum2 : std_logic_vector (5 downto 0);
 signal Aoutput : std_logic_vector (6 downto 0);
begin
 dut : adder
 port map (Anum1 => Anum1,
 Anum2 => Anum2,
 Aoutput => Aoutput);
 stimuli : process
 begin
 -- EDIT Adapt initialization as needed
 Anum1 <= "000011";
 Anum2 <= "000101";
wait for 50ns;
 Anum1 <= "000110";
 Anum2 <= "000101";
wait for 50ns;
 Anum1 <= "001000";
 Anum2 <= "001111";
wait for 50ns;
 Anum1 <= "100000";
 Anum2 <= "010101";
wait for 50ns;
 Anum1 <= "001011";
 Anum2 <= "000101";
wait for 50ns;
 Anum1 <= "111110";
 Anum2 <= "100001";
wait for 50ns;
 end process;
end tb;
-- Configuration block below is required by some simulators. Usually no need to edit.
configuration cfg_tb_adder of tb_adder is
 for tb
 end for;
end cfg_tb_adder;
Testbench for multiplier:
library ieee;
use ieee.std_logic_1164.all;
entity tb_multiplier is
end tb_multiplier;
architecture tb of tb_multiplier is
 component multiplier
 port (Mnum1 : in std_logic_vector (5 downto 0);
 Mnum2 : in std_logic_vector (5 downto 0);
 Moutput : out std_logic_vector (11 downto 0));
 end component;
 signal Mnum1 : std_logic_vector (5 downto 0);
 signal Mnum2 : std_logic_vector (5 downto 0);
 signal Moutput : std_logic_vector (11 downto 0);
begin 
 dut : multiplier
 port map (Mnum1 => Mnum1,
 Mnum2 => Mnum2,
 Moutput => Moutput);
 stimuli : process
 begin
 Mnum1 <= "000011";
 Mnum2 <= "000101";
wait for 50ns;
 Mnum1 <= "000110";
 Mnum2 <= "000101";
wait for 50ns;
 Mnum1 <= "001000";
 Mnum2 <= "001111";
wait for 50ns;
 Mnum1 <= "100000";
 Mnum2 <= "010101";
wait for 50ns;
 Mnum1 <= "001011";
 Mnum2 <= "000101";
wait for 50ns;
 Mnum1 <= "111110";
 Mnum2 <= "100001";
wait for 50ns;
  end process;
end tb;
-- Configuration block below is required by some simulators. Usually no need to edit.
configuration cfg_tb_multiplier of tb_multiplier is
 for tb
 end for;
end cfg_tb_multiplier; 
  
  
  
