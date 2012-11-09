# @@@LICENSE
#
#      Copyright (c) 2012 Hewlett-Packard Development Company, L.P.
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

TEMPLATE = lib
TARGET = keyboard-efigs
DEPENDPATH += . include src
INCLUDEPATH += . include \
    include/ime \   # TODO: remove this line, the ime folder and its contents when the real headers are exported from luna-sysmgr

QT += core gui
CONFIG += plugin

CONFIG += link_pkgconfig
PKGCONFIG = glib-2.0 gthread-2.0

# Prevent conflict with usage of "signal" in other libraries
CONFIG += no_keywords

QMAKE_CXXFLAGS += -fno-rtti -fno-exceptions -fvisibility=hidden -fvisibility-inlines-hidden -Wall

LIBS += -lpbnjson_cpp -llunaservice

# Input
HEADERS += include/CandidateBar.h \
    include/CandidateBarRemote.h \
    include/GlyphCache.h \
    include/IMEPixmap.h \
    include/JSONUtils.h \
    include/KeyLocationRecorder.h \
    include/PalmIMEHelpers.h \
    include/PhoneKeyboard.h \
    include/PhoneKeymap.h \
    include/ShortcutsHandler.h \
    include/TabletKeyboard.h \
    include/TabletKeymap.h
# TODO: remove the following lines and the files when the headers are exported from luna-sysmgr
#    include/ime/IMEData.h_generator.h \
#    include/ime/IMEDataInterface.h \
#    include/ime/SysmgrIMEDataInterface.h \
#    include/ime/VirtualKeyboard.h \
#    include/ime/InputMethod.h

SOURCES += src/CandidateBar.cpp \
    src/CandidateBarRemote.cpp \
    src/GlyphCache.cpp \
    src/IMEPixmap.cpp \
    src/JSONUtils.cpp \
    src/KeyLocationRecorder.cpp \
    src/PalmIMEHelpers.cpp \
    src/PhoneKeyboard.cpp \
    src/PhoneKeymap.cpp \
    src/ShortcutsHandler.cpp \
    src/TabletKeyboard.cpp \
    src/TabletKeymap.cpp \

linux-g++ {
    include(desktop.pri)
} else:linux-g++-64 {
    include(desktop.pri)
} else:linux-qemux86-g++ {
    include(emulator.pri)
    QMAKE_CXXFLAGS += -fno-strict-aliasing
} else {
    ## First, check to see if this in an emulator build
    include(emulator.pri)
    contains (CONFIG_BUILD, webosemulator) {
        QMAKE_CXXFLAGS += -fno-strict-aliasing
    } else {
        ## Neither a desktop nor an emulator build, so must be a device
        include(device.pri)
    }
}

DESTDIR = ./$${BUILD_TYPE}-$${MACHINE_NAME}

OBJECTS_DIR = $$DESTDIR/.obj
MOC_DIR = $$DESTDIR/.moc

INSTALLS += target
