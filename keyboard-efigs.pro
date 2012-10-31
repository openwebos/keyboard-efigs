TEMPLATE = lib
TARGET = keyboard-efigs
DEPENDPATH += . include src
INCLUDEPATH += . include

CONFIG += link_pkgconfig
PKGCONFIG = glib-2.0 gthread-2.0

# Input
HEADERS += include/CandidateBar.h \
    include/CandidateBarRemote.h \
    include/GlyphCache.h \
    include/IMEPixmap.h \
    include/PalmIMEHelpers.h \
    include/PhoneKeyboard.h \
    include/PhoneKeymap.h \
    include/TabletKeyboard.h \
    include/TabletKeymap.h

SOURCES += src/CandidateBar.cpp \
    src/CandidateBarRemote.cpp \
    src/GlyphCache.cpp \
    src/IMEPixmap.cpp \
    src/PalmIMEHelpers.cpp \
    src/PhoneKeyboard.cpp \
    src/PhoneKeymap.cpp \
    src/TabletKeyboard.cpp \
    src/TabletKeymap.cpp
