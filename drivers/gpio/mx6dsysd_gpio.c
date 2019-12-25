/*
 * MXC GPIO support. (c) 2008 Daniel Mack <daniel@caiaq.de>
 * Copyright 2008 Juergen Beisert, kernel@pengutronix.de
 *
 * Based on code from Freescale,
 * Copyright (C) 2004-2010 Freescale Semiconductor, Inc. All Rights Reserved.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 * MA  02110-1301, USA.
 */
#include <linux/major.h>
#include <linux/miscdevice.h>
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/init.h>
#include <linux/mm.h>
#include <linux/fs.h>
#include <linux/types.h>
#include <linux/delay.h>
#include <linux/moduleparam.h>
#include <linux/slab.h>
#include <linux/errno.h>
#include <linux/ioctl.h>
#include <linux/cdev.h>
#include <linux/sched.h>
#include <linux/string.h>
#include <linux/list.h>
#include <linux/pci.h>
#include "linux/version.h"
#include <linux/blkdev.h>
#include <linux/mm.h>
#include <linux/module.h> 
#include <linux/init.h> 
 
#include <mach/gpio.h>
#include <mach/hardware.h>
#include <mach/iomux-mx6q.h>
 
#include <asm/uaccess.h>
#include <asm/atomic.h>
#include <asm/unistd.h>
#include <asm/gpio.h>
#include <asm/irq.h>
 
/*
Set the DEVICE_NAME,you can change it 
*/
#define DEVICE_NAME "MX6DSYSD_GPIO"
 
/*
OUT level control  
1:high
0:low
Isn't it?You can read the reference mentual
*/
#define IOCTL_GPIO_HIGH	1
#define IOCTL_GPIO_LOW	0
 
#define NUM_5_18 IMX_GPIO_NR(5, 18)
#define NUM_5_19 IMX_GPIO_NR(5, 19)
#define NUM_5_21 IMX_GPIO_NR(5, 21)
#define NUM_6_02 IMX_GPIO_NR(6, 02)
#define NUM_6_03 IMX_GPIO_NR(6, 03)
#define NUM_6_04 IMX_GPIO_NR(6, 04)
 
static unsigned int num1[] = {
	NUM_5_18,
	NUM_5_19,
	NUM_5_21,
	NUM_6_02,
	NUM_6_03,
	NUM_6_04,
};
 
static long gpio_ioctl(
	struct file *file, 
	unsigned int cmd, 
	unsigned long arg)
{
	if (arg > 6)
	{
		return -EINVAL;
	}
 
	switch(cmd)
	{
		case IOCTL_GPIO_HIGH:
	
			gpio_set_value(num1[arg], 1);
			return 0;
 
		case IOCTL_GPIO_LOW:
			gpio_set_value(num1[arg], 0);
			return 0;
 
		default:
			return -EINVAL;
	}
}
 
static struct file_operations gpio_fops = {
	.owner	=		THIS_MODULE,
	.unlocked_ioctl	=	gpio_ioctl,
//	.release        = 	gpio_release,
//	.read   = 	gpio_read, 
//        .write  = 	gpio_write,
};
 
 
static struct miscdevice misc = {
	.minor = MISC_DYNAMIC_MINOR,
	.name = DEVICE_NAME,
	.fops = &gpio_fops,
};
 
static int __init gpio_init(void)
{
	int ret;
 
	int i;
	for(i = 0 ; i<6; i++){
		gpio_request(num1[i],"fsl_gpio");
		gpio_direction_output(num1[i],1);
		gpio_set_value(num1[i], 0);
	}
	ret = misc_register(&misc);
	printk (DEVICE_NAME" initialized.\n");
	return ret;
}
static void __exit gpio_exit(void)
{
	misc_deregister(&misc);
}
MODULE_LICENSE("GPL");
MODULE_AUTHOR("luhao");
module_init(gpio_init);
module_exit(gpio_exit);
