#include "plugin.h"

#include <QDebug>
#include <QtPlugin>
#include <QRect>
#include <QPainter>
#include <VirtualKeyboardPreferences.h>
#include <QTouchEvent>

Plugin::Plugin(IMEDataInterface *interface) : VirtualKeyboard(interface)
{
    QSize screenSize = m_IMEDataInterface->m_screenSize.get();
    halfScreen = QRect(0, screenSize.height() / 2,
                       screenSize.width(), screenSize.height() / 2);

    m_IMEDataInterface->m_keyboardHeight.set(halfScreen.height());
    m_IMEDataInterface->virtualKeyboardPreferences().applyInitSettings(this);

    keyZero = QRect(halfScreen.x() + halfScreen.width() / 2 - 40,
                    halfScreen.y() + halfScreen.height() / 2, 30, 30);
    keyOne = QRect(halfScreen.x() + halfScreen.width() / 2,
                   halfScreen.y() + halfScreen.height() / 2, 30, 30);
    keyHide = QRect(halfScreen.x() + halfScreen.width() / 2 + 80,
                    halfScreen.y() + halfScreen.height() / 2, 30, 30);
}

void Plugin::touchEvent(const QTouchEvent &event)
{
    if (event.type() == QEvent::TouchBegin) {
        qDebug() << " *** " << Q_FUNC_INFO << "QEvent::TouchBegin";
    } else if (event.type() == QEvent::TouchEnd) {
        qDebug() << " *** " << Q_FUNC_INFO << "QEvent::TouchEnd";
    }
}

void Plugin::paint(QPainter &painter)
{
    painter.fillRect(halfScreen, Qt::gray);

    painter.fillRect(keyZero, Qt::white);
    painter.drawText(keyZero, QString("0"));

    painter.fillRect(keyOne, Qt::white);
    painter.drawText(keyOne, QString("1"));

    painter.fillRect(keyHide, Qt::white);
    painter.drawText(keyHide, QString("hide"));
}

void Plugin::tapEvent(const QPoint &point)
{
    if (keyZero.contains(point)) {
        qDebug() << " *** " << Q_FUNC_INFO << "zero tapped";
        m_IMEDataInterface->sendKeyEvent(QEvent::KeyPress, Qt::Key_0, Qt::NoModifier);
        m_IMEDataInterface->sendKeyEvent(QEvent::KeyRelease, Qt::Key_0, Qt::NoModifier);
    } else if (keyOne.contains(point)) {
        qDebug() << " *** " << Q_FUNC_INFO << "one tapped";
        m_IMEDataInterface->sendKeyEvent(QEvent::KeyPress, Qt::Key_1, Qt::NoModifier);
        m_IMEDataInterface->sendKeyEvent(QEvent::KeyRelease, Qt::Key_1, Qt::NoModifier);
    } else if (keyHide.contains(point)) {
        qDebug() << " *** " << Q_FUNC_INFO << "hide tapped";
        m_IMEDataInterface->requestHide();
    }
}

void Plugin::screenEdgeFlickEvent()
{
}

void Plugin::requestSize(int size)
{
    Q_UNUSED(size);
}

void Plugin::requestHeight(int height)
{
    Q_UNUSED(height);
}

void Plugin::changePresetHeightForSize(int size, int height)
{
    Q_UNUSED(size);
    Q_UNUSED(height);
}

bool Plugin::setBoolOption(const std::string &name, bool value)
{
    Q_UNUSED(name);
    Q_UNUSED(value);

    return false;
}

bool Plugin::setIntOption(const std::string &name, int value)
{
    Q_UNUSED(name);
    Q_UNUSED(value);

    return false;
}

bool Plugin::getValue(const std::string &name, std::string &out)
{
    Q_UNUSED(name);
    Q_UNUSED(out);

    return false;
}

void Plugin::setKeyboardCombo(const std::string &layoutName,
                              const std::string &languageName,
                              bool showLanguageKey)
{
    Q_UNUSED(layoutName);
    Q_UNUSED(languageName);
    Q_UNUSED(showLanguageKey);
}

void Plugin::keyboardCombosChanged()
{
    qDebug() << " *** " << Q_FUNC_INFO;
}

QList<const char *> Plugin::getLayoutNameList()
{
    QList<const char *> l;
    l.append("example");
    return l;
}

const char *Plugin::getLayoutDefaultLanguage(const char *layoutName)
{
    Q_UNUSED(layoutName);

    return "";
}


InputMethod *PluginFactory::
    newVirtualKeyboard(IMEDataInterface *dataInterface)
{
    if (m_plugin == 0) {
        m_plugin = new Plugin(dataInterface);
    }

    return m_plugin;
}

QString PluginFactory::name() const
{
    return QString("Example Plugin");
}

VirtualKeyboardFactory::EVirtualKeyboardSupport
    PluginFactory::getSupport(int maxWidth, int maxHeight,
                              int dpi, const std::string locale)
{
    Q_UNUSED(maxWidth);
    Q_UNUSED(maxHeight);
    Q_UNUSED(dpi);
    Q_UNUSED(locale);

    /* Return support with something like this...
    if (maxWidth >= 1024 || maxHeight >= 1024) {
        if (locale == "fi") {
            if (dpi == 300) {
                return VirtualKeyboardFactory::
                    eVirtualKeyboardSupport_Preferred_SizeDpiAndLocale;
            }

            return VirtualKeyboardFactory::
                eVirtualKeyboardSupport_Preferred_SizeAndLocale;
        }

        return VirtualKeyboardFactory::eVirtualKeyboardSupport_Preferred_Size;
    }
    */
    return VirtualKeyboardFactory::eVirtualKeyboardSupport_NotSupported;
    

    // Use this to make sure the example keyboard gets selected by the host system
    // return VirtualKeyboardFactory::eVirtualKeyboardSupport_Preferred_SizeAndLocale;
}

#if (QT_VERSION < QT_VERSION_CHECK(5, 0, 0))
Q_EXPORT_PLUGIN2(plugin-example, PluginFactory)
#endif
