#ifndef UV_ANDROID_H_
#define UV_ANDROID_H_

#include <uv.h>


typedef void (*uva_vsync_cb)();

int init_vsync(uv_loop_t* loop, void (*uva_vsync_cb)());


#endif
