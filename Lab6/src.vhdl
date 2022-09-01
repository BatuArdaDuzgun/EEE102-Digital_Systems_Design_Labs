library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Top_modul is
Port (
 input : in std_logic_vector (2 downto 0);
 LED : out std_logic_vector (9 downto 0));
end Top_modul;
architecture Behavioral of Top_modul is
begin
LED(0) <= input(0);
LED(1) <= input(0);
LED(2) <= input(1);
LED(3) <= input(1);
LED(4) <= input(1);
LED(5) <= input(2);
LED(6) <= input(2);
LED(7) <= input(2);
LED(8) <= input(2);
LED(9) <= input(2);
end Behavioral;
constrants
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
#Sch name = JC4
set_property PACKAGE_PIN P18 [get_ports {input[0]}]
 set_property IOSTANDARD LVCMOS33 [get_ports {input[0]}]
#Sch name = JC3
  set_property PACKAGE_PIN N17 [get_ports {input[1]}]
 set_property IOSTANDARD LVCMOS33 [get_ports {input[1]}]
#Sch name = JC2
set_property PACKAGE_PIN M18 [get_ports {input[2]}]
 set_property IOSTANDARD LVCMOS33 [get_ports {input[2]}]
  
