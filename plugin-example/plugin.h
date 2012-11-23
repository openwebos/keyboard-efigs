#ifndef Plugin_H
#define Plugin_H

#include <VirtualKeyboard.h>
#include <string>

class Plugin : public VirtualKeyboard
{
    Q_OBJECT

public:
    Plugin(IMEDataInterface *interface);

    virtual void touchEvent(const QTouchEvent &event);
    virtual void paint(QPainter &painter);
    virtual void tapEvent(const QPoint &point);
    virtual void screenEdgeFlickEvent();
    virtual void requestSize(int size);
    virtual void requestHeight(int height);
    virtual void changePresetHeightForSize(int size, int height);
    virtual bool setBoolOption(const std::string &name, bool value);
    virtual bool setIntOption(const std::string &name, int value);
    virtual bool getValue(const std::string &name, std::string &out);
    virtual void setKeyboardCombo(const std::string &layoutName,
                                  const std::string &languageName,
                                  bool showLanguageKey);
    virtual void keyboardCombosChanged();
    virtual QList<const char *> getLayoutNameList();
    virtual const char *getLayoutDefaultLanguage(const char *layoutName);

private:
    QRect halfScreen;
    QRect keyZero;
    QRect keyOne;
    QRect keyHide;
};

class PluginFactory : public QObject,
                      public VirtualKeyboardFactory
{
    Q_OBJECT
    Q_INTERFACES(VirtualKeyboardFactory)

public:
    PluginFactory() : m_plugin(0) {}
    ~PluginFactory() { delete m_plugin; }

    virtual InputMethod *newVirtualKeyboard(IMEDataInterface *dataInterface);

    virtual QString name() const;

    virtual VirtualKeyboardFactory::EVirtualKeyboardSupport
        getSupport(int maxWidth, int maxHeight, int dpi, const char *locale);

private:
    Plugin *m_plugin;
};

#endif
