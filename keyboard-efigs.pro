TEMPLATE = lib
TARGET = keyboard-efigs
DEPENDPATH += . include src
INCLUDEPATH += . include \
	$$(STAGING_INCDIR)/ime

QT += core gui
CONFIG += plugin

CONFIG += link_pkgconfig
PKGCONFIG = glib-2.0 gthread-2.0

QMAKE_CXXFLAGS += -Wunused-parameter

# Input
HEADERS += include/CandidateBar.h \
	include/CandidateBarRemote.h \
	include/GlyphCache.h \
	include/IMEData.h \
	include/IMEData.h_generator.h \
	include/IMEDataInterface.h \
	include/IMEPixmap.h \
	include/KeyLocationRecorder.h \
	include/PalmIMEHelpers.h \
	include/PhoneKeyboard.h \
	include/PhoneKeymap.h \
	include/ShortcutsHandler.h \
	include/TabletKeyboard.h \
	include/TabletKeymap.h

SOURCES += src/CandidateBar.cpp \
	src/CandidateBarRemote.cpp \
	src/GlyphCache.cpp \
	src/IMEPixmap.cpp \
	src/KeyLocationRecorder.cpp \
	src/PalmIMEHelpers.cpp \
	src/PhoneKeyboard.cpp \
	src/PhoneKeymap.cpp \
	src/ShortcutsHandler.cpp \
	src/TabletKeyboard.cpp \
	src/TabletKeymap.cpp

target.path = $$(LUNA_STAGING)/bin
INSTALLS += target
