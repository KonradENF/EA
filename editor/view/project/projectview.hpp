#ifndef EN_EDITOR_VIEW_PROJECT_PROJECTVIEW_H
#define EN_EDITOR_VIEW_PROJECT_PROJECTVIEW_H



#include <wx/panel.h>

#include <wx/dirctrl.h>


class ProjectView : public wxPanel
{
public:
    // Constructor
    ProjectView(wxWindow *parent);
    ~ProjectView();

private:
    wxGenericDirCtrl *fileTree;
};


#endif //EN_EDITOR_VIEW_PROJECT_PROJECTVIEW_H
