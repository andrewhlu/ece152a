library verilog;
use verilog.vl_types.all;
entity lab1_top is
    port(
        LEFT_pushbutton : in     vl_logic;
        RIGHT_pushbutton: in     vl_logic;
        A               : in     vl_logic_vector(3 downto 0);
        B               : in     vl_logic_vector(3 downto 0);
        result          : out    vl_logic_vector(3 downto 0)
    );
end lab1_top;
