
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name Microprocessor -dir "C:/Users/Tefa/Desktop/LAST_YEAR/Microprocessor/planAhead_run_3" -part xc6slx9tqg144-2
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/Tefa/Desktop/LAST_YEAR/Microprocessor/Microprocessor.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/Tefa/Desktop/LAST_YEAR/Microprocessor} {ipcore_dir} }
add_files [list {ipcore_dir/RamMips.ncf}] -fileset [get_property constrset [current_run]]
set_property target_constrs_file "E:/Digital Career/My_Final_Study/Projects/test/Microprocessor/Microprocessor.ucf" [current_fileset -constrset]
add_files [list {E:/Digital Career/My_Final_Study/Projects/test/Microprocessor/Microprocessor.ucf}] -fileset [get_property constrset [current_run]]
link_design
