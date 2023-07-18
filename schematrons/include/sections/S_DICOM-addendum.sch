<?xml version="1.0" encoding="UTF-8"?>
<!--  S_DICOM-addendum.sch
    
     Vérification de la conformité de la section FR-DICOM-Addendum (1.2.840.10008.9.6) aux spécifications DICOM
        
    Historique :
    17/07/2023 : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_DICOM-addendum">
    <title>Vérification de la conformité de la section FR-DICOM-Addendum aux spécifications DICOM</title>
    
    <rule context='*[cda:templateId/@root="1.2.840.10008.9.6"]'>
        
        <!-- Vérifier l'id de la section 'FR-DICOM-Addendum' -->
        <assert test="count(cda:id)&gt;=1">
            [ S_DICOM-addendum] Erreur de conformité au modèle CI-SIS : Si elle existe, une section FR-DICOM-Addendum (1.2.840.10008.9.6) doit obligatoirement contenir un ou plusieurs élément id.
        </assert>
        
        <!-- Vérifier le code de la section 'FR-DICOM-Addendum' -->
        <assert test="cda:code[@code='55107-7' and @codeSystem='2.16.840.1.113883.6.1']">
            [ S_DICOM-addendum] Erreur de conformité au modèle CI-SIS : Si elle existe, la section FR-DICOM-Addendum (1.2.840.10008.9.6) doit obligatoirement avoir comme code : @code='55107-7' et @codeSystem='2.16.840.1.113883.6.1'
        </assert>
        
        <!-- Vérifier le texte de la section 'FR-DICOM-Addendum' -->
        <assert test="count(cda:text)=1">
            [ S_DICOM-addendum] Erreur de conformité au modèle CI-SIS : Si elle existe, une section FR-DICOM-Addendum (1.2.840.10008.9.6) doit obligatoirement contenir l'élément texte.
        </assert>
        
        <!-- Vérifier le texte de la section 'FR-DICOM-Addendum' -->
        <assert test="count(cda:title)=1">
            [ S_DICOM-addendum] Erreur de conformité au modèle CI-SIS : Si elle existe, une section FR-DICOM-Addendum (1.2.840.10008.9.6) doit obligatoirement contenir l'élément title.
        </assert>
        
        <!-- Vérifier l'élément author de la section 'FR-DICOM-Addendum' -->
        <assert test="cda:author/cda:assignedAuthor/cda:assignedPerson/cda:name">
            [ S_DICOM-addendum] Erreur de conformité au modèle CI-SIS : Si elle existe, la section FR-DICOM-Addendum (1.2.840.10008.9.6) doit obligatoirement contenir l'élément author/assignedAuthor/assignedPerson/name
        </assert>
    </rule>
    
</pattern>