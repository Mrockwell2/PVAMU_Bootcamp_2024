/********************************* TRICK HEADER *******************************
PURPOSE: ( Simulate a satellite orbiting the Earth. )
LIBRARY DEPENDENCY:
    ((Satellite.o))
*******************************************************************************/
#include "../include/Satellite.hh"
#include <math.h>
#include <iostream>

int Satellite::default_data() {

    thrust1_fired = 0;
    thrust2_fired = 0;

    pos[0] = 0.0;
    pos[1] = 6578000.0;
    vel[0] = 7784.40;
    vel[1] = 0.0;

    pos_tgt[0] = 0.0;
    pos_tgt[1] = 8478000;
    vel_tgt[0] = 6856.86;
    vel_tgt[1] = 0.0;

    burn1_time = 2 * M_PI * sqrt(pos[0]*pos[0] + pos[1]*pos[1]) / vel[0];

    return (0);
}

int Satellite::state_init() {
    return (0);
}

double Satellite::calc_thrust_force(double vel2, double vel1, double delta_t) {
    return( (100000.0 * (vel2 - vel1)) / delta_t  );
}


int Satellite::state_deriv( double sim_time) {

   veh1_radius = sqrt( pos[0]*pos[0] + pos[1]*pos[1]);
   veh2_radius = sqrt( pos_tgt[0]*pos_tgt[0] + pos_tgt[1]*pos_tgt[1]);

   acc[0] = -pos[0] * GRAVITATIONAL_CONSTANT * EARTH_MASS / pow(veh1_radius,3);
   acc[1] = -pos[1] * GRAVITATIONAL_CONSTANT * EARTH_MASS / pow(veh1_radius,3);

   acc_tgt[0] = -pos_tgt[0] * GRAVITATIONAL_CONSTANT * EARTH_MASS / pow(veh2_radius,3);
   acc_tgt[1] = -pos_tgt[1] * GRAVITATIONAL_CONSTANT * EARTH_MASS / pow(veh2_radius,3);

   if (thrust1_fired == 0 && sim_time >= burn1_time ) {
      double burn1_target_velocity = sqrt(2 * GRAVITATIONAL_CONSTANT * EARTH_MASS * ((1/veh1_radius) - (1/(veh1_radius+veh2_radius))));
      double burn1_force           = calc_thrust_force(burn1_target_velocity, 7784.40, 3.331e-4) ;
      acc[0] =  burn1_force / 100000.0 ;
      burn2_time =  (M_PI * sqrt(pos_tgt[0]*pos_tgt[0] + pos_tgt[1]*pos_tgt[1]) / burn1_target_velocity) + sim_time;
      thrust1_fired = 1;
   }

   if (thrust2_fired == 0 && thrust1_fired == 1 && sim_time >= burn2_time ) {
      double burn2_target_velocity = sqrt(2 * GRAVITATIONAL_CONSTANT * EARTH_MASS * ((1/veh2_radius) - (1/(veh1_radius+veh2_radius))));
      double burn2_force  = calc_thrust_force(6856.86, burn2_target_velocity, 1.407e-7) ;
      acc[0] = burn2_force / 100000;
      thrust2_fired = 1;
   }

   return(0);
}

#include "sim_services/Integrator/include/integrator_c_intf.h"

int Satellite::state_integ() {

   int integration_step;

   load_state ( &pos[0], &pos[1], &pos_tgt[0], &pos_tgt[1], &vel[0], &vel[1], &vel_tgt[0], &vel_tgt[1], (double*)0);
   load_deriv ( &vel[0], &vel[1], &vel_tgt[0], &vel_tgt[1], &acc[0], &acc[1], &acc_tgt[0], &acc_tgt[1], (double*)0);

   integration_step = integrate();

   unload_state( &pos[0], &pos[1], &pos_tgt[0], &pos_tgt[1], &vel[0], &vel[1], &vel_tgt[0], &vel_tgt[1], (double*)0);

   return(integration_step);
}

