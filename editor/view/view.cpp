#include "view.hpp"

#include <wx/splitter.h>
#include <wx/sizer.h>
#include <wx/textctrl.h>

#include <wx/gdicmn.h>

ViewPanel::ViewPanel(wxWindow *parent):
    wxPanel(parent)
{

    SetBackgroundColour(wxColour(* wxRED));

    wxBoxSizer *vbox = new wxBoxSizer(wxVERTICAL);

    wxSplitterWindow *splitterCenter = new wxSplitterWindow(this, wxID_ANY);
    splitterCenter->SetMinimumPaneSize(250); // Smalest size the

    projectView = new ProjectView(splitterCenter);


    wxSplitterWindow *splitCenterContent = new wxSplitterWindow(splitterCenter, wxID_ANY);
    splitCenterContent->SetMinimumPaneSize(200);
    contentView = new ContentView(splitCenterContent);
    consoleView = new ConsoleView(splitCenterContent);


    splitCenterContent->SplitHorizontally(contentView, consoleView,-200);

    splitterCenter->SplitVertically(projectView, splitCenterContent,200);

    vbox->Add(splitterCenter, 1, wxEXPAND | wxALL, 0);

    SetSizer(vbox);
}

ViewPanel::~ViewPanel()
{
}


