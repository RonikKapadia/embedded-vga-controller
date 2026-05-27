-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- entity
entity image_top is
    port(
        clk: in std_logic;
        vga_hs, vga_vs: out std_logic;
        vga_r, vga_b: out std_logic_vector(4 downto 0);
        vga_g: out std_logic_vector(5 downto 0)
    );
end image_top;

-- architecture
architecture image_top of image_top is
    signal en, vid, pix_vs: std_logic;
    signal hcount, vcount : std_logic_vector(9 downto 0);
    signal addr: std_logic_vector(17 downto 0);
    signal pixel: std_logic_vector(7 downto 0);

    component clock_div is
        port(
            clk: in std_logic;
            div: out std_logic
        );
    end component;

    component picture is
        port(
            clka : in std_logic;
            addra : in std_logic_vector(17 downto 0);
            douta : out std_logic_vector(7 downto 0)
        );
    end component;

    component pixel_pusher is
        port(
            clk, en, vs, vid : in std_logic;
            pixel : in std_logic_vector(7 downto 0);
            hcount : in std_logic_vector(9 downto 0);
            R, B : out std_logic_vector(4 downto 0);
            G : out std_logic_vector(5 downto 0);
            addr : out std_logic_vector(17 downto 0)
        );
    end component;

    component vga_ctrl is
        port(
            clk, en : in std_logic;
            hcount, vcount : out std_logic_vector(9 downto 0);
            vid, hs, vs : out std_logic
        );
    end component;

begin

    vga_vs <= pix_vs;

    cd: clock_div
    port map(
        clk => clk,
        div => en
    );

    pic: picture
    port map(
        clka => clk,
        addra => addr,
        douta => pixel
    );

    pix: pixel_pusher
    port map(
        clk => clk,
        en => en,
        vs => pix_vs,
        vid => vid,
        pixel => pixel,
        hcount => hcount,
        R => vga_r,
        G => vga_g,
        B => vga_b,
        addr => addr
    );

    vga: vga_ctrl
    port map(
        clk => clk,
        en => en,
        hs => vga_hs,
        vs => pix_vs,
        hcount => hcount,
        vcount => vcount,
        vid => vid
    );

end image_top;