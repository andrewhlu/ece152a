library verilog;
use verilog.vl_types.all;
entity test is
    port(
        aIn             : in     vl_logic_vector(7 downto 0);
        aOut            : out    vl_logic_vector(7 downto 0)
    );
end test;
