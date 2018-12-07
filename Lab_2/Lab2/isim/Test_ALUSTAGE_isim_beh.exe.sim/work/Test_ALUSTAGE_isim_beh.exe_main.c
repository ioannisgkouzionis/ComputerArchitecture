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


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    work_a_0972602110_3212880686_init();
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
    work_a_3086978161_2372691052_init();


    xsi_register_tops("work_a_3086978161_2372691052");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");

    return xsi_run_simulation(argc, argv);

}
