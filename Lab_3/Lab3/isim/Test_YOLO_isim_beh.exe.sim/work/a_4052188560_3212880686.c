/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xc3576ebc */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/George/Desktop/Lab2/Zero.vhd";



static void work_a_4052188560_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;

LAB0:    xsi_set_current_line(46, ng0);
    t1 = (t0 + 4908);
    t3 = (24U != 24U);
    if (t3 == 1)
        goto LAB2;

LAB3:    t4 = (t0 + 3176);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 24U);
    xsi_driver_first_trans_delta(t4, 0U, 24U, 0LL);
    xsi_set_current_line(47, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t9 = (31 - 7);
    t10 = (t9 * 1U);
    t11 = (0 + t10);
    t1 = (t2 + t11);
    t4 = (t0 + 3176);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 8U);
    xsi_driver_first_trans_delta(t4, 24U, 8U, 0LL);
    t1 = (t0 + 3080);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_size_not_matching(24U, 24U, 0);
    goto LAB3;

}

static void work_a_4052188560_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(51, ng0);

LAB3:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 3240);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 32U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 3096);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_4052188560_3212880686_init()
{
	static char *pe[] = {(void *)work_a_4052188560_3212880686_p_0,(void *)work_a_4052188560_3212880686_p_1};
	xsi_register_didat("work_a_4052188560_3212880686", "isim/Test_YOLO_isim_beh.exe.sim/work/a_4052188560_3212880686.didat");
	xsi_register_executes(pe);
}
