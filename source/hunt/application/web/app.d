/*
 * Hunt - a framework for web and console application based on Collie using Dlang development
 *
 * Copyright (C) 2015-2016  Shanghai Putao Technology Co., Ltd 
 *
 * Developer: putao's Dlang team
 *
 * Licensed under the BSD License.
 *
 */
module hunt.application.web.app;

version(USE_DEFAULT_WEB_MAIN):

import hunt.application.web;

void main()
{
    auto app = WebApplication.app();
    app.run();
}