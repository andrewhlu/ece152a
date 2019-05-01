library verilog;
use verilog.vl_types.all;
entity big_number_first is
    port(
        aIn             : in     vl_logic_vector(7 downto 0);
        bIn             : in     vl_logic_vector(7 downto 0);
        aOut            : out    vl_logic_vector(7 downto 0);
        bOut            : out    vl_logic_vector(7 downto 0)
    );
end big_number_first;
