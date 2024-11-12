// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vcomparator_device__Syms.h"


//======================

void Vcomparator_device::trace(VerilatedVcdC* tfp, int, int) {
    tfp->spTrace()->addCallback(&Vcomparator_device::traceInit, &Vcomparator_device::traceFull, &Vcomparator_device::traceChg, this);
}
void Vcomparator_device::traceInit(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->open()
    Vcomparator_device* t = (Vcomparator_device*)userthis;
    Vcomparator_device__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    if (!Verilated::calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
                        "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vcdp->scopeEscape(' ');
    t->traceInitThis(vlSymsp, vcdp, code);
    vcdp->scopeEscape('.');
}
void Vcomparator_device::traceFull(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->dump()
    Vcomparator_device* t = (Vcomparator_device*)userthis;
    Vcomparator_device__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    t->traceFullThis(vlSymsp, vcdp, code);
}

//======================


void Vcomparator_device::traceInitThis(Vcomparator_device__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vcomparator_device* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    vcdp->module(vlSymsp->name());  // Setup signal names
    // Body
    {
        vlTOPp->traceInitThis__1(vlSymsp, vcdp, code);
    }
}

void Vcomparator_device::traceFullThis(Vcomparator_device__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vcomparator_device* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vlTOPp->traceFullThis__1(vlSymsp, vcdp, code);
    }
    // Final
    vlTOPp->__Vm_traceActivity = 0U;
}

