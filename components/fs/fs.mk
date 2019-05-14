################################################################################
# this is used for compile the file system
################################################################################
ifeq ($(WITH_FILESYSTEM), yes)
FS_SRC = \
        ${wildcard $(TOP_DIR)/components/fs/vfs/*.c}
        C_SOURCES += $(FS_SRC)

FS_DEMO_COMMON_SRC = \
        ${wildcard $(TOP_DIR)/demos/fs/fs_common.c}
        C_SOURCES += $(FS_DEMO_COMMON_SRC)

FS_SPIFFS_SRC = \
        $(TOP_DIR)/targets/STM32F429IGTx_FIRE/Src/spiffs_hal.c \
        ${wildcard $(TOP_DIR)/components/fs/spiffs/*.c} \
        ${wildcard $(TOP_DIR)/components/fs/spiffs/spiffs_git/src/*.c}

FS_FATFS_SRC = \
        $(TOP_DIR)/targets/STM32F429IGTx_FIRE/Src/fatfs_hal.c \
        ${wildcard $(TOP_DIR)/components/fs/fatfs/*.c} \
        ${wildcard $(TOP_DIR)/components/fs/fatfs/ff13b/source/*.c}

ifeq ($(IS_COMPILE_ALLFS), ALL)
        C_SOURCES += $(FS_SPIFFS_SRC)
        C_SOURCES += $(FS_FATFS_SRC)
        C_SOURCES += $(TOP_DIR)/demos/fs/fatfs_demo.c
        C_SOURCES += $(TOP_DIR)/demos/fs/spiffs_demo.c
else ifeq ($(FILESYSTEM_TYPE), SPIFFS)
        C_SOURCES += $(FS_SPIFFS_SRC)
        C_SOURCES += $(TOP_DIR)/demos/fs/spiffs_demo.c
else ifeq ($(FILESYSTEM_TYPE), FATFS)
        C_SOURCES += $(FS_FATFS_SRC)
        C_SOURCES += $(TOP_DIR)/demos/fs/fatfs_demo.c
endif
ifeq ($(WITH_CMOCKERY_TEST), yes)
CMOCKERY_TEST_FS_SRC = \
        ${wildcard $(TOP_DIR)/tests/test_suit/fs_test.c}
        C_SOURCES += $(CMOCKERY_TEST_FS_SRC)
endif
endif