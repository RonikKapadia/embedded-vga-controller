-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- entity
entity image_top_tb is
end image_top_tb;

-- architecture
architecture image_top_tb of image_top_tb is
    -- components
    component image_top is
        port(
            clk: in std_logic;
            vga_hs, vga_vs: out std_logic;
            vga_r, vga_b: out std_logic_vector(4 downto 0);
            vga_g: out std_logic_vector(5 downto 0)
        );
    end component;

    -- intermedite signals
    signal clk: std_logic;
    signal vga_hs: std_logic;
    signal vga_vs: std_logic;
    signal vga_r: std_logic_vector(4 downto 0);
    signal vga_g: std_logic_vector(5 downto 0);
    signal vga_b: std_logic_vector(4 downto 0);

begin
    img: image_top
    port map(
        clk => clk,
        vga_hs => vga_hs,
        vga_vs => vga_vs,
        vga_r => vga_r,
        vga_g => vga_g,
        vga_b => vga_b
    );

    process begin
        clk <= '0';
        wait for 4 ns;
        clk <= '1';
        wait for 4 ns;
    end process;

    process begin
        wait for 100000 ns;
        report "End of testbench" severity FAILURE;
    end process;

end image_top_tb;