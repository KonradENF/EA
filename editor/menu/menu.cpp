#include "menu.hpp"



MenuBar::MenuBar()
{

    fileMenu = new wxMenu();



    fileMenu->Append(wxID_NEW, wxT("&New"));
    fileMenu->AppendSeparator();

    fileMenu->Append(wxID_OPEN, wxT("&Open"));
    fileMenu->AppendSeparator();

    fileMenu->Append(wxID_EXIT, wxT("&Quit"));

    Append(fileMenu, wxT("&File"));


    helpMenu = new wxMenu();
    helpMenu->Append(wxID_ABOUT, wxT("&About"));
    Append(helpMenu, wxT("&Help"));
}

MenuBar::~MenuBar()
{
}
