#ifndef EN_EDITOR_VIEW_VIEW_H
#define EN_EDITOR_VIEW_VIEW_H

#include <wx/panel.h>

#include "project/projectview.hpp"
#include "console/console.hpp"
#include "content/content.hpp"

class ViewPanel : public wxPanel
{
public:
    // Constructor
    ViewPanel(wxWindow *parent);
    ~ViewPanel();

private:
    ProjectView *projectView;
    ConsoleView *consoleView;
    ContentView *contentView;
};


#endif // EN_EDITOR_VIEW_VIEW_H

