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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *IEEE_P_3620187407;
char *IEEE_P_3499444699;
char *STD_TEXTIO;
char *IEEE_P_3564397177;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    work_a_3553579679_3212880686_init();
    work_a_0464935494_3212880686_init();
    work_a_2187601296_3212880686_init();
    work_a_4232939542_3212880686_init();
    work_a_1533240295_3212880686_init();
    work_a_0918691054_3212880686_init();
    work_a_1396217133_3212880686_init();
    work_a_2298824245_3212880686_init();
    work_a_2869368893_3212880686_init();
    work_a_4171879844_3212880686_init();
    work_a_1303975457_3212880686_init();
    work_a_2861575830_3212880686_init();
    work_a_0129582970_3212880686_init();
    work_a_3192036498_3212880686_init();
    work_a_0325842302_3212880686_init();
    work_a_0587449926_3212880686_init();
    work_a_0171857898_3212880686_init();
    work_a_4197530001_3212880686_init();
    work_a_0333211985_3212880686_init();
    work_a_2362559210_3212880686_init();
    work_a_2128221623_3212880686_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    work_a_2981382247_3212880686_init();
    work_a_0178828530_3212880686_init();
    work_a_0089376745_3212880686_init();
    work_a_2836026650_3212880686_init();
    work_a_1315662971_3212880686_init();
    work_a_3708388792_3212880686_init();
    work_a_3599674430_3212880686_init();
    work_a_0972602110_3212880686_init();
    work_a_2615964831_3212880686_init();
    work_a_3967920148_3212880686_init();
    std_textio_init();
    ieee_p_3564397177_init();
    work_a_2995467913_3212880686_init();
    work_a_2048222088_3212880686_init();
    work_a_4202670372_0000452272_init();
    work_a_1913148318_3212880686_init();
    work_a_1833817950_0000452272_init();
    work_a_4200723274_3212880686_init();
    work_a_4052188560_3212880686_init();
    work_a_3603242782_3212880686_init();
    work_a_0515481537_3212880686_init();
    work_a_0719001517_3212880686_init();
    work_a_0464763351_3212880686_init();
    work_a_3858450860_3212880686_init();
    work_a_2399776393_3212880686_init();
    work_a_3222946569_3212880686_init();
    work_a_3320840282_3212880686_init();
    work_a_0795765839_2372691052_init();


    xsi_register_tops("work_a_0795765839_2372691052");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    IEEE_P_3564397177 = xsi_get_engine_memory("ieee_p_3564397177");

    return xsi_run_simulation(argc, argv);

}
