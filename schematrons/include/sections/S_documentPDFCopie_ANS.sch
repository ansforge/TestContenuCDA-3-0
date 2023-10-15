<?xml version="1.0" encoding="UTF-8"?>


<!-- S_documentPDFCopie_ANS.sch
    
     Vérification de la conformité de la section FR-Document-PDF-copie (1.2.250.1.213.1.1.2.243) créée par l'ANS
        
    Historique :
    14/09/2023 : Création
   
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_documentPDFCopie_ANS">
    <title>Vérification de la conformité de la section FR-Document-PDF-copie (1.2.250.1.213.1.1.2.243) créée par l'ANS</title>
    
    <rule context='*[cda:templateId/@root = "1.2.250.1.213.1.1.2.243"]'>
        
        <!-- Verifier que le templateId est utilisé pour une section -->
        <assert test="../cda:section"> 
            [S_documentPDFCopie_ANS.sch] Erreur de conformité CI-SIS : Cet élément ne peut être utilisé que comme section.
        </assert>
        
        <assert test="cda:text">
            [S_documentPDFCopie_ANS.sch] Erreur de conformité CI-SIS : La section doit contenir un élément 'text'
        </assert>
        <!-- Vérifier le titre de la section -->
        <assert test="cda:title">
            [S_documentPDFCopie_ANS.sch] Erreur de conformité CI-SIS : La section doit contenir un élément 'title'
        </assert>
        
        <!-- Vérifier le code de la section -->
        <assert test='cda:code[@code ="55108-5"]'>
            [S_documentPDFCopie_ANS.sch] Erreur de conformité CI-SIS : Le code de cette section doit être '55108-5'
        </assert>

        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [S_documentPDFCopie_ANS.sch] Erreur de conformité CI-SIS : Le code de la section doit être un code 'LOINC'  
            (2.16.840.1.113883.6.1). 
        </assert> 
        
        <assert test='//cda:templateId[@root = "1.2.250.1.213.1.1.3.18"]'> 
            [S_documentPDFCopie_ANS.sch] Erreur de conformité CI-SIS : L'entrée Document attaché (1.2.250.1.213.1.1.3.18) est obligatoirement présente dans cette section
        </assert> 
        
    </rule>

</pattern>
