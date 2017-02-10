/***************************************************************
 * Name:      TestMain.cpp
 * Purpose:   Code for Application Frame
 * Author:    Konrad Fahrendholz ()
 * Created:   2017-02-03
 * Copyright: Konrad Fahrendholz ()
 * License:
 **************************************************************/

#include "main.hpp"


#include <wx/defs.h>

#include <wx/msgdlg.h>

#include <wx/button.h>
#include <wx/sizer.h>
#include <wx/splitter.h>
#include <wx/textctrl.h>
#include <wx/colour.h>



BEGIN_EVENT_TABLE(MainFrame, wxFrame)
    EVT_CLOSE(MainFrame::OnClose)
    EVT_MENU(idMenuQuit, MainFrame::OnQuit)
    EVT_MENU(idMenuAbout, MainFrame::OnAbout)
END_EVENT_TABLE()

MainFrame::MainFrame(wxFrame *frame, const wxString& title)
    : wxFrame(frame, wxID_ANY, title)
{

//Create(frame, -1, _("Welcome to Code::Blocks Share Config"), wxDefaultPosition, wxDefaultSize, wxCAPTION|wxDEFAULT_DIALOG_STYLE|wxSYSTEM_MENU|wxRESIZE_BORDER|wxCLOSE_BOX|wxMINIMIZE_BOX, _T("id"));
	SetMinSize(wxSize(640,480));
    SetBackgroundColour(wxSystemSettings::GetColour(wxSYS_COLOUR_BTNFACE));

    menuBar = new MenuBar();

    SetMenuBar(menuBar);

    centerPanel  = new ViewPanel(this);




    //wxPanel m_parent = new wxPanel(this, -1);
//    wxBoxSizer *sizer = new wxBoxSizer(wxVERTICAL);
//    sizer->Add(new wxButton(this,-1,"A really big Button"),0,0,0);
//    //sizer->
//    sizer->Add(new wxButton(this,-1,"MiniButton"),1, wxEXPAND | wxALL, 20);
//    SetSizer(sizer);
//  wxBoxSizer *sizermain = new wxBoxSizer(wxVERTICAL);
//  wxSplitterWindow *splittermain = new wxSplitterWindow(this, wxID_ANY);
//  //splittermain->SetSashGravity(0.3);
//  splittermain->SetMinimumPaneSize(250); // Smalest size the
//
//
//
//  sizermain->Add(splittermain, 1,wxEXPAND,0);
//
//
//
//  wxPanel *leftPanel = new wxPanel(splittermain, wxID_ANY);
//
//
////  wxBoxSizer *txt2sizer = new wxBoxSizer(wxVERTICAL);
////  rightPanel->SetSizer(txt2sizer);
//
//  splittermain->SplitVertically(leftPanel, centerPanel);
//
//  this->SetSizer(sizermain);
//  sizermain->SetSizeHints(this);


    //wxPanel *leftPanel = new wxPanel(splittermain, wxID_ANY);

    CreateStatusBar(3);
    SetStatusText(wxT("Ready"), 0);
    SetStatusText(wxT("Ready1"), 1);
    SetStatusText(wxT("Ready2"), 2);



   // #wxButton* button 	 = new wxButton(this,10,"My wxButton");



    Centre();
}


MainFrame::~MainFrame()
{
}

void MainFrame::OnClose(wxCloseEvent &event)
{
    Destroy();
}

void MainFrame::OnQuit(wxCommandEvent &event)
{
    Destroy();
}

void MainFrame::OnAbout(wxCommandEvent &event)
{

    wxMessageBox("Test", _("Welcome to..."));
}
