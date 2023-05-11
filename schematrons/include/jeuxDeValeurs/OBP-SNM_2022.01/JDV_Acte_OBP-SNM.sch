<?xml version="1.0" encoding="UTF-8"?>

<!--  JDV_Acte_OBP-SNM.sch :
    
    Historique :
        25/10/2022  : Version 2022.01 (création) 
        -->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="JDV_Acte_OBP-SNM" is-a="dansJeuDeValeurs">
    <param name="path_jdv" value="$JDV_Acte_OBP-SNM" />
    <param name="vue_elt" value="ClinicalDocument/component/structuredBody/component/section/entry/procedure/code" />
    <param name="xpath_elt" value="cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.118']/cda:entry/cda:procedure[cda:templateId/@root='1.2.250.1.213.1.1.3.62' and not(cda:code/@code='17636008') and not(cda:code/@code='77946005')]/cda:code"/>
    <param name="nullFlavor" value="0"/>
    
</pattern> 

