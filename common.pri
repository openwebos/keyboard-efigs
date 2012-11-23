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

DEPENDPATH += . \
    ../include \
    ../src
INCLUDEPATH += . \
    ../include

QT += core gui
CONFIG += plugin

CONFIG += link_pkgconfig
PKGCONFIG = glib-2.0 gthread-2.0

# Prevent conflict with usage of "signal" in other libraries
CONFIG += no_keywords

QMAKE_CXXFLAGS += -fno-rtti -fno-exceptions -fvisibility=hidden -fvisibility-inlines-hidden -Wall

LIBS += -lpbnjson_cpp -llunaservice

# Input
HEADERS += ../include/CandidateBar.h \
    ../include/CandidateBarRemote.h \
    ../include/GlyphCache.h \
    ../include/IMEPixmap.h \
    ../include/JSONUtils.h \
    ../include/KeyLocationRecorder.h \
    ../include/PalmIMEHelpers.h \
    ../include/ShortcutsHandler.h

SOURCES += ../src/CandidateBar.cpp \
    ../src/CandidateBarRemote.cpp \
    ../src/GlyphCache.cpp \
    ../src/IMEPixmap.cpp \
    ../src/JSONUtils.cpp \
    ../src/KeyLocationRecorder.cpp \
    ../src/PalmIMEHelpers.cpp \
    ../src/ShortcutsHandler.cpp \
    # TODO: figure out how to get the prefs working for real and then remove the src/ime folder and its contents
    ../src/ime/VirtualKeyboardPreferences_stub.cpp

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

# Add rest of the needed headers after setting $$STAGINGDIR in platform .pri file
HEADERS += $${STAGINGDIR}/include/ime/IMEData.h \
    $${STAGINGDIR}/include/ime/IMEDataInterface.h \
    $${STAGINGDIR}/include/ime/InputMethod.h \
    $${STAGINGDIR}/include/ime/VirtualKeyboard.h \
    $${STAGINGDIR}/include/ime/VirtualKeyboardPreferences.h

DESTDIR = ../$${BUILD_TYPE}-$${MACHINE_NAME}

OBJECTS_DIR = $$DESTDIR/.obj
MOC_DIR = $$DESTDIR/.moc

QMAKE_DISTCLEAN += -r $${DESTDIR}

INSTALLS += target
