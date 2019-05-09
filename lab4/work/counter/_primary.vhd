library verilog;
use verilog.vl_types.all;
entity counter is
    port(
        clock           : in     vl_logic;
        max_count       : in     vl_logic_vector(2 downto 0);
        enable          : in     vl_logic;
        reset           : in     vl_logic;
        direction       : in     vl_logic;
        count           : out    vl_logic_vector(2 downto 0)
    );
end counter;
