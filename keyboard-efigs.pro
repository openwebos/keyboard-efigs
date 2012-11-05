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
 include/ime \
 $$(STAGING_INCDIR)/ime

QT += core gui
CONFIG += plugin

CONFIG += link_pkgconfig
PKGCONFIG = glib-2.0 gthread-2.0

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
 include/TabletKeymap.h \
# include/Utils.h \
# include/ime/IMEData.h \
 include/ime/IMEData.h_generator.h \
 include/ime/IMEDataInterface.h \

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
# src/Utils.cpp

DESTDIR = build

OBJECTS_DIR = $$DESTDIR/.obj
MOC_DIR = $$DESTDIR/.moc

target.path = $$(LUNA_STAGING)/bin
INSTALLS += target
