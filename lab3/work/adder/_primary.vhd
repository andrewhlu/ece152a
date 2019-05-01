library verilog;
use verilog.vl_types.all;
entity adder is
    port(
        A               : in     vl_logic_vector(4 downto 0);
        B               : in     vl_logic_vector(4 downto 0);
        S               : out    vl_logic_vector(4 downto 0);
        Cout            : out    vl_logic
    );
end adder;
