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

/* This file is designed for use with ISim build 0xa0883be4 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "//ad/eng/users/y/z/yzsu/Desktop/BinaryTo7seg/Example.v";
static unsigned int ng1[] = {0U, 0U};
static int ng2[] = {10, 0};
static int ng3[] = {0, 0};
static int ng4[] = {5, 0};
static int ng5[] = {3, 0};
static int ng6[] = {1, 0};



static void Always_46_0(char *t0)
{
    char t6[8];
    char t17[8];
    char t31[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t32;
    int t33;

LAB0:    t1 = (t0 + 3168U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(46, ng0);
    t2 = (t0 + 3488);
    *((int *)t2) = 1;
    t3 = (t0 + 3200);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(47, ng0);

LAB5:    xsi_set_current_line(49, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 1608);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 4);
    xsi_set_current_line(50, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(51, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(52, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(54, ng0);
    xsi_set_current_line(54, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2248);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);

LAB6:    t2 = (t0 + 2248);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t6, 0, 8);
    xsi_vlog_signed_greatereq(t6, 32, t4, 32, t5, 32);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB7;

LAB8:    xsi_set_current_line(76, ng0);
    t2 = (t0 + 2088);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 1928);
    t7 = (t5 + 56U);
    t13 = *((char **)t7);
    t14 = (t0 + 1768);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t18 = (t0 + 1608);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    xsi_vlogtype_concat(t6, 16, 16, 4U, t20, 4, t16, 4, t13, 4, t4, 4);
    t21 = (t0 + 1448);
    xsi_vlogvar_assign_value(t21, t6, 0, 0, 16);
    goto LAB2;

LAB7:    xsi_set_current_line(55, ng0);

LAB9:    xsi_set_current_line(58, ng0);
    t13 = (t0 + 1608);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = ((char*)((ng4)));
    memset(t17, 0, 8);
    t18 = (t15 + 4);
    if (*((unsigned int *)t18) != 0)
        goto LAB11;

LAB10:    t19 = (t16 + 4);
    if (*((unsigned int *)t19) != 0)
        goto LAB11;

LAB14:    if (*((unsigned int *)t15) < *((unsigned int *)t16))
        goto LAB13;

LAB12:    *((unsigned int *)t17) = 1;

LAB13:    t21 = (t17 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t17);
    t25 = (t24 & t23);
    t26 = (t25 != 0);
    if (t26 > 0)
        goto LAB15;

LAB16:
LAB17:    xsi_set_current_line(60, ng0);
    t2 = (t0 + 1768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t6, 0, 8);
    t7 = (t4 + 4);
    if (*((unsigned int *)t7) != 0)
        goto LAB19;

LAB18:    t13 = (t5 + 4);
    if (*((unsigned int *)t13) != 0)
        goto LAB19;

LAB22:    if (*((unsigned int *)t4) < *((unsigned int *)t5))
        goto LAB21;

LAB20:    *((unsigned int *)t6) = 1;

LAB21:    t15 = (t6 + 4);
    t8 = *((unsigned int *)t15);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB23;

LAB24:
LAB25:    xsi_set_current_line(62, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t6, 0, 8);
    t7 = (t4 + 4);
    if (*((unsigned int *)t7) != 0)
        goto LAB27;

LAB26:    t13 = (t5 + 4);
    if (*((unsigned int *)t13) != 0)
        goto LAB27;

LAB30:    if (*((unsigned int *)t4) < *((unsigned int *)t5))
        goto LAB29;

LAB28:    *((unsigned int *)t6) = 1;

LAB29:    t15 = (t6 + 4);
    t8 = *((unsigned int *)t15);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB31;

LAB32:
LAB33:    xsi_set_current_line(64, ng0);
    t2 = (t0 + 2088);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t6, 0, 8);
    t7 = (t4 + 4);
    if (*((unsigned int *)t7) != 0)
        goto LAB35;

LAB34:    t13 = (t5 + 4);
    if (*((unsigned int *)t13) != 0)
        goto LAB35;

LAB38:    if (*((unsigned int *)t4) < *((unsigned int *)t5))
        goto LAB37;

LAB36:    *((unsigned int *)t6) = 1;

LAB37:    t15 = (t6 + 4);
    t8 = *((unsigned int *)t15);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB39;

LAB40:
LAB41:    xsi_set_current_line(67, ng0);
    t2 = (t0 + 1608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng6)));
    memset(t6, 0, 8);
    xsi_vlog_unsigned_lshift(t6, 4, t4, 4, t5, 32);
    t7 = (t0 + 1608);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 4);
    xsi_set_current_line(68, ng0);
    t2 = (t0 + 1768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t6, 0, 8);
    t5 = (t6 + 4);
    t7 = (t4 + 4);
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 3);
    t10 = (t9 & 1);
    *((unsigned int *)t6) = t10;
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 3);
    t22 = (t12 & 1);
    *((unsigned int *)t5) = t22;
    t13 = (t0 + 1608);
    t14 = (t0 + 1608);
    t15 = (t14 + 72U);
    t16 = *((char **)t15);
    t18 = ((char*)((ng3)));
    xsi_vlog_generic_convert_bit_index(t17, t16, 2, t18, 32, 1);
    t19 = (t17 + 4);
    t23 = *((unsigned int *)t19);
    t33 = (!(t23));
    if (t33 == 1)
        goto LAB42;

LAB43:    xsi_set_current_line(69, ng0);
    t2 = (t0 + 1768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng6)));
    memset(t6, 0, 8);
    xsi_vlog_unsigned_lshift(t6, 4, t4, 4, t5, 32);
    t7 = (t0 + 1768);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 4);
    xsi_set_current_line(70, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t6, 0, 8);
    t5 = (t6 + 4);
    t7 = (t4 + 4);
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 3);
    t10 = (t9 & 1);
    *((unsigned int *)t6) = t10;
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 3);
    t22 = (t12 & 1);
    *((unsigned int *)t5) = t22;
    t13 = (t0 + 1768);
    t14 = (t0 + 1768);
    t15 = (t14 + 72U);
    t16 = *((char **)t15);
    t18 = ((char*)((ng3)));
    xsi_vlog_generic_convert_bit_index(t17, t16, 2, t18, 32, 1);
    t19 = (t17 + 4);
    t23 = *((unsigned int *)t19);
    t33 = (!(t23));
    if (t33 == 1)
        goto LAB44;

LAB45:    xsi_set_current_line(71, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng6)));
    memset(t6, 0, 8);
    xsi_vlog_unsigned_lshift(t6, 4, t4, 4, t5, 32);
    t7 = (t0 + 1928);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 4);
    xsi_set_current_line(72, ng0);
    t2 = (t0 + 2088);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t6, 0, 8);
    t5 = (t6 + 4);
    t7 = (t4 + 4);
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 3);
    t10 = (t9 & 1);
    *((unsigned int *)t6) = t10;
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 3);
    t22 = (t12 & 1);
    *((unsigned int *)t5) = t22;
    t13 = (t0 + 1928);
    t14 = (t0 + 1928);
    t15 = (t14 + 72U);
    t16 = *((char **)t15);
    t18 = ((char*)((ng3)));
    xsi_vlog_generic_convert_bit_index(t17, t16, 2, t18, 32, 1);
    t19 = (t17 + 4);
    t23 = *((unsigned int *)t19);
    t33 = (!(t23));
    if (t33 == 1)
        goto LAB46;

LAB47:    xsi_set_current_line(73, ng0);
    t2 = (t0 + 2088);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng6)));
    memset(t6, 0, 8);
    xsi_vlog_unsigned_lshift(t6, 4, t4, 4, t5, 32);
    t7 = (t0 + 2088);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 4);
    xsi_set_current_line(74, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = (t0 + 1008U);
    t4 = (t2 + 72U);
    t5 = *((char **)t4);
    t7 = (t0 + 2248);
    t13 = (t7 + 56U);
    t14 = *((char **)t13);
    xsi_vlog_generic_get_index_select_value(t6, 1, t3, t5, 2, t14, 32, 1);
    t15 = (t0 + 2088);
    t16 = (t0 + 2088);
    t18 = (t16 + 72U);
    t19 = *((char **)t18);
    t20 = ((char*)((ng3)));
    xsi_vlog_generic_convert_bit_index(t17, t19, 2, t20, 32, 1);
    t21 = (t17 + 4);
    t8 = *((unsigned int *)t21);
    t33 = (!(t8));
    if (t33 == 1)
        goto LAB48;

LAB49:    xsi_set_current_line(54, ng0);
    t2 = (t0 + 2248);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng6)));
    memset(t6, 0, 8);
    xsi_vlog_signed_minus(t6, 32, t4, 32, t5, 32);
    t7 = (t0 + 2248);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 32);
    goto LAB6;

LAB11:    t20 = (t17 + 4);
    *((unsigned int *)t17) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB13;

LAB15:    xsi_set_current_line(59, ng0);
    t27 = (t0 + 1608);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    t30 = ((char*)((ng5)));
    memset(t31, 0, 8);
    xsi_vlog_unsigned_add(t31, 32, t29, 4, t30, 32);
    t32 = (t0 + 1608);
    xsi_vlogvar_assign_value(t32, t31, 0, 0, 4);
    goto LAB17;

LAB19:    t14 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB21;

LAB23:    xsi_set_current_line(61, ng0);
    t16 = (t0 + 1768);
    t18 = (t16 + 56U);
    t19 = *((char **)t18);
    t20 = ((char*)((ng5)));
    memset(t17, 0, 8);
    xsi_vlog_unsigned_add(t17, 32, t19, 4, t20, 32);
    t21 = (t0 + 1768);
    xsi_vlogvar_assign_value(t21, t17, 0, 0, 4);
    goto LAB25;

LAB27:    t14 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB29;

LAB31:    xsi_set_current_line(63, ng0);
    t16 = (t0 + 1928);
    t18 = (t16 + 56U);
    t19 = *((char **)t18);
    t20 = ((char*)((ng5)));
    memset(t17, 0, 8);
    xsi_vlog_unsigned_add(t17, 32, t19, 4, t20, 32);
    t21 = (t0 + 1928);
    xsi_vlogvar_assign_value(t21, t17, 0, 0, 4);
    goto LAB33;

LAB35:    t14 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB37;

LAB39:    xsi_set_current_line(65, ng0);
    t16 = (t0 + 2088);
    t18 = (t16 + 56U);
    t19 = *((char **)t18);
    t20 = ((char*)((ng5)));
    memset(t17, 0, 8);
    xsi_vlog_unsigned_add(t17, 32, t19, 4, t20, 32);
    t21 = (t0 + 2088);
    xsi_vlogvar_assign_value(t21, t17, 0, 0, 4);
    goto LAB41;

LAB42:    xsi_vlogvar_assign_value(t13, t6, 0, *((unsigned int *)t17), 1);
    goto LAB43;

LAB44:    xsi_vlogvar_assign_value(t13, t6, 0, *((unsigned int *)t17), 1);
    goto LAB45;

LAB46:    xsi_vlogvar_assign_value(t13, t6, 0, *((unsigned int *)t17), 1);
    goto LAB47;

LAB48:    xsi_vlogvar_assign_value(t15, t6, 0, *((unsigned int *)t17), 1);
    goto LAB49;

}


extern void work_m_00000000001168002668_3686629048_init()
{
	static char *pe[] = {(void *)Always_46_0};
	xsi_register_didat("work_m_00000000001168002668_3686629048", "isim/TOP_tb_isim_beh.exe.sim/work/m_00000000001168002668_3686629048.didat");
	xsi_register_executes(pe);
}