void Vcomparator_device::traceInitThis__1(Vcomparator_device__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vcomparator_device* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->declBus(c+81,"in_word", false,-1, 3,0);
        vcdp->declBit(c+89,"out", false,-1);
        vcdp->declBus(c+81,"comparator_device in_word", false,-1, 3,0);
        vcdp->declBit(c+89,"comparator_device out", false,-1);
        vcdp->declBus(c+161,"comparator_device pattern_word", false,-1, 3,0);
        vcdp->declBus(c+1,"comparator_device xor_result", false,-1, 3,0);
        vcdp->declBus(c+9,"comparator_device mid_out", false,-1, 1,0);
        vcdp->declBit(c+97,"comparator_device xor_g_0 a", false,-1);
        vcdp->declBit(c+169,"comparator_device xor_g_0 b", false,-1);
        vcdp->declBit(c+105,"comparator_device xor_g_0 c", false,-1);
        vcdp->declBit(c+105,"comparator_device xor_g_0 notA", false,-1);
        vcdp->declBit(c+177,"comparator_device xor_g_0 notB", false,-1);
        vcdp->declBit(c+177,"comparator_device xor_g_0 midAndA", false,-1);
        vcdp->declBit(c+105,"comparator_device xor_g_0 midAndB", false,-1);
        vcdp->declBit(c+97,"comparator_device xor_g_0 notg_a a", false,-1);
        vcdp->declBit(c+105,"comparator_device xor_g_0 notg_a b", false,-1);
        vcdp->declBit(c+169,"comparator_device xor_g_0 notg_b a", false,-1);
        vcdp->declBit(c+177,"comparator_device xor_g_0 notg_b b", false,-1);
        vcdp->declBit(c+97,"comparator_device xor_g_0 andg_a a", false,-1);
        vcdp->declBit(c+177,"comparator_device xor_g_0 andg_a b", false,-1);
        vcdp->declBit(c+177,"comparator_device xor_g_0 andg_a c", false,-1);
        vcdp->declBit(c+105,"comparator_device xor_g_0 andg_b a", false,-1);
        vcdp->declBit(c+169,"comparator_device xor_g_0 andg_b b", false,-1);
        vcdp->declBit(c+105,"comparator_device xor_g_0 andg_b c", false,-1);
        vcdp->declBit(c+177,"comparator_device xor_g_0 orgate_out a", false,-1);
        vcdp->declBit(c+105,"comparator_device xor_g_0 orgate_out b", false,-1);
        vcdp->declBit(c+105,"comparator_device xor_g_0 orgate_out c", false,-1);
        vcdp->declBit(c+113,"comparator_device xor_g_1 a", false,-1);
        vcdp->declBit(c+177,"comparator_device xor_g_1 b", false,-1);
        vcdp->declBit(c+113,"comparator_device xor_g_1 c", false,-1);
        vcdp->declBit(c+121,"comparator_device xor_g_1 notA", false,-1);
        vcdp->declBit(c+169,"comparator_device xor_g_1 notB", false,-1);
        vcdp->declBit(c+113,"comparator_device xor_g_1 midAndA", false,-1);
        vcdp->declBit(c+177,"comparator_device xor_g_1 midAndB", false,-1);
        vcdp->declBit(c+113,"comparator_device xor_g_1 notg_a a", false,-1);
        vcdp->declBit(c+121,"comparator_device xor_g_1 notg_a b", false,-1);
        vcdp->declBit(c+177,"comparator_device xor_g_1 notg_b a", false,-1);
        vcdp->declBit(c+169,"comparator_device xor_g_1 notg_b b", false,-1);
        vcdp->declBit(c+113,"comparator_device xor_g_1 andg_a a", false,-1);
        vcdp->declBit(c+169,"comparator_device xor_g_1 andg_a b", false,-1);
        vcdp->declBit(c+113,"comparator_device xor_g_1 andg_a c", false,-1);
        vcdp->declBit(c+121,"comparator_device xor_g_1 andg_b a", false,-1);
        vcdp->declBit(c+177,"comparator_device xor_g_1 andg_b b", false,-1);
        vcdp->declBit(c+177,"comparator_device xor_g_1 andg_b c", false,-1);
        vcdp->declBit(c+113,"comparator_device xor_g_1 orgate_out a", false,-1);
        vcdp->declBit(c+177,"comparator_device xor_g_1 orgate_out b", false,-1);
        vcdp->declBit(c+113,"comparator_device xor_g_1 orgate_out c", false,-1);
        vcdp->declBit(c+129,"comparator_device xor_g_2 a", false,-1);
        vcdp->declBit(c+169,"comparator_device xor_g_2 b", false,-1);
        vcdp->declBit(c+137,"comparator_device xor_g_2 c", false,-1);
        vcdp->declBit(c+137,"comparator_device xor_g_2 notA", false,-1);
        vcdp->declBit(c+177,"comparator_device xor_g_2 notB", false,-1);
        vcdp->declBit(c+177,"comparator_device xor_g_2 midAndA", false,-1);
        vcdp->declBit(c+137,"comparator_device xor_g_2 midAndB", false,-1);
        vcdp->declBit(c+129,"comparator_device xor_g_2 notg_a a", false,-1);
        vcdp->declBit(c+137,"comparator_device xor_g_2 notg_a b", false,-1);
        vcdp->declBit(c+169,"comparator_device xor_g_2 notg_b a", false,-1);
        vcdp->declBit(c+177,"comparator_device xor_g_2 notg_b b", false,-1);
        vcdp->declBit(c+129,"comparator_device xor_g_2 andg_a a", false,-1);
        vcdp->declBit(c+177,"comparator_device xor_g_2 andg_a b", false,-1);
        vcdp->declBit(c+177,"comparator_device xor_g_2 andg_a c", false,-1);
        vcdp->declBit(c+137,"comparator_device xor_g_2 andg_b a", false,-1);
        vcdp->declBit(c+169,"comparator_device xor_g_2 andg_b b", false,-1);
        vcdp->declBit(c+137,"comparator_device xor_g_2 andg_b c", false,-1);
        vcdp->declBit(c+177,"comparator_device xor_g_2 orgate_out a", false,-1);
        vcdp->declBit(c+137,"comparator_device xor_g_2 orgate_out b", false,-1);
        vcdp->declBit(c+137,"comparator_device xor_g_2 orgate_out c", false,-1);
        vcdp->declBit(c+145,"comparator_device xor_g_3 a", false,-1);
        vcdp->declBit(c+177,"comparator_device xor_g_3 b", false,-1);
        vcdp->declBit(c+145,"comparator_device xor_g_3 c", false,-1);
        vcdp->declBit(c+153,"comparator_device xor_g_3 notA", false,-1);
        vcdp->declBit(c+169,"comparator_device xor_g_3 notB", false,-1);
        vcdp->declBit(c+145,"comparator_device xor_g_3 midAndA", false,-1);
        vcdp->declBit(c+177,"comparator_device xor_g_3 midAndB", false,-1);
        vcdp->declBit(c+145,"comparator_device xor_g_3 notg_a a", false,-1);
        vcdp->declBit(c+153,"comparator_device xor_g_3 notg_a b", false,-1);
        vcdp->declBit(c+177,"comparator_device xor_g_3 notg_b a", false,-1);
        vcdp->declBit(c+169,"comparator_device xor_g_3 notg_b b", false,-1);
        vcdp->declBit(c+145,"comparator_device xor_g_3 andg_a a", false,-1);
        vcdp->declBit(c+169,"comparator_device xor_g_3 andg_a b", false,-1);
        vcdp->declBit(c+145,"comparator_device xor_g_3 andg_a c", false,-1);
        vcdp->declBit(c+153,"comparator_device xor_g_3 andg_b a", false,-1);
        vcdp->declBit(c+177,"comparator_device xor_g_3 andg_b b", false,-1);
        vcdp->declBit(c+177,"comparator_device xor_g_3 andg_b c", false,-1);
        vcdp->declBit(c+145,"comparator_device xor_g_3 orgate_out a", false,-1);
        vcdp->declBit(c+177,"comparator_device xor_g_3 orgate_out b", false,-1);
        vcdp->declBit(c+145,"comparator_device xor_g_3 orgate_out c", false,-1);
        vcdp->declBit(c+17,"comparator_device nor_g_1 a", false,-1);
        vcdp->declBit(c+25,"comparator_device nor_g_1 b", false,-1);
        vcdp->declBit(c+33,"comparator_device nor_g_1 c", false,-1);
        vcdp->declBit(c+41,"comparator_device nor_g_2 a", false,-1);
        vcdp->declBit(c+49,"comparator_device nor_g_2 b", false,-1);
        vcdp->declBit(c+57,"comparator_device nor_g_2 c", false,-1);
        vcdp->declBit(c+65,"comparator_device or_g_out a", false,-1);
        vcdp->declBit(c+73,"comparator_device or_g_out b", false,-1);
        vcdp->declBit(c+89,"comparator_device or_g_out c", false,-1);
    }
}

