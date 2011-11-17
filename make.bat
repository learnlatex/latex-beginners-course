@echo off

rem Makefile for 'LaTeX for Beginners' materials

   if not [%1] == [] goto :init
   
:help

  rem Default with no target is to give help

  echo.
  echo  make all   - make all targets
  echo  make clean - clean out directory 

  goto :EOF
   
:init
	
  rem Avoid clobbering anyone else's variables

  setlocal

  set AUXFILES=4ct 4tc aux dvi idv lg log nav out snm tmp toc vrb xref 
  set CLEAN =css gz html pdf png
  
  cd /d "%~dp0"

:main

  if /i [%1] == [all]   goto :all
  if /i [%1] == [clean] goto :clean

  goto :help
  
:all

:clean

  for %%I in (%CLEAN%) do if exist *.%%I del /q *.%%I

:clean-int

  for %%I in (%AUXFILES%) do if exist *.%%I del /q *.%%I

  goto :end

:end 

  shift
  if not [%1] == [] goto :main