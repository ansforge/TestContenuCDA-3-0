<?xml version="1.0" encoding="UTF-8"?>

<!--                  
    Entete_VSM_2023.sch
    Teste la conformité de l'entete du VSM_2023.01 au CI-SIS
    
    Historique :
    14/09/2023 : Création    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Entete_VSM_2023">
    
    <!-- Contrôles spécifiques à l'en tête -->
        <rule context="cda:ClinicalDocument">
            <!-- Verifier le templateId du modèle VSM 2023.01 -->
            <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.13']"> 
                [VSM_2023.01] Le templateId "Conformité au VSM" (1.2.250.1.213.1.1.1.13) doit être présent.
            </assert>
            <!-- Verifier le code du modèle VSM 2023.01 -->
            <assert test="cda:code[@code='SYNTH' and @codeSystem='1.2.250.1.213.1.1.4.12']"> 
                [VSM_2023.01] L'élément code doit avoir @code ="SYNTH" et @codeSystem = "1.2.250.1.213.1.1.4.12"/>. 
            </assert>
        
    </rule>
            <rule context="cda:ClinicalDocument">
                <!-- Vérifier le contenu des attributs de l'acte documenté -->
                <assert test="(cda:documentationOf/cda:serviceEvent/cda:code[@code='34117-2']) 
                    and (cda:documentationOf/cda:serviceEvent/cda:code[@displayName='Historique et clinique'])                                                                                  
                    and (cda:documentationOf/cda:serviceEvent/cda:code[@codeSystem='2.16.840.1.113883.6.1'])                                                                              
                    and (cda:documentationOf/cda:serviceEvent/cda:code[@codeSystemName='LOINC'])">
                    [VSM_2023.01] L'acte documenté doit être documentationOf/serviceEvent/code@code='34117-2', @displayName='Historique et clinique', @codeSystem='2.16.840.1.113883.6.1' et @codeSystemName='LOINC'.
                </assert>
            </rule>
</pattern>