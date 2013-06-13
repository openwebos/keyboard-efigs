# @@@LICENSE
#
#      Copyright (c) 2010-2013 LG Electronics, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# LICENSE@@@

CONFIG += debug

debug {
    QMAKE_MAKEFILE = Makefile.Ubuntu
    BUILD_TYPE = debug
} else {
    QMAKE_MAKEFILE = Makefile.Ubuntu.Release
    BUILD_TYPE = release
}

MACHINE_NAME = x86
STAGING_INCLUDE_DIR = $$(LUNA_STAGING)/include

DEFINES += TARGET_DESKTOP

LIBS += \
    -Wl,-rpath $$(LUNA_STAGING)/lib \
    -L$$(LUNA_STAGING)/lib \
    -Wl,-rpath $$(LUNA_STAGING)/usr/lib \
    -L$$(LUNA_STAGING)/usr/lib \

INCLUDEPATH += \
    $$(LUNA_STAGING)/include \
    $$(LUNA_STAGING)/include/Qt \
    $$(LUNA_STAGING)/include/QtCore \
    $$(LUNA_STAGING)/include/QtGui \
    $$(LUNA_STAGING)/include/QtNetwork \
    $$(LUNA_STAGING)/include/QtOpenGL \
    $$(LUNA_STAGING)/include/QtSql \
    $$(LUNA_STAGING)/include/QtDeclarative \
    $$(LUNA_STAGING)/include/ime \
    $$(LUNA_STAGING)/usr/include \

target.path = $$(ROOTFS)/usr/lib/luna
