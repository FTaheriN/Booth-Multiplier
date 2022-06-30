library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
   
entity Boot is
port( x, q: in std_logic_vector(7 downto 0);
      a: out std_logic_vector(15 downto 0));
end Boot;
   
architecture boot of Boot is
begin
           
	process(x, q)
	variable tmp: std_logic_vector(15 downto 0);
   variable s,p : std_logic_vector(7 downto 0);
	variable ql : std_logic;
   variable i:integer;

   begin
		tmp := "0000000000000000";
		s := q;
		ql := '0';
		tmp(7 downto 0) := x;
                   
		for i in 0 to 7 loop
			if(tmp(0) = '1' and ql = '0') then
				p := (tmp(15 downto 8));
            tmp(15 downto 8) := (p - s);
                         
         elsif(tmp(0) = '0' and ql = '1') then
				p := (tmp(15 downto 8));
            tmp(15 downto 8) := (p + s);
                         
         end if;
         	
			ql := tmp (0);
         tmp(14 downto 0) := tmp(15 downto 1);
			tmp(15) := tmp(14);
                      
       end loop;
                   
       a(15 downto 0) <= tmp(15 downto 0);
                   
	end process;
               
end boot;