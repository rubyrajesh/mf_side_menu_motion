#import <UIKit/UIKit.h>

extern "C" {
    void ruby_sysinit(int *, char ***);
    void ruby_init(void);
    void ruby_init_loadpath(void);
    void ruby_script(const char *);
    void ruby_set_argv(int, char **);
    void rb_vm_init_compiler(void);
    void rb_vm_init_jit(void);
    void rb_vm_aot_feature_provide(const char *, void *);
    void *rb_vm_top_self(void);
    void rb_rb2oc_exc_handler(void);
    void rb_exit(int);
void MREP_E6058C6743E8426B8C486CD2EE07BCA0(void *, void *);
void MREP_56C6DFCB0762437DB80CAE2F50BC2B8B(void *, void *);
void MREP_C68CFEC7366A4D178ED964F3FEBFD6D2(void *, void *);
void MREP_A94F87D549CF44A9956D31113B9E87CB(void *, void *);
}

extern "C"
void
RubyMotionInit(int argc, char **argv)
{
    static bool initialized = false;
    if (!initialized) {
	ruby_init();
	ruby_init_loadpath();
        if (argc > 0) {
	    const char *progname = argv[0];
	    ruby_script(progname);
	}
	try {
	    void *self = rb_vm_top_self();
MREP_E6058C6743E8426B8C486CD2EE07BCA0(self, 0);
MREP_56C6DFCB0762437DB80CAE2F50BC2B8B(self, 0);
MREP_C68CFEC7366A4D178ED964F3FEBFD6D2(self, 0);
MREP_A94F87D549CF44A9956D31113B9E87CB(self, 0);
	}
	catch (...) {
	    rb_rb2oc_exc_handler();
	}
	initialized = true;
    }
}
