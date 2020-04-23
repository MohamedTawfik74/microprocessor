
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name Microprocessor -dir "D:/Testing Traaash/MP/Microprocessor/planAhead_run_5" -part xc6slx9tqg144-2
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/Testing Traaash/MP/Microprocessor/MP.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/Testing Traaash/MP/Microprocessor} }
set_property target_constrs_file "MP.ucf" [current_fileset -constrset]
add_files [list {MP.ucf}] -fileset [get_property constrset [current_run]]
link_design
