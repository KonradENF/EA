#ifndef EN_EDITOR_MENU_MENU_H
#define EN_EDITOR_MENU_MENU_H

#include <wx/menu.h>

class MenuBar : public wxMenuBar
{
public:
    // Constructor
    MenuBar();
    ~MenuBar();

private:
    wxMenu *fileMenu;
    wxMenu *helpMenu;
};

#endif //EN_EDITOR_MENU_MENU_H
