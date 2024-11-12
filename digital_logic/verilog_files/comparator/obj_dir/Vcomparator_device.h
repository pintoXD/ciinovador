// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Primary design header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef _VCOMPARATOR_DEVICE_H_
#define _VCOMPARATOR_DEVICE_H_  // guard

#include "verilated.h"

//==========

class Vcomparator_device__Syms;
class Vcomparator_device_VerilatedVcd;


//----------

VL_MODULE(Vcomparator_device) {
  public:
    
    // PORTS
    // The application code writes and reads these signals to
    // propagate new values into/out from the Verilated model.
    VL_IN8(in_word,3,0);
    VL_OUT8(out,0,0);
    
    // LOCAL SIGNALS
    // Internals; generally not touched by application code
    CData/*3:0*/ comparator_device__DOT__xor_result;
    CData/*1:0*/ comparator_device__DOT__mid_out;
    
    // LOCAL VARIABLES
    // Internals; generally not touched by application code
    IData/*31:0*/ __Vm_traceActivity;
    
    // INTERNAL VARIABLES
    // Internals; generally not touched by application code
    Vcomparator_device__Syms* __VlSymsp;  // Symbol table
    
    // CONSTRUCTORS
  private:
    VL_UNCOPYABLE(Vcomparator_device);  ///< Copying not allowed
  public:
    /// Construct the model; called by application code
    /// The special name  may be used to make a wrapper with a
    /// single model invisible with respect to DPI scope names.
    Vcomparator_device(const char* name = "TOP");
    /// Destroy the model; called (often implicitly) by application code
    ~Vcomparator_device();
    /// Trace signals in the model; called by application code
    void trace(VerilatedVcdC* tfp, int levels, int options = 0);
    
    // API METHODS
    /// Evaluate the model.  Application must call when inputs change.
    void eval();
    /// Simulation complete, run final blocks.  Application must call on completion.
    void final();
    
    // INTERNAL METHODS
  private:
    static void _eval_initial_loop(Vcomparator_device__Syms* __restrict vlSymsp);
  public:
    void __Vconfigure(Vcomparator_device__Syms* symsp, bool first);
  private:
    static QData _change_request(Vcomparator_device__Syms* __restrict vlSymsp);
  public:
    static void _combo__TOP__1(Vcomparator_device__Syms* __restrict vlSymsp);
  private:
    void _ctor_var_reset() VL_ATTR_COLD;
  public:
    static void _eval(Vcomparator_device__Syms* __restrict vlSymsp);
  private:
#ifdef VL_DEBUG
    void _eval_debug_assertions();
#endif  // VL_DEBUG
  public:
    static void _eval_initial(Vcomparator_device__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _eval_settle(Vcomparator_device__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void traceChgThis(Vcomparator_device__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__2(Vcomparator_device__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__3(Vcomparator_device__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceFullThis(Vcomparator_device__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceFullThis__1(Vcomparator_device__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceInitThis(Vcomparator_device__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceInitThis__1(Vcomparator_device__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceInit(VerilatedVcd* vcdp, void* userthis, uint32_t code);
    static void traceFull(VerilatedVcd* vcdp, void* userthis, uint32_t code);
    static void traceChg(VerilatedVcd* vcdp, void* userthis, uint32_t code);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

//----------


#endif  // guard
