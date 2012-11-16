#include <VirtualKeyboardPreferences.h>

static VirtualKeyboardPreferences p;

VirtualKeyboardPreferences::VirtualKeyboardPreferences() {}
void VirtualKeyboardPreferences::setTapSounds(bool b) { (void)b; }
void VirtualKeyboardPreferences::activateCombo() {}
void VirtualKeyboardPreferences::applyInitSettings(VirtualKeyboard *v) { (void)v; }
void VirtualKeyboardPreferences::selectLayoutCombo(char const *c) { (void)c; }
void VirtualKeyboardPreferences::selectKeyboardSize(int i) { (void)i; }
void VirtualKeyboardPreferences::selectKeyboardCombo(int i) { (void)i; }
void VirtualKeyboardPreferences::clearDefaultDeyboards() {}
void VirtualKeyboardPreferences::createDefaultKeyboards() {}
void VirtualKeyboardPreferences::selectNextKeyboardCombo() {}
VirtualKeyboardPreferences &VirtualKeyboardPreferences::instance() { return p; }

void VirtualKeyboardPreferences::applyFirstUseSettings() {}
void VirtualKeyboardPreferences::localeChanged() {}
VirtualKeyboardPreferences::SKeyboardCombo VirtualKeyboardPreferences::getDefault() { return VirtualKeyboardPreferences::SKeyboardCombo(); }
void VirtualKeyboardPreferences::virtualKeyboardPreferencesChanged(const char *c) { (void)c; }
void VirtualKeyboardPreferences::virtualKeyboardSettingsChanged(const char *c) { (void)c; }
void VirtualKeyboardPreferences::saveSettings() {}
void VirtualKeyboardPreferences::savePreferences(const std::vector<SKeyboardCombo> &c) { (void)c; }
void VirtualKeyboardPreferences::bootFinished() {}
