/***************************************************************
 * Name:      main.h
 * Purpose:   Defines Application Frame
 * Author:    Konrad Fahrendholz ()
 * Created:   2017-02-03
 * Copyright: Konrad Fahrendholz ()
 * License:
 **************************************************************/

#ifndef EN_GUI_MAIN_H
#define EN_GUI_MAIN_H

#include <wx/frame.h>

#include "application.hpp"



class MainFrame: public wxFrame
{
    public:
        MainFrame(wxFrame *frame, const wxString& title);
        ~MainFrame();
    private:
        enum
        {
            idMenuQuit = 1000,
            idMenuAbout
        };
        void OnClose(wxCloseEvent& event);
        void OnQuit(wxCommandEvent& event);
        void OnAbout(wxCommandEvent& event);
        DECLARE_EVENT_TABLE()
};


#endif // EN_GUI_MAIN_H
