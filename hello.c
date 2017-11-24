/* hello.c */
#include <linux/init.h>
#include <linux/module.h>
#include <linux/init.h>
#include <linux/mm.h>
#include <linux/errno.h>
#include <linux/types.h>
#include <linux/init.h>

static int hello_major = 244;
static int cur_major=0;
MODULE_LICENSE("leo BSD/GPL");
static int hello_init(void)
{
    
    printk(KERN_ALERT "Hello, world\n");
    dev_t devno=MKDEV(hello_major,0);
    int result=0;
    if(hello_major)
    {
        result=register_chrdev_region(devno,1,"hello");
    }    
    else
        result=alloc_chrdev_region(&devno,0,1,"hello");
    cur_major=result;
    printk(KERN_ALERT "current index %d\n",cur_major);
    return 0;
}
static void hello_exit(void)
{
    printk(KERN_ALERT "Goodbye, Hello world\n");
}
module_init(hello_init);
module_exit(hello_exit);
