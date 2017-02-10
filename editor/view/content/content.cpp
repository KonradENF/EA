#include "content.hpp"

#include <wx/sizer.h>
#include <wx/tbarbase.h>


ContentView::ContentView(wxWindow *parent):
    wxPanel(parent){

    SetBackgroundColour(wxColour(* wxYELLOW));

    content = new wxNotebook(this,wxID_ANY,wxDefaultPosition,wxDefaultSize, wxNB_MULTILINE );
    content->AddPage( new wxNotebookPage( content, -1 ), L"TEST RECOMMENDATIONS 1" );
    content->AddPage( new wxNotebookPage( content, -1 ), L"TEST RECOMMENDATIONS 2" );
    content->AddPage( new wxNotebookPage( content, -1 ), L"TEST RECOMMENDATIONS 3" );
    content->AddPage( new wxNotebookPage( content, -1 ), L"TEST RECOMMENDATIONS 4" );
        content->AddPage( new wxNotebookPage( content, -1 ), L"TEST RECOMMENDATIONS 5" );
    content->AddPage( new wxNotebookPage( content, -1 ), L"TEST RECOMMENDATIONS 6" );
        content->AddPage( new wxNotebookPage( content, -1 ), L"TEST RECOMMENDATIONS 7" );
    content->AddPage( new wxNotebookPage( content, -1 ), L"TEST RECOMMENDATIONS 8" );
    content->Layout();

    wxBoxSizer *expandAllBox = new wxBoxSizer(wxVERTICAL);
    expandAllBox->Add(content, 1, wxEXPAND | wxALL, 0);

    SetSizer(expandAllBox);
}

ContentView::~ContentView(){
}

