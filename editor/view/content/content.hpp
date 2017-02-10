#ifndef EN_EDITOR_VIEW_CONTENT_CONTENT_H
#define EN_EDITOR_VIEW_CONTENT_CONTENT_H

#include <wx/panel.h>
#include <wx/notebook.h>

class ContentView : public wxPanel
{
public:
    // Constructor
    ContentView(wxWindow *parent);
    ~ContentView();

private:
    wxNotebook *content;



};


#endif //EN_EDITOR_VIEW_CONTENT_CONTENT_H
