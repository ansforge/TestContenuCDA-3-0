:: ---------------------------------------------------------------------------------------
:: Execution : compilverif contenu schema
:: Le fichier ..\..\contenu.xml est valid� / au standard (..\..\infrastructure\cda\CDA.xsd),
:: puis v�rifi� s�mantiquement suivant le sch�matron ..\schema.xsl
:: Le moteur xslt2 utilise est  saxon9he.jar, open source ecrit en java
:: Le resultat est produit dans un rapport au standard svrl : ..\rapports\contenu_verif.xml
:: Le rapport est visualisable dans n'importe quel navigateur grace a la feuille de style 
:: rapportSchematronToHtml4.xsl qui lui est attachee.
:: ---------------------------------------------------------------------------------------
@echo off
if "%1"=="" goto USAGE
set schema=%2
if "%2"=="" set schema=profils\CI-SIS_StructurationMinimale
::echo.
::echo S�lection de l'arbre ClinicalDocument dans %1.xml
::@echo on
::java -cp saxon9he.jar net.sf.saxon.Transform -s:..\..\%1.xml -xsl:selectCDA.xsl -o:tmp\%1.xml
::@echo off
echo.
echo Validation du fichier %1.xml par rapport au schema CDA
@echo on
::java -jar xsdvalidator-1.3.jar ..\..\%1.xml "..\..\infrastructure\cda\CDA_extended.xsd" 1> ..\rapports\%1_validCDA.xml
java -Duser.language=en XSDValidator ..\..\ExemplesCDA\%1.xml "..\..\infrastructure\cda\CDA_extended.xsd" 1> ..\rapports\%1_validCDA.xml
@echo off
:: Partie � ne garder qu'en d�veloppement
:: Test de conformit� � IHE
del colle.sch concret.sch
echo.
echo 1) Pre-compilation du schematron : collage des include
@echo on
java -cp saxon9he.jar net.sf.saxon.Transform -s:..\profils\IHE.sch -xsl:iso_dsdl_include.xsl -o:colle.sch
@echo off
echo.
echo 2) Pre-compilation du schematron : expansion des abstract
@echo on
java -cp saxon9he.jar net.sf.saxon.Transform -s:colle.sch -xsl:iso_abstract_expand.xsl -o:concret.sch 
@echo off
echo.
echo 3) Compilation en xslt2 : produit \profils\IHE.xsl
@echo on
java -cp saxon9he.jar net.sf.saxon.Transform -s:concret.sch -xsl:iso_svrl_for_xslt2.xsl -o:..\profils\IHE.xsl 
@echo off
::
echo.
echo Verification du fichier %1.xml
@echo on
java -cp saxon9he.jar net.sf.saxon.Transform -s:..\..\ExemplesCDA\%1.xml -xsl:..\profils\IHE.xsl -o:..\rapports\%1_verif_IHE_corps.xml 
@echo off
echo.
echo Rapport de verification : ..\rapports\%1_verif_IHE_corps.xml
echo.
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Partie � ne garder qu'en d�veloppement
:: Test des terminologies
del colle.sch concret.sch
echo.
echo 1) Pre-compilation du schematron : collage des include
@echo on
java -cp saxon9he.jar net.sf.saxon.Transform -s:..\profils\terminologies\schematron\terminologie.sch -xsl:iso_dsdl_include.xsl -o:colle.sch
@echo off
echo.
echo 2) Pre-compilation du schematron : expansion des abstract
@echo on
java -cp saxon9he.jar net.sf.saxon.Transform -s:colle.sch -xsl:iso_abstract_expand.xsl -o:concret.sch 
@echo off
echo.
echo 3) Compilation en xslt2 : produit \profils\terminologies\schematron\terminologie.xsl
@echo on
java -cp saxon9he.jar net.sf.saxon.Transform -s:concret.sch -xsl:iso_svrl_for_xslt2.xsl -o:..\profils\terminologies\schematron\terminologie.xsl 
@echo off
::
echo.
echo Verification du fichier %1.xml
@echo on
java -cp saxon9he.jar net.sf.saxon.Transform -s:..\..\ExemplesCDA\%1.xml -xsl:..\\profils\terminologies\schematron\terminologie.xsl -o:..\rapports\%1_verif_terminologies.xml 
@echo off
echo.
echo Rapport de verification : ..\rapports\%1_verif_terminologies.xml
echo.
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Partie � ne garder qu'en d�veloppement
:: Test de conformit� des sections et entr�es aux mod�les de contenus CDA
del colle.sch concret.sch
echo.
echo 1) Pre-compilation du schematron : collage des include
@echo on
java -cp saxon9he.jar net.sf.saxon.Transform -s:..\profils\CI-SIS_ModelesDeContenusCDA.sch -xsl:iso_dsdl_include.xsl -o:colle.sch
@echo off
echo.
echo 2) Pre-compilation du schematron : expansion des abstract
@echo on
java -cp saxon9he.jar net.sf.saxon.Transform -s:colle.sch -xsl:iso_abstract_expand.xsl -o:concret.sch 
@echo off
echo.
echo 3) Compilation en xslt2 : produit \profils\CI-SIS_ModelesDeContenusCDA.xsl
@echo on
java -cp saxon9he.jar net.sf.saxon.Transform -s:concret.sch -xsl:iso_svrl_for_xslt2.xsl -o:..\profils\CI-SIS_ModelesDeContenusCDA.xsl 
@echo off
::
echo.
echo Verification du fichier %1.xml
@echo on
java -cp saxon9he.jar net.sf.saxon.Transform -s:..\..\ExemplesCDA\%1.xml -xsl:..\profils\CI-SIS_ModelesDeContenusCDA.xsl -o:..\rapports\%1_verif_ModelesDeContenusCDA.xml 
@echo off
echo.
echo Rapport de verification : ..\rapports\%1_verif_ModelesDeContenusCDA.xml
echo.
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Partie � ne garder qu'en d�veloppement
:: Test de conformit� � IHE_XDS-SD
del colle.sch concret.sch
echo.
echo 1) Pre-compilation du schematron : collage des include
@echo on
java -cp saxon9he.jar net.sf.saxon.Transform -s:..\profils\IHE_XDS-SD.sch -xsl:iso_dsdl_include.xsl -o:colle.sch
@echo off
echo.
echo 2) Pre-compilation du schematron : expansion des abstract
@echo on
java -cp saxon9he.jar net.sf.saxon.Transform -s:colle.sch -xsl:iso_abstract_expand.xsl -o:concret.sch 
@echo off
echo.
echo 3) Compilation en xslt2 : produit \profils\IHE_XDS-SD.xsl
@echo on
java -cp saxon9he.jar net.sf.saxon.Transform -s:concret.sch -xsl:iso_svrl_for_xslt2.xsl -o:..\profils\IHE_XDS-SD.xsl 
@echo off
::
echo.
echo Verification du fichier %1.xml
@echo on
java -cp saxon9he.jar net.sf.saxon.Transform -s:..\..\ExemplesCDA\%1.xml -xsl:..\profils\IHE_XDS-SD.xsl -o:..\rapports\%1_verif_IHE_entete.xml 
@echo off
echo.
echo Rapport de verification : ..\rapports\%1_verif_IHE_entete.xml
echo.
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Partie � ne garder qu'en d�veloppement
:: Test de conformit� � la structuration minimale
del colle.sch concret.sch
echo.
echo 1) Pre-compilation du schematron : collage des include
@echo on
java -cp saxon9he.jar net.sf.saxon.Transform -s:..\profils\CI-SIS_StructurationMinimale.sch -xsl:iso_dsdl_include.xsl -o:colle.sch
@echo off
echo.
echo 2) Pre-compilation du schematron : expansion des abstract
@echo on
java -cp saxon9he.jar net.sf.saxon.Transform -s:colle.sch -xsl:iso_abstract_expand.xsl -o:concret.sch 
@echo off
echo.
echo 3) Compilation en xslt2 : produit \profils\CI-SIS_StructurationMinimale.xsl
@echo on
java -cp saxon9he.jar net.sf.saxon.Transform -s:concret.sch -xsl:iso_svrl_for_xslt2.xsl -o:..\profils\CI-SIS_StructurationMinimale.xsl 
@echo off
::
echo.
echo Verification du fichier %1.xml
@echo on
java -cp saxon9he.jar net.sf.saxon.Transform -s:..\..\ExemplesCDA\%1.xml -xsl:..\profils\CI-SIS_StructurationMinimale.xsl -o:..\rapports\%1_verif_StructurationMinimale.xml 
@echo off
echo.
echo Rapport de verification : ..\rapports\%1_verif_StructurationMinimale.xml
echo.
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Partie � ne garder qu'en d�veloppement
:: Test de conformit� aux mod�les ANS
del colle.sch concret.sch
echo.
echo 1) Pre-compilation du schematron : collage des include
@echo on
java -cp saxon9he.jar net.sf.saxon.Transform -s:..\profils\CI-SIS_Modeles_ANS.sch -xsl:iso_dsdl_include.xsl -o:colle.sch
@echo off
echo.
echo 2) Pre-compilation du schematron : expansion des abstract
@echo on
java -cp saxon9he.jar net.sf.saxon.Transform -s:colle.sch -xsl:iso_abstract_expand.xsl -o:concret.sch 
@echo off
echo.
echo 3) Compilation en xslt2 : produit \profils\CI-SIS_Modeles_ANS.xsl
@echo on
java -cp saxon9he.jar net.sf.saxon.Transform -s:concret.sch -xsl:iso_svrl_for_xslt2.xsl -o:..\profils\CI-SIS_Modeles_ANS.xsl 
@echo off
::
echo.
echo Verification du fichier %1.xml
@echo on
java -cp saxon9he.jar net.sf.saxon.Transform -s:..\..\ExemplesCDA\%1.xml -xsl:..\profils\CI-SIS_Modeles_ANS.xsl -o:..\rapports\%1_verif_Modeles_ANS.xml 
@echo off
echo.
echo Rapport de verification : ..\rapports\%1_verif_Modeles_ANS.xml
echo.

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Partie � ne garder qu'en d�veloppement
:: Test de conformit� au volet
del colle.sch concret.sch
echo.
echo 1) Pre-compilation du schematron : collage des include
@echo on
java -cp saxon9he.jar net.sf.saxon.Transform -s:..\%schema%.sch -xsl:iso_dsdl_include.xsl -o:colle.sch
@echo off
echo.
echo 2) Pre-compilation du schematron : expansion des abstract
@echo on
java -cp saxon9he.jar net.sf.saxon.Transform -s:colle.sch -xsl:iso_abstract_expand.xsl -o:concret.sch 
@echo off
echo.
echo 3) Compilation en xslt2 : produit %schema%.xsl
@echo on
java -cp saxon9he.jar net.sf.saxon.Transform -s:concret.sch -xsl:iso_svrl_for_xslt2.xsl -o:..\%schema%.xsl 
@echo off
::
echo.
echo Verification du fichier %1.xml
@echo on
java -cp saxon9he.jar net.sf.saxon.Transform -s:..\..\ExemplesCDA\%1.xml -xsl:..\%schema%.xsl -o:..\rapports\%1_verif.xml 
@echo off
echo.
echo Rapport de verification : ..\rapports\%1_verif.xml
echo.
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

goto END
:USAGE
echo.
echo USAGE: %0 fichier_a_verifier_sans_extension schematron_sans_extension
echo.
echo le fichier a verifier doit exister avec l'extension xml dans le repertoire ..\.. 
echo les schematrons doivent etre sous la forme xslt2 dans le repertoire .. ;
echo les rapports de verification sont produits dans le repertoire ..\rapports
echo.
:END