void Vcomparator_device::traceFullThis__1(Vcomparator_device__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vcomparator_device* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->fullBus(c+1,(vlTOPp->comparator_device__DOT__xor_result),4);
        vcdp->fullBus(c+9,(vlTOPp->comparator_device__DOT__mid_out),2);
        vcdp->fullBit(c+17,((1U & (IData)(vlTOPp->comparator_device__DOT__xor_result))));
        vcdp->fullBit(c+25,((1U & ((IData)(vlTOPp->comparator_device__DOT__xor_result) 
                                   >> 1U))));
        vcdp->fullBit(c+33,((1U & (~ ((IData)(vlTOPp->comparator_device__DOT__xor_result) 
                                      | ((IData)(vlTOPp->comparator_device__DOT__xor_result) 
                                         >> 1U))))));
        vcdp->fullBit(c+41,((1U & ((IData)(vlTOPp->comparator_device__DOT__xor_result) 
                                   >> 2U))));
        vcdp->fullBit(c+49,((1U & ((IData)(vlTOPp->comparator_device__DOT__xor_result) 
                                   >> 3U))));
        vcdp->fullBit(c+57,((1U & (~ (((IData)(vlTOPp->comparator_device__DOT__xor_result) 
                                       >> 2U) | ((IData)(vlTOPp->comparator_device__DOT__xor_result) 
                                                 >> 3U))))));
        vcdp->fullBit(c+65,((1U & (IData)(vlTOPp->comparator_device__DOT__mid_out))));
        vcdp->fullBit(c+73,((1U & ((IData)(vlTOPp->comparator_device__DOT__mid_out) 
                                   >> 1U))));
        vcdp->fullBus(c+81,(vlTOPp->in_word),4);
        vcdp->fullBit(c+89,(vlTOPp->out));
        vcdp->fullBit(c+97,((1U & (IData)(vlTOPp->in_word))));
        vcdp->fullBit(c+105,((1U & (~ (IData)(vlTOPp->in_word)))));
        vcdp->fullBit(c+113,((1U & ((IData)(vlTOPp->in_word) 
                                    >> 1U))));
        vcdp->fullBit(c+121,((1U & (~ ((IData)(vlTOPp->in_word) 
                                       >> 1U)))));
        vcdp->fullBit(c+129,((1U & ((IData)(vlTOPp->in_word) 
                                    >> 2U))));
        vcdp->fullBit(c+137,((1U & (~ ((IData)(vlTOPp->in_word) 
                                       >> 2U)))));
        vcdp->fullBit(c+145,((1U & ((IData)(vlTOPp->in_word) 
                                    >> 3U))));
        vcdp->fullBit(c+153,((1U & (~ ((IData)(vlTOPp->in_word) 
                                       >> 3U)))));
        vcdp->fullBus(c+161,(5U),4);
        vcdp->fullBit(c+169,(1U));
        vcdp->fullBit(c+177,(0U));
    }
}
