library verilog;
use verilog.vl_types.all;
entity main is
    port(
        clock           : in     vl_logic;
        max_count       : in     vl_logic_vector(2 downto 0);
        enable          : in     vl_logic;
        reset           : in     vl_logic;
        direction       : in     vl_logic;
        A               : out    vl_logic;
        B               : out    vl_logic;
        C               : out    vl_logic;
        D               : out    vl_logic;
        E               : out    vl_logic;
        F               : out    vl_logic;
        G               : out    vl_logic
    );
end main;
