%module m2d7c369471cac3e20a0505ea0a9f0f94

%include "trick/swig/trick_swig.i"


%insert("begin") %{
#include <Python.h>
#include <cstddef>
%}

%{
#include "/Users/obcrawfo/trick/trick-19.8.0/trick_sims/SIM_sat2d/models/satellite/include/Satellite.hh"
%}

%trick_swig_class_typemap(Satellite, Satellite)



#ifndef _satellite_hh_
#define _satellite_hh_

#define GRAVITATIONAL_CONSTANT 6.674e-11
#define EARTH_MASS 5.9723e24
#define EARTH_RADIUS 6367500.0


class Satellite {
#if SWIG_VERSION > 0x040000
%pythoncode %{
    __setattr__ = _swig_setattr_nondynamic_instance_variable(object.__setattr__)
%}
#endif


    public:
        double pos[2] ;    

        double vel[2] ;    

        double acc[2] ;    


        double pos_tgt[2] ;    

        double vel_tgt[2] ;    

        double acc_tgt[2] ;    


        double veh1_radius;    

        double veh2_radius;    


        int default_data();
        int state_init();
        int state_deriv(double sim_time);
        int state_integ();

        double calc_thrust_force(double vel2, double vel1, double delta_t) ;

    private:
        int thrust1_fired;
        int thrust2_fired;
        double burn1_time;
        double burn2_time;

};
#define TRICK_SWIG_DEFINED_Satellite
#endif




#ifdef TRICK_SWIG_DEFINED_Satellite
%trick_cast_as(Satellite, Satellite)
#endif
