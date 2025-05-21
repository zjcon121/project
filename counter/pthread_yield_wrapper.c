#include <sched.h>
int pthread_yield() {
    return sched_yield();
}
