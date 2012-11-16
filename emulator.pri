# @@@LICENSE
#
#      Copyright (c) 2010-2012 Hewlett-Packard Development Company, L.P.
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

MACHINE_NAME = $$(MACHINE)
STAGINGDIR = $$(STAGING_INCDIR)

contains(MACHINE_NAME, "qemux86") {
    CONFIG_BUILD += webosemulator
}
contains(MACHINE_NAME, "qemuarm") {
    CONFIG_BUILD += webosemulator
}
contains(MACHINE_NAME, "qemuarmv7") {
    CONFIG_BUILD += webosemulator
}
contains(MACHINE_NAME, "qemuarmv7a") {
    CONFIG_BUILD += webosemulator
}

contains (CONFIG_BUILD, webosemulator) {
    BUILD_TYPE = release
    CONFIG -= debug
    CONFIG += release

    DEFINES += TARGET_EMULATOR

    INCLUDEPATH += $$(STAGING_INCDIR)/ime \
        $$(STAGING_INCDIR)/glib-2.0

    target.path = $$(STAGING_DIR)/usr/lib/luna
} else {
    warning($$MACHINE_NAME not matched in emulator.pri)
}
