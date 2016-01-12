#****************************************************************************
# Copyright (c) 2015 by Daniel Grabowski.
#
# Created by: Daniel Grabowski
#
#****************************************************************************

cmake_minimum_required(VERSION 2.8.11)
project (lcd_control)

set(LCD_CONTROL_MAJOR_VERSION 0)
set(LCD_CONTROL_MINOR_VERSION 1)
set(LCD_CONTROL_PATCH_VERSION 0)
set(LCD_CONTROL_VERSION
  ${LCD_CONTROL_MAJOR_VERSION}, ${LCD_CONTROL_MINOR_VERSION}, ${LCD_CONTROL_PATCH_VERSION})

set(INSTALL_LIB_DIR lib CACHE PATH "Installation directory for libraries")
set(INSTALL_BIN_DIR bin CACHE PATH "Installation directory for binaries")
set(INSTALL_INCLUDE_DIR include CACHE PATH "Installation directory for header files")
set(DEF_INSTALL_CMAKE_DIR lib/CMake/lcd_control)
set(INSTALL_CMAKE_DIR ${DEF_INSTALL_CMAKE_DIR} CACHE PATH "Installation director for CMake files")

#add_subdirectory(sim)
add_subdirectory(rtl)

#########################################

