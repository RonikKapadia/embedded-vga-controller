-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- entity
entity vga_ctrl_tb is
end vga_ctrl_tb;

architecture vga_ctrl_tb of vga_ctrl_tb is 
    -- components
    component vga_ctrl
        port(
            clk, en : in std_logic;
            hcount, vcount : out std_logic_vector(9 downto 0);
            vid, hs, vs : out std_logic
        );
    end component;

    -- intermedite signals
    signal clk, en : std_logic;
    signal hcount, vcount : std_logic_vector(9 downto 0);
    signal vid, hs, vs : std_logic;

begin
    -- port mapping
    u1 : vga_ctrl
    port map(
        clk => clk,
        en => en,
        hcount => hcount,
        vcount => vcount, 
        vid => vid,
        hs => hs,
        vs => vs
    );

    -- 125 MHz clock
    process begin
        clk <= '0';
        wait for 4 ns;
        clk <= '1';
        wait for 4 ns;
    end process;
    
    -- 25 MHz enable
    process begin
        en <= '0';
        wait for 36 ns;
        en <= '1';
        wait for 4 ns;
    end process;

    -- main
    process begin
        wait for 100000 ns;
        report "End of testbench" severity FAILURE;
    end process;

end vga_ctrl_tb;