#include "projectview.hpp"

#include <wx/sizer.h>


ProjectView::ProjectView(wxWindow *parent):
    wxPanel(parent){

    SetBackgroundColour(wxColour(* wxGREEN));

    fileTree = new wxGenericDirCtrl(this,-1);

    wxBoxSizer *expandAllBox = new wxBoxSizer(wxVERTICAL);
    expandAllBox->Add(fileTree, 1, wxEXPAND | wxALL, 0);

    SetSizer(expandAllBox);
}

ProjectView::~ProjectView(){
}

