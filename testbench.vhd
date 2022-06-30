library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity testbench is 
end testbench;

architecture behavior of testbench is
component Boot
port( x, q: in std_logic_vector(7 downto 0);
      a: out std_logic_vector(15 downto 0));
end component;

signal A : STD_LOGIC_VECTOR (7 downto 0):= "00000011";
signal B : STD_LOGIC_VECTOR (7 downto 0):= "00000100";

signal MUL : STD_LOGIC_VECTOR(15 downto 0);
begin
uut: Boot PORT MAP(x => A, q => B, a => MUL);
--stim_proc: process
--begin
--insert stimulus here
--A<="00000011"; B<="00000100"; wait for 500 fs;
--A<="00000110"; B<="00000111"; wait for 500 fs;
--A<="00001011"; B<="00000100"; wait for 500 fs;
--wait;
--end process;
end behavior;