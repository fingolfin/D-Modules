#############################################################################
##
##  Tools.gd                                               D-Modules package
##
##  Copyright 2010, Mohamed Barakat, University of Kaiserslautern
##
##  Declarations of tool procedures.
##
#############################################################################

####################################
#
# global functions and operations:
#
####################################

# basic operations:

DeclareOperation( "ApplyToSection",
        [ IsHomalgMatrix, IsHomalgMatrix ] );

DeclareOperation( "SolutionOfSystem",
        [ IsHomalgMatrix ] );

DeclareOperation( "NumeratorOfDifferentialAction",
        [ IsString, IsString, IsString, IsHomalgRing ] );

DeclareOperation( "NumeratorOfDifferentialAction",
        [ IsString, IsInt, IsString, IsString, IsHomalgRing ] );

