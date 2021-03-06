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
char *IEEE_P_3499444699;
char *IEEE_P_3620187407;
char *IEEE_P_1242562249;
char *STD_TEXTIO;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    std_textio_init();
    ieee_p_1242562249_init();
    work_a_1007874614_3212880686_init();
    work_a_1153420228_3212880686_init();
    work_a_0123541133_3212880686_init();
    work_a_1554994704_3212880686_init();
    work_a_4169188674_3212880686_init();
    work_a_2166523021_3212880686_init();
    work_a_3961274036_3212880686_init();
    work_a_0455113383_3212880686_init();
    work_a_0290344353_3212880686_init();
    work_a_2521819606_1285209636_init();
    work_a_0832606739_3212880686_init();
    work_a_2263279024_3212880686_init();
    work_a_4062211221_2372691052_init();


    xsi_register_tops("work_a_4062211221_2372691052");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");

    return xsi_run_simulation(argc, argv);

}
