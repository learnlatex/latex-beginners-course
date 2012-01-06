@echo off

rem Makefile for 'LaTeX for Beginners' materials

   if not [%1] == [] goto :init
   
:help

  rem Default with no target is to give help

  echo.
  echo  make all      - make all targets
  echo  make clean    - clean out directory
  echo  make handouts - make student handouts
  echo  make online   - make HTML version
  echo  make notes    - make tutor notes
  echo  make slides   - make slides
  echo.

  goto :EOF
   
:init
	
  rem Avoid clobbering anyone else's variables

  setlocal

  set AUXFILES=4ct 4tc aux dvi idv lg log nav out snm tmp toc vrb xref 
  set CLEAN=css gz html pdf png svg
  
  cd /d "%~dp0"

:main

  if /i [%1] == [all]      goto :all
  if /i [%1] == [clean]    goto :clean
  if /i [%1] == [handouts] goto :handouts
  if /i [%1] == [online]   goto :online
  if /i [%1] == [slides]   goto :slides

  goto :help
  
:all

  call make handouts online slides

:clean

  for %%I in (%CLEAN%) do if exist *.%%I del /q *.%%I

:clean-int

  for %%I in (%AUXFILES%) do if exist *.%%I del /q *.%%I

  goto :end
  
:handouts

  call :pdf slides

  goto :end
  
:online

  htlatex online "online"

  goto :clean-int
  
:notes

  call :pdf tutornotes

  goto :end
  
:pdf

	echo "Typesetting %1"
	pdflatex -draftmode -interaction=nonstopmode %1 > nul
	if not ERRORLEVEL 1 (
	  pdflatex -interaction=nonstopmode %1 > nul
    )
	goto :clean-int
  
:slides

  call :pdf slides

  goto :end
  
:end 

  shift
  if not [%1] == [] goto :main