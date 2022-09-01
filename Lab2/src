library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity lab_2 is
Port ( A : in STD_LOGIC;
 B : in STD_LOGIC;
 C : in STD_LOGIC;
 S : in STD_LOGIC;
 F1 : out STD_LOGIC;
 F2 : out STD_LOGIC;
 L : out STD_LOGIC);
end lab_2;
architecture Behavioral of lab_2 is
begin
F1 <= S or A;
F2 <= ( S and A ) or B;
L <= C or (not S);
end Behavioral;
constraints:
set_property PACKAGE_PIN V17 [get_ports {S}]
 set_property IOSTANDARD LVCMOS33 [get_ports {S}]
set_property PACKAGE_PIN V16 [get_ports {C}]
 set_property IOSTANDARD LVCMOS33 [get_ports {C}]
set_property PACKAGE_PIN W16 [get_ports {B}]
 set_property IOSTANDARD LVCMOS33 [get_ports {B}]
set_property PACKAGE_PIN W17 [get_ports {A}]
 set_property IOSTANDARD LVCMOS33 [get_ports {A}]
set_property PACKAGE_PIN U16 [get_ports {L}]
 set_property IOSTANDARD LVCMOS33 [get_ports {L}]
set_property PACKAGE_PIN E19 [get_ports {F2}]
 set_property IOSTANDARD LVCMOS33 [get_ports {F2}]
set_property PACKAGE_PIN U19 [get_ports {F1}]
 set_property IOSTANDARD LVCMOS33 [get_ports {F1}]
simulation sources:
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
ENTITY simple_testbench IS
END simple_testbench;
ARCHITECTURE behavior OF simple_testbench IS
-- Component Declaration for the Unit Under Test (UUT)
COMPONENT lab_2
 PORT(
 A : IN std_logic;
 B : IN std_logic;
 C : IN std_logic;
 S : IN std_logic;
 F1 : OUT std_logic;
 F2 : OUT std_logic;
 L : OUT std_logic
 );
 END COMPONENT;
 --Inputs
 signal A : std_logic ;
 signal B : std_logic ;
 signal C : std_logic ;
 signal S : std_logic ;
 --Outputs
 signal F1 : std_logic;
 signal F2 : std_logic;
 signal L : std_logic;
 BEGIN
 -- Instantiate the Unit Under Test (UUT)
uut: lab_2 PORT MAP (A => A,B => B,C => C,S => S,F1 => F1,F2 => F2,L => L);
-- Stimulus process
stim_proc: process
begin
 A<='0';B<='0';C<='0'; S<='0';
 wait for 50ns;
 A<='0';B<='0';C<='0'; S<='1';
 wait for 50ns;
 A<='0';B<='0';C<='1'; S<='0';
 wait for 50ns;
 A<='0';B<='0';C<='1'; S<='1';
 wait for 50ns;
 A<='0';B<='1';C<='0'; S<='0';
 wait for 50ns;
 A<='0';B<='1';C<='0'; S<='1';
 wait for 50ns;
 A<='0';B<='1';C<='1'; S<='0';
 wait for 50ns;
 A<='0';B<='1';C<='1'; S<='1';
 wait for 50ns;
 A<='1';B<='0';C<='0'; S<='0';
 wait for 50ns;
 A<='1';B<='0';C<='0'; S<='1';
 wait for 50ns;
 A<='1';B<='0';C<='1'; S<='0';
 wait for 50ns;
 A<='1';B<='0';C<='1'; S<='1';
 wait for 50ns;
 A<='1';B<='1';C<='0'; S<='0';
 wait for 50ns;
 A<='1';B<='1';C<='0'; S<='1';
 wait for 50ns;
 A<='1';B<='1';C<='1'; S<='0';
 wait for 50ns;
 A<='1';B<='1';C<='1'; S<='0';
 wait for 50ns;
end process;
END
