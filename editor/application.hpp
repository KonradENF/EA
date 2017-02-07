/***************************************************************
 * Name:      application.h
 * Purpose:   Defines Application Class
 * Author:    Konrad Fahrendholz ()
 * Created:   2017-02-03
 * Copyright: Konrad Fahrendholz ()
 * License:
 **************************************************************/

#ifndef EN_EDITOR_APPLICATION_H
#define EN_EDITOR_APPLICATION_H

#include <wx/app.h>

class Application : public wxApp
{
    public:
        virtual bool OnInit();
};

#endif // EN_EDITOR_APPLICATION_H
