# Copyright 2005 The Android Open Source Project

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_CPPFLAGS += -std=c++11
LOCAL_CFLAGS += -Wall -fPIE -ansi \
	-fvisibility=hidden \
	-g \
	--std=gnu89 \
	-pedantic \
	-Wall \
	-Wextra \
	-Wno-unused-parameter \
	-Wstrict-prototypes \
	
LOCAL_LDLIBS += -lm -ldl -lrt
LOCAL_LDFLAGS += -fPIE -pie
LOCAL_C_INCLUDES += $(LOCAL_PATH)/src $(LOCAL_PATH)/include/


LOCAL_SRC_FILES:= \
	src/fs-poll.c \
	src/heap-inl.h \
	src/inet.c \
	src/queue.h \
	src/threadpool.c \
	src/uv-data-getter-setters.c \
	src/uv-common.c \
	src/uv-common.h \
	src/version.c \
	src/unix/async.c \
	src/unix/atomic-ops.h \
	src/unix/core.c \
	src/unix/dl.c \
	src/unix/fs.c \
	src/unix/getaddrinfo.c \
	src/unix/getnameinfo.c \
	src/unix/internal.h \
	src/unix/loop.c \
	src/unix/loop-watcher.c \
	src/unix/pipe.c \
	src/unix/poll.c \
	src/unix/process.c \
	src/unix/signal.c \
	src/unix/spinlock.h \
	src/unix/stream.c \
	src/unix/tcp.c \
	src/unix/thread.c \
	src/unix/timer.c \
	src/unix/tty.c \
	src/unix/udp.c \
	src/unix/proctitle.c \
	src/unix/linux-core.c \
	src/unix/linux-inotify.c \
	src/unix/linux-syscalls.c \
	src/unix/linux-syscalls.h \
	src/unix/pthread-fixes.c \
	src/unix/android-ifaddrs.c \
	src/unix/procfs-exepath.c \
	src/unix/sysinfo-loadavg.c \
	src/unix/sysinfo-memory.c \

LOCAL_MODULE:= libuv
LOCAL_MODULE_TAGS:=tests


include external/libcxx/libcxx.mk

include $(BUILD_STATIC_LIBRARY)

