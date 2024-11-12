// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vcomparator_device.h for the primary calling header

#include "Vcomparator_device.h"
#include "Vcomparator_device__Syms.h"

//==========

VL_CTOR_IMP(Vcomparator_device) {
    Vcomparator_device__Syms* __restrict vlSymsp = __VlSymsp = new Vcomparator_device__Syms(this, name());
    Vcomparator_device* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Reset internal values
    
    // Reset structure values
    _ctor_var_reset();
}

void Vcomparator_device::__Vconfigure(Vcomparator_device__Syms* vlSymsp, bool first) {
    if (0 && first) {}  // Prevent unused
    this->__VlSymsp = vlSymsp;
}

Vcomparator_device::~Vcomparator_device() {
    delete __VlSymsp; __VlSymsp=NULL;
}

void Vcomparator_device::eval() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vcomparator_device::eval\n"); );
    Vcomparator_device__Syms* __restrict vlSymsp = this->__VlSymsp;  // Setup global symbol table
    Vcomparator_device* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
#ifdef VL_DEBUG
    // Debug assertions
    _eval_debug_assertions();
#endif  // VL_DEBUG
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Clock loop\n"););
        vlSymsp->__Vm_activity = true;
        _eval(vlSymsp);
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = _change_request(vlSymsp);
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("comparator_device.sv", 1, "",
                "Verilated model didn't converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

void Vcomparator_device::_eval_initial_loop(Vcomparator_device__Syms* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    _eval_initial(vlSymsp);
    vlSymsp->__Vm_activity = true;
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        _eval_settle(vlSymsp);
        _eval(vlSymsp);
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = _change_request(vlSymsp);
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("comparator_device.sv", 1, "",
                "Verilated model didn't DC converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

VL_INLINE_OPT void Vcomparator_device::_combo__TOP__1(Vcomparator_device__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomparator_device::_combo__TOP__1\n"); );
    Vcomparator_device* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->comparator_device__DOT__xor_result = ((0xeU 
                                                   & (IData)(vlTOPp->comparator_device__DOT__xor_result)) 
                                                  | (1U 
                                                     & (~ (IData)(vlTOPp->in_word))));
    vlTOPp->comparator_device__DOT__xor_result = ((0xdU 
                                                   & (IData)(vlTOPp->comparator_device__DOT__xor_result)) 
                                                  | (2U 
                                                     & (IData)(vlTOPp->in_word)));
    vlTOPp->comparator_device__DOT__xor_result = ((0xbU 
                                                   & (IData)(vlTOPp->comparator_device__DOT__xor_result)) 
                                                  | (4U 
                                                     & ((~ 
                                                         ((IData)(vlTOPp->in_word) 
                                                          >> 2U)) 
                                                        << 2U)));
    vlTOPp->comparator_device__DOT__xor_result = ((7U 
                                                   & (IData)(vlTOPp->comparator_device__DOT__xor_result)) 
                                                  | (8U 
                                                     & (IData)(vlTOPp->in_word)));
    vlTOPp->comparator_device__DOT__mid_out = ((2U 
                                                & (IData)(vlTOPp->comparator_device__DOT__mid_out)) 
                                               | (1U 
                                                  & (~ 
                                                     ((IData)(vlTOPp->comparator_device__DOT__xor_result) 
                                                      | ((IData)(vlTOPp->comparator_device__DOT__xor_result) 
                                                         >> 1U)))));
    vlTOPp->comparator_device__DOT__mid_out = ((1U 
                                                & (IData)(vlTOPp->comparator_device__DOT__mid_out)) 
                                               | (2U 
                                                  & ((~ 
                                                      (((IData)(vlTOPp->comparator_device__DOT__xor_result) 
                                                        >> 2U) 
                                                       | ((IData)(vlTOPp->comparator_device__DOT__xor_result) 
                                                          >> 3U))) 
                                                     << 1U)));
    vlTOPp->out = (1U & ((IData)(vlTOPp->comparator_device__DOT__mid_out) 
                         | ((IData)(vlTOPp->comparator_device__DOT__mid_out) 
                            >> 1U)));
}

void Vcomparator_device::_eval(Vcomparator_device__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomparator_device::_eval\n"); );
    Vcomparator_device* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->_combo__TOP__1(vlSymsp);
    vlTOPp->__Vm_traceActivity = (2U | vlTOPp->__Vm_traceActivity);
}

void Vcomparator_device::_eval_initial(Vcomparator_device__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomparator_device::_eval_initial\n"); );
    Vcomparator_device* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void Vcomparator_device::final() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomparator_device::final\n"); );
    // Variables
    Vcomparator_device__Syms* __restrict vlSymsp = this->__VlSymsp;
    Vcomparator_device* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void Vcomparator_device::_eval_settle(Vcomparator_device__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomparator_device::_eval_settle\n"); );
    Vcomparator_device* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->_combo__TOP__1(vlSymsp);
    vlTOPp->__Vm_traceActivity = (1U | vlTOPp->__Vm_traceActivity);
}

VL_INLINE_OPT QData Vcomparator_device::_change_request(Vcomparator_device__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomparator_device::_change_request\n"); );
    Vcomparator_device* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    return __req;
}

#ifdef VL_DEBUG
void Vcomparator_device::_eval_debug_assertions() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomparator_device::_eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((in_word & 0xf0U))) {
        Verilated::overWidthError("in_word");}
}
#endif  // VL_DEBUG

void Vcomparator_device::_ctor_var_reset() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomparator_device::_ctor_var_reset\n"); );
    // Body
    in_word = VL_RAND_RESET_I(4);
    out = VL_RAND_RESET_I(1);
    comparator_device__DOT__xor_result = VL_RAND_RESET_I(4);
    comparator_device__DOT__mid_out = VL_RAND_RESET_I(2);
    __Vm_traceActivity = 0;
}
