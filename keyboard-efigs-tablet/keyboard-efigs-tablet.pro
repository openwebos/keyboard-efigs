# @@@LICENSE
#
#      Copyright (c) 2012-2013 LG Electronics, Inc.
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

TARGET = keyboard-efigs-tablet

include(../common.pri)

HEADERS += ../include/TabletKeyboard.h \
    ../include/TabletKeymap.h

SOURCES += ../src/TabletKeyboard.cpp \
    ../src/TabletKeymap.cpp

contains(QT_VERSION, "^5.*") {
    OTHER_FILES += ../include/keyboard-tablet.json
}
