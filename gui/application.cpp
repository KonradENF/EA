/***************************************************************
 * Name:      application.cpp
 * Purpose:   Code for Application Class
 * Author:    Konrad Fahrendholz ()
 * Created:   2017-02-03
 * Copyright: Konrad Fahrendholz ()
 * License:
 **************************************************************/

#include "application.hpp"




#include "main.hpp"

IMPLEMENT_APP(Application);

bool Application::OnInit()
{
    //NULL = 0L
    MainFrame* frame = new MainFrame(0L, _("wxWidgets Application Template"));
    frame->SetIcon(wxICON(aaaa)); // To Set App Icon
    frame->Show();

    return true;
}
