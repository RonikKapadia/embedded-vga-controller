-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- entity
entity pixel_pusher is 
    port(
        clk, en, vs, vid : in std_logic;
        pixel : in std_logic_vector(7 downto 0);
        hcount : in std_logic_vector(9 downto 0);
        R, B : out std_logic_vector(4 downto 0);
        G : out std_logic_vector(5 downto 0);
        addr : out std_logic_vector(17 downto 0)
    );
end pixel_pusher;

-- architecture
architecture pixel_pusher of pixel_pusher is
    -- intermediate signals
    signal addr_reg : unsigned(17 downto 0) := (others => '0');

begin

    addr <= std_logic_vector(addr_reg);

    process(clk)
    begin
        if rising_edge(clk) then
            if en = '1' then
                
                if (vid = '1') and (unsigned(hcount) < 480) then 
                    addr_reg <= addr_reg + 1;

                    R <= pixel(7 downto 5) & "00";
                    G <= pixel(4 downto 2) & "000";
                    B <= pixel(1 downto 0) & "000";
                else
                    R <= (others => '0');
                    G <= (others => '0');
                    B <= (others => '0');
                end if;

                if (vs = '0') then
                    addr_reg <= (others => '0');
                end if;

            else
                    R <= (others => '0');
                    G <= (others => '0');
                    B <= (others => '0');
            end if;
        end if;
    end process;

end pixel_pusher;


