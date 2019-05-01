library verilog;
use verilog.vl_types.all;
entity shifter is
    port(
        \in\            : in     vl_logic_vector(4 downto 0);
        distance        : in     vl_logic_vector(2 downto 0);
        direction       : in     vl_logic;
        \out\           : out    vl_logic_vector(4 downto 0)
    );
end shifter;
