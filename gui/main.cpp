/***************************************************************
 * Name:      TestMain.cpp
 * Purpose:   Code for Application Frame
 * Author:    Konrad Fahrendholz ()
 * Created:   2017-02-03
 * Copyright: Konrad Fahrendholz ()
 * License:
 **************************************************************/

#include "main.hpp"

#include "wx/msgdlg.h"

BEGIN_EVENT_TABLE(MainFrame, wxFrame)
    EVT_CLOSE(MainFrame::OnClose)
    EVT_MENU(idMenuQuit, MainFrame::OnQuit)
    EVT_MENU(idMenuAbout, MainFrame::OnAbout)
END_EVENT_TABLE()

MainFrame::MainFrame(wxFrame *frame, const wxString& title)
    : wxFrame(frame, -1, title)
{

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
