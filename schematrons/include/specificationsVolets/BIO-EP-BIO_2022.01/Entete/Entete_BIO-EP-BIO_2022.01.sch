<?xml version="1.0" encoding="UTF-8"?>
<!-- Entete_BIO-EP-BIO.sch    
     ......................................................................................................................................................
     Vérification de la conformité de l'entête au modèle du document Bio-eP-Bio du CI-SIS.
     ......................................................................................................................................................
     Historique :
        - 11/07/2022 : Création
       
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Entete_BIO-EP-BIO_2022.01">
    
    <rule context="cda:ClinicalDocument">
        
        <assert test="cda:templateId[@root='2.16.840.1.113883.2.8.2.1']"> 
            [Entete_BIO-EP-BIO] Déclarations de conformité aux spécifications HL7 France obligatoire (2.16.840.1.113883.2.8.2.1)
        </assert>
        
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.1']"> 
            [Entete_BIO-EP-BIO] Déclarations de conformité aux spécifications au CI-SIS obligatoire (1.2.250.1.213.1.1.1.1)
        </assert>
        
        <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.1.1']"> 
            [Entete_BIO-EP-BIO] Déclarations de conformité au modèle IHE PCC obligatoire (1.3.6.1.4.1.19376.1.5.3.1.1.1)
        </assert>
        
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.51' and @extension='2022.01']"> 
            [Entete_BIO-EP-BIO] Déclarations de conformité au modèle eP-BIO_2022.01 obligatoire (root="1.2.250.1.213.1.1.1.51" extension="2022.01")
        </assert>
        
        <assert test="cda:id[@root='1.2.250.1.215.500.1.1']"> 
            [Entete_BIO-EP-BIO] L'élément "id" doit avoir un attribut @root="1.2.250.1.215.500.1.1". 
        </assert>
        
        <assert test="cda:code[@code='PRESC-BIO' and @codeSystem='1.2.250.1.213.1.1.4.12']"> 
            [Entete_BIO-EP-BIO] L'élément "code" doit avoir les attributs @code="PRESC-BIO" et @codeSystem="1.2.250.1.213.1.1.4.12". 
        </assert>
        
        <assert test="//cda:title[text()='Prescription d’actes de biologie médicale']"> 
            [Entete_BIO-EP-BIO] L'élément "title" doit avoir comme valeur "Prescription d'actes de biologie médicale". 
        </assert>
        
        <assert test="cda:documentationOf/cda:serviceEvent/cda:code[@code='PRESC-BIO' and @codeSystem='1.2.250.1.213.1.1.4.12']"> 
            [Entete_BIO-EP-BIO] L'élément "documentationOf" doit avoir les attributs @code="PRESC-BIO" et @codeSystem="1.2.250.1.213.1.1.4.12". 
        </assert>
        
    </rule>
    
</pattern>