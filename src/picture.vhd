-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- entity
entity picture is 
    port(
        clk, en : in std_logic;
        addr : in std_logic_vector(17 downto 0);
        pixel : out std_logic_vector(7 downto 0)
    );
end picture;

-- architecture
architecture picture of picture is
    -- intermediate signals

begin

    process(clk)
    begin
        if rising_edge(clk) then
            if en = '1' then

                if ((unsigned(addr) mod 2) = 0) then
                    pixel <= "00000000";
                else
                    pixel <= "11111111";
                end if;

            end if;
        end if;
    end process;

end picture;