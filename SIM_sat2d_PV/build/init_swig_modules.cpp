#include <Python.h>
#if PY_VERSION_HEX >= 0x03000000
extern "C" {

PyObject * PyInit__mcc3aa680d110b2cef781526b89cd7469(void) ; /* /Users/obcrawfo/trick/trick-19.8.0/trick_sims/SIM_sat2d/S_source.hh */
PyObject * PyInit__m2d7c369471cac3e20a0505ea0a9f0f94(void) ; /* /Users/obcrawfo/trick/trick-19.8.0/trick_sims/SIM_sat2d/models/satellite/include/Satellite.hh */
PyObject * PyInit__sim_services(void) ;
PyObject * PyInit__top(void) ;
PyObject * PyInit__swig_double(void) ;
PyObject * PyInit__swig_int(void) ;
PyObject * PyInit__swig_ref(void) ;

void init_swig_modules(void) {

    PyImport_AppendInittab("_m2d7c369471cac3e20a0505ea0a9f0f94", PyInit__m2d7c369471cac3e20a0505ea0a9f0f94) ;
    PyImport_AppendInittab("_mcc3aa680d110b2cef781526b89cd7469", PyInit__mcc3aa680d110b2cef781526b89cd7469) ;
    PyImport_AppendInittab("_sim_services", PyInit__sim_services) ;
    PyImport_AppendInittab("_top", PyInit__top) ;
    PyImport_AppendInittab("_swig_double", PyInit__swig_double) ;
    PyImport_AppendInittab("_swig_int", PyInit__swig_int) ;
    PyImport_AppendInittab("_swig_ref", PyInit__swig_ref) ;
    return ;
}

}
#else
extern "C" {

void init_mcc3aa680d110b2cef781526b89cd7469(void) ; /* /Users/obcrawfo/trick/trick-19.8.0/trick_sims/SIM_sat2d/S_source.hh */
void init_m2d7c369471cac3e20a0505ea0a9f0f94(void) ; /* /Users/obcrawfo/trick/trick-19.8.0/trick_sims/SIM_sat2d/models/satellite/include/Satellite.hh */
void init_sim_services(void) ;
void init_top(void) ;
void init_swig_double(void) ;
void init_swig_int(void) ;
void init_swig_ref(void) ;

void init_swig_modules(void) {

    init_m2d7c369471cac3e20a0505ea0a9f0f94() ;
    init_mcc3aa680d110b2cef781526b89cd7469() ;
    init_sim_services() ;
    init_top() ;
    init_swig_double() ;
    init_swig_int() ;
    init_swig_ref() ;
    return ;
}

}
#endif
