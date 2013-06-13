Summary
=======

This is the repository for keyboard-efigs, the default webOS pluggable shared
library for the virtual keyboard.

keyboard-efigs
==============

This is the pluggable keyboard component based on the original Open webOS
keyboard. It is optimized for tablet and phone layouts, and provides support
for locales based on the English, French, Italian, German and Spanish languages.

In addition to being the default keyboard for Open webOS, this component
provides a full example of how to implement pluggable keyboard components for
Open webOS.

The discovery system of Open webOS will detect available pluggable keyboard
components and then select the one with the best fit for locale and screen
format.

Creating new virtual keyboards
==============================

All virtual keyboards need to inherit from the class VirtualKeyboard and
implement the interface defined in it and it's base class InputMethod. The
header files VirtualKeyboard.h and InputMethod.h are part of luna-webkit-api.
Communication between the plugin libraries and the host system happens via the
interface defined IMEDataInterface.h, also from luna-webkit-api repository.

The keyboard-efigs repository has two complete keyboards, keyboard-efigs-phone
suited for phones and keyboard-efigs-tablet for bigger screens. In addition
there's example-plugin, which is a plugin library with minimal functionality.

How to Build on Linux
=====================

This component is in the development phase and is not yet individually
buildable.

# Copyright and License Information

All content, including all source code files and documentation files in this
repository except otherwise noted are:

 Copyright (c) 2010-2013 LG Electronics, Inc.

All content, including all source code files and documentation files in this
repository except otherwise noted are:
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this content except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
