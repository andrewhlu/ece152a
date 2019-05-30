library verilog;
use verilog.vl_types.all;
entity dim is
    port(
        \in\            : in     vl_logic_vector(5 downto 0);
        clock           : in     vl_logic;
        lights          : in     vl_logic;
        \out\           : out    vl_logic_vector(5 downto 0)
    );
end dim;
