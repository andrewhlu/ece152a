library verilog;
use verilog.vl_types.all;
entity decoder is
    port(
        \in\            : in     vl_logic_vector(2 downto 0);
        A               : out    vl_logic;
        B               : out    vl_logic;
        C               : out    vl_logic;
        D               : out    vl_logic;
        E               : out    vl_logic;
        F               : out    vl_logic;
        G               : out    vl_logic
    );
end decoder;
