// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vcomparator_device__Syms.h"


//======================

void Vcomparator_device::traceChg(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->dump()
    Vcomparator_device* t = (Vcomparator_device*)userthis;
    Vcomparator_device__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    if (vlSymsp->getClearActivity()) {
        t->traceChgThis(vlSymsp, vcdp, code);
    }
}

//======================


void Vcomparator_device::traceChgThis(Vcomparator_device__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vcomparator_device* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        if (VL_UNLIKELY((1U & (vlTOPp->__Vm_traceActivity 
                               | (vlTOPp->__Vm_traceActivity 
                                  >> 1U))))) {
            vlTOPp->traceChgThis__2(vlSymsp, vcdp, code);
        }
        vlTOPp->traceChgThis__3(vlSymsp, vcdp, code);
    }
    // Final
    vlTOPp->__Vm_traceActivity = 0U;
}

void Vcomparator_device::traceChgThis__2(Vcomparator_device__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vcomparator_device* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->chgBus(c+1,(vlTOPp->comparator_device__DOT__xor_result),4);
        vcdp->chgBus(c+9,(vlTOPp->comparator_device__DOT__mid_out),2);
        vcdp->chgBit(c+17,((1U & (IData)(vlTOPp->comparator_device__DOT__xor_result))));
        vcdp->chgBit(c+25,((1U & ((IData)(vlTOPp->comparator_device__DOT__xor_result) 
                                  >> 1U))));
        vcdp->chgBit(c+33,((1U & (~ ((IData)(vlTOPp->comparator_device__DOT__xor_result) 
                                     | ((IData)(vlTOPp->comparator_device__DOT__xor_result) 
                                        >> 1U))))));
        vcdp->chgBit(c+41,((1U & ((IData)(vlTOPp->comparator_device__DOT__xor_result) 
                                  >> 2U))));
        vcdp->chgBit(c+49,((1U & ((IData)(vlTOPp->comparator_device__DOT__xor_result) 
                                  >> 3U))));
        vcdp->chgBit(c+57,((1U & (~ (((IData)(vlTOPp->comparator_device__DOT__xor_result) 
                                      >> 2U) | ((IData)(vlTOPp->comparator_device__DOT__xor_result) 
                                                >> 3U))))));
        vcdp->chgBit(c+65,((1U & (IData)(vlTOPp->comparator_device__DOT__mid_out))));
        vcdp->chgBit(c+73,((1U & ((IData)(vlTOPp->comparator_device__DOT__mid_out) 
                                  >> 1U))));
    }
}

void Vcomparator_device::traceChgThis__3(Vcomparator_device__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vcomparator_device* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->chgBus(c+81,(vlTOPp->in_word),4);
        vcdp->chgBit(c+89,(vlTOPp->out));
        vcdp->chgBit(c+97,((1U & (IData)(vlTOPp->in_word))));
        vcdp->chgBit(c+105,((1U & (~ (IData)(vlTOPp->in_word)))));
        vcdp->chgBit(c+113,((1U & ((IData)(vlTOPp->in_word) 
                                   >> 1U))));
        vcdp->chgBit(c+121,((1U & (~ ((IData)(vlTOPp->in_word) 
                                      >> 1U)))));
        vcdp->chgBit(c+129,((1U & ((IData)(vlTOPp->in_word) 
                                   >> 2U))));
        vcdp->chgBit(c+137,((1U & (~ ((IData)(vlTOPp->in_word) 
                                      >> 2U)))));
        vcdp->chgBit(c+145,((1U & ((IData)(vlTOPp->in_word) 
                                   >> 3U))));
        vcdp->chgBit(c+153,((1U & (~ ((IData)(vlTOPp->in_word) 
                                      >> 3U)))));
    }
}
