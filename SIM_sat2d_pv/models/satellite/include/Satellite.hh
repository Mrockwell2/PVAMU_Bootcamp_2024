/*************************************************************************
PURPOSE: (Simulate a satellite orbiting the Earth.)
LIBRARY DEPENDENCIES:
    ((satellite/src/Satellite.o))
**************************************************************************/
#ifndef _satellite_hh_
#define _satellite_hh_

#define GRAVITATIONAL_CONSTANT 6.674e-11
#define EARTH_MASS 5.9723e24
#define EARTH_RADIUS 6367500.0

class Satellite {

    public:
        double pos[2] ;    /* m     xyz-position */
        double vel[2] ;    /* m/s   xyz-velocity */
        double acc[2] ;    /* m/s2  xyz-acceleration  */

        double pos_tgt[2] ;    /* m     xyz-position */
        double vel_tgt[2] ;    /* m/s   xyz-velocity */
        double acc_tgt[2] ;    /* m/s2  xyz-acceleration  */

        double veh1_radius;    /* m xyz-velocity */
        double veh2_radius;    /* m xyz-velocity */

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
#endif



