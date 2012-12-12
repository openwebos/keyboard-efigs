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

TARGET = plugin-example
TEMPLATE = lib

QT += core gui
contains(QT_VERSION, "^5.*") {
QT += widgets
}
CONFIG += plugin debug

CONFIG += link_pkgconfig
PKGCONFIG = glib-2.0 gthread-2.0

QMAKE_CXXFLAGS += -Wall

HEADERS += plugin.h

SOURCES += plugin.cpp

contains(QT_VERSION, "^5.*") {
    OTHER_FILES += plugin-example.json
}

linux-g++|linux-g++-64 {
    STAGINGDIR = $$(LUNA_STAGING)

    INCLUDEPATH += $${STAGINGDIR}/include \
        $${STAGINGDIR}/include/Qt \
        $${STAGINGDIR}/include/QtCore \
        $${STAGINGDIR}/include/QtGui

    target.path = $$(ROOTFS)/usr/lib/luna
} else {
    STAGINGDIR = $$(STAGING_DIR)
    target.path = $$(STAGING_DIR)/usr/lib/luna
}

INCLUDEPATH += $${STAGINGDIR}/include/ime \
    $$(STAGINGDIR)/glib-2.0

HEADERS += $${STAGINGDIR}/include/ime/IMEData.h \
    $${STAGINGDIR}/include/ime/IMEDataInterface.h \
    $${STAGINGDIR}/include/ime/InputMethod.h \
    $${STAGINGDIR}/include/ime/VirtualKeyboard.h

DESTDIR = build
OBJECTS_DIR = $$DESTDIR/.obj
MOC_DIR = $$DESTDIR/.moc
QMAKE_DISTCLEAN += -r $${DESTDIR}

INSTALLS += target
