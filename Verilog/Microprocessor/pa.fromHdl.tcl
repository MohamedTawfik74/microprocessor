
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Microprocessor -dir "C:/Users/Tefa/Desktop/LAST_YEAR/Microprocessor/planAhead_run_4" -part xc6slx9tqg144-2
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "E:/Digital Career/My_Final_Study/Projects/test/Microprocessor/Microprocessor.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {../signextension/signextension.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../registerfile/registerfile.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../programcounter/programcounter.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../output_port/output_port.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../mux_4_1/mux_4_1.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../mux_2_1/mux_2_1.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../mux8_1/mux8_1.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../insmem/insmem.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../input_port/input_port.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../datamem/datamem.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../controlunit/controlunit.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../alu/alu.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Microprocessor.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top Microprocessor $srcset
add_files [list {E:/Digital Career/My_Final_Study/Projects/test/Microprocessor/Microprocessor.ucf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/RamMips.ncf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx9tqg144-2
