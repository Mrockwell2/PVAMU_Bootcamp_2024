%module top

%{
#include "../S_source.hh"

extern SysSimObject trick_sys ;
extern MemoryManagerSimObject trick_mm ;
extern CheckPointRestartSimObject trick_cpr ;
extern SieSimObject trick_sie ;
extern CommandLineArgumentsSimObject trick_cmd_args ;
extern MessageSimObject trick_message ;
extern JITSimObject trick_jit ;
extern InputProcessorSimObject trick_ip ;
extern EventManagerSimObject trick_em ;
extern VariableServerSimObject trick_vs ;
extern DataRecordDispatcherSimObject trick_data_record ;
extern RTSyncSimObject trick_real_time ;
extern FrameLogSimObject trick_frame_log;
extern UnitTestSimObject trick_utest ;
extern UdUnitsSimObject trick_udunits;
extern SatelliteSimObject dyn;
extern IntegLoopSimObject dyn_integloop ;

%}

%import "build/Users/obcrawfo/trick/trick-19.8.0/trick_sims/SIM_sat2d/S_source_py.i"

extern SysSimObject trick_sys ;
extern MemoryManagerSimObject trick_mm ;
extern CheckPointRestartSimObject trick_cpr ;
extern SieSimObject trick_sie ;
extern CommandLineArgumentsSimObject trick_cmd_args ;
extern MessageSimObject trick_message ;
extern JITSimObject trick_jit ;
extern InputProcessorSimObject trick_ip ;
extern EventManagerSimObject trick_em ;
extern VariableServerSimObject trick_vs ;
extern DataRecordDispatcherSimObject trick_data_record ;
extern RTSyncSimObject trick_real_time ;
extern FrameLogSimObject trick_frame_log;
extern UnitTestSimObject trick_utest ;
extern UdUnitsSimObject trick_udunits;
extern SatelliteSimObject dyn;
extern IntegLoopSimObject dyn_integloop ;
