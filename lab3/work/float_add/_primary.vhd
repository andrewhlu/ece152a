library verilog;
use verilog.vl_types.all;
entity float_add is
    port(
        aIn             : in     vl_logic_vector(7 downto 0);
        bIn             : in     vl_logic_vector(7 downto 0);
        result          : out    vl_logic_vector(7 downto 0)
    );
end float_add;
