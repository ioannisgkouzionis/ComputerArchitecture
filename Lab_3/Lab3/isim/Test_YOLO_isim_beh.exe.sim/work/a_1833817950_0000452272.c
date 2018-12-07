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
static const char *ng0 = "C:/Users/George/Desktop/Lab2/Data_MEM.vhd";
extern char *IEEE_P_3620187407;

int ieee_p_3620187407_sub_514432868_3965413181(char *, char *, char *);


char *work_a_1833817950_0000452272_sub_4024452969_4251431050(char *t1)
{
    char t2[128];
    char t4[32];
    char t13[32768];
    char *t0;
    char *t5;
    char *t6;
    int t7;
    unsigned int t8;
    char *t9;
    int t10;
    char *t11;
    char *t12;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    int t19;
    int t20;
    char *t21;
    char *t23;
    char *t24;
    int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned char t28;

LAB0:    t5 = (t4 + 0U);
    t6 = (t5 + 0U);
    *((int *)t6) = 1023;
    t6 = (t5 + 4U);
    *((int *)t6) = 0;
    t6 = (t5 + 8U);
    *((int *)t6) = -1;
    t7 = (0 - 1023);
    t8 = (t7 * -1);
    t8 = (t8 + 1);
    t6 = (t5 + 12U);
    *((unsigned int *)t6) = t8;
    t6 = (t4 + 16U);
    t9 = (t6 + 0U);
    *((int *)t9) = 31;
    t9 = (t6 + 4U);
    *((int *)t9) = 0;
    t9 = (t6 + 8U);
    *((int *)t9) = -1;
    t10 = (0 - 31);
    t8 = (t10 * -1);
    t8 = (t8 + 1);
    t9 = (t6 + 12U);
    *((unsigned int *)t9) = t8;
    t9 = (t2 + 4U);
    t11 = (t1 + 3952);
    t12 = (t9 + 88U);
    *((char **)t12) = t11;
    t14 = (t9 + 56U);
    *((char **)t14) = t13;
    xsi_type_set_default_value(t11, t13, 0);
    t15 = (t9 + 64U);
    t16 = (t11 + 80U);
    t17 = *((char **)t16);
    *((char **)t15) = t17;
    t18 = (t9 + 80U);
    *((unsigned int *)t18) = 32768U;
    t19 = 0;
    t20 = 1023;

LAB2:    if (t19 <= t20)
        goto LAB3;

LAB5:    t5 = (t9 + 56U);
    t6 = *((char **)t5);
    t28 = (32768U != 32768U);
    if (t28 == 1)
        goto LAB7;

LAB8:    t0 = xsi_get_transient_memory(32768U);
    memcpy(t0, t6, 32768U);

LAB1:    return t0;
LAB3:    t21 = (t1 + 38424);
    t23 = (t9 + 56U);
    t24 = *((char **)t23);
    t25 = (t19 - 1023);
    t8 = (t25 * -1);
    xsi_vhdl_check_range_of_index(1023, 0, -1, t19);
    t26 = (32U * t8);
    t27 = (0 + t26);
    t23 = (t24 + t27);
    memcpy(t23, t21, 32U);

LAB4:    if (t19 == t20)
        goto LAB5;

LAB6:    t7 = (t19 + 1);
    t19 = t7;
    goto LAB2;

LAB7:    xsi_size_not_matching(32768U, 32768U, 0);
    goto LAB8;

LAB9:;
}

static void work_a_1833817950_0000452272_p_0(char *t0)
{
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    char *t12;
    int t13;
    int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;

LAB0:    xsi_set_current_line(60, ng0);
    t2 = (t0 + 992U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 3312);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(61, ng0);
    t4 = (t0 + 1192U);
    t8 = *((char **)t4);
    t9 = *((unsigned char *)t8);
    t10 = (t9 == (unsigned char)3);
    if (t10 != 0)
        goto LAB8;

LAB10:
LAB9:    xsi_set_current_line(64, ng0);
    t2 = (t0 + 1832U);
    t4 = *((char **)t2);
    t2 = (t0 + 1352U);
    t5 = *((char **)t2);
    t2 = (t0 + 5524U);
    t13 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t5, t2);
    t14 = (t13 - 1023);
    t15 = (t14 * -1);
    xsi_vhdl_check_range_of_index(1023, 0, -1, t13);
    t16 = (32U * t15);
    t17 = (0 + t16);
    t8 = (t4 + t17);
    t11 = (t0 + 3456);
    t12 = (t11 + 56U);
    t18 = *((char **)t12);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t8, 32U);
    xsi_driver_first_trans_fast_port(t11);
    goto LAB3;

LAB5:    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(62, ng0);
    t4 = (t0 + 1512U);
    t11 = *((char **)t4);
    t4 = (t0 + 1352U);
    t12 = *((char **)t4);
    t4 = (t0 + 5524U);
    t13 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t12, t4);
    t14 = (t13 - 1023);
    t15 = (t14 * -1);
    t16 = (32U * t15);
    t17 = (0U + t16);
    t18 = (t0 + 3392);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t11, 32U);
    xsi_driver_first_trans_delta(t18, t17, 32U, 0LL);
    goto LAB9;

}


extern void work_a_1833817950_0000452272_init()
{
	static char *pe[] = {(void *)work_a_1833817950_0000452272_p_0};
	static char *se[] = {(void *)work_a_1833817950_0000452272_sub_4024452969_4251431050};
	xsi_register_didat("work_a_1833817950_0000452272", "isim/Test_YOLO_isim_beh.exe.sim/work/a_1833817950_0000452272.didat");
	xsi_register_executes(pe);
	xsi_register_subprogram_executes(se);
}
