<?xml version="1.0" encoding="UTF-8"?>

<!-- E_comments_fr.sch
    
    Vérification de la conformité de l'entrée FR-Commentaire-ER (comments - 1.3.6.1.4.1.19376.1.5.3.1.4.2)
    
    27/03/2023 : Création
    
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_comments_fr">
    
        <title>IHE PCC Comments</title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.2"]'>
        
        <assert test='cda:templateId[@root="1.2.250.1.213.1.1.3.32"]'>
            [E_comments_fr] Erreur de Conformité PCC: Le templateId (1.2.250.1.213.1.1.3.32) de l'entrée
            Comments doit être déclaré.
        </assert>
        
    </rule>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.32"]'>
        
        <assert test='cda:templateId[@root="1.3.6.1.4.1.19376.1.5.3.1.4.2"]'>
            [E_comments_fr] Erreur de Conformité PCC: Le templateId (1.3.6.1.4.1.19376.1.5.3.1.4.2) de l'entrée
            Comments doit être déclaré.
        </assert>
        
    </rule>
</pattern>