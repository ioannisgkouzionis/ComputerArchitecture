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
static const char *ng0 = "C:/Users/George/Desktop/Lab2/AdderPC4.vhd";
extern char *IEEE_P_3620187407;

char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_2995467913_3212880686_p_0(char *t0)
{
    char t1[16];
    char t6[16];
    char *t2;
    char *t3;
    char *t4;
    char *t7;
    char *t8;
    int t9;
    unsigned int t10;
    char *t11;
    unsigned int t12;
    unsigned char t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;

LAB0:    xsi_set_current_line(42, ng0);

LAB3:    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 4264U);
    t4 = (t0 + 4336);
    t7 = (t6 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 0;
    t8 = (t7 + 4U);
    *((int *)t8) = 31;
    t8 = (t7 + 8U);
    *((int *)t8) = 1;
    t9 = (31 - 0);
    t10 = (t9 * 1);
    t10 = (t10 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t10;
    t8 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t1, t3, t2, t4, t6);
    t11 = (t1 + 12U);
    t10 = *((unsigned int *)t11);
    t12 = (1U * t10);
    t13 = (32U != t12);
    if (t13 == 1)
        goto LAB5;

LAB6:    t14 = (t0 + 2752);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t8, 32U);
    xsi_driver_first_trans_fast_port(t14);

LAB2:    t19 = (t0 + 2672);
    *((int *)t19) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(32U, t12, 0);
    goto LAB6;

}


extern void work_a_2995467913_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2995467913_3212880686_p_0};
	xsi_register_didat("work_a_2995467913_3212880686", "isim/Test_Datapath_isim_beh.exe.sim/work/a_2995467913_3212880686.didat");
	xsi_register_executes(pe);
}
