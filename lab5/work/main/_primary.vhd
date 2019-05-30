library verilog;
use verilog.vl_types.all;
entity main is
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        left            : in     vl_logic;
        right           : in     vl_logic;
        hazard          : in     vl_logic;
        brake           : in     vl_logic;
        dim_clock       : in     vl_logic;
        lights          : in     vl_logic;
        \out\           : out    vl_logic_vector(5 downto 0)
    );
end main;
