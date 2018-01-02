#include "libuv-android.h"
#include "linux-syscalls.h"
#include <sys/epoll.h>
#include <gui/DisplayEventReceiver.h>

using namespace android;

static DisplayEventReceiver* displayEvent;
static epoll_event vsyncEvent;
static epoll_event vsyncItem[1];
static int vsyncFd;
static uva_vsync_cb vsyncCb;


int uva_vsync_init(uv_loop_t* loop, void (*uva_vsync_cb)()) {

	displayEvent = new DisplayEventReceiver();
	displayEvent->setVsyncRate(1);

	int fd = displayEvent->getFd();

	int vsyncFd = epoll_create(8);

	vsyncEvent.events = EPOLLIN | EPOLLOUT;
	vsyncEvent.data.fd = fd;

	return epoll_ctl(vsyncFd, fd, EPOLL_CTL_ADD, &vsyncEvent);

}


int wait_vsync() {

	int count = epoll_wait(vsyncFd, vsyncItem, 1, -1);
	return 1;
}
