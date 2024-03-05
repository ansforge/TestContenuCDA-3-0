<?xml version="1.0" encoding="UTF-8"?>

<!-- E_birthEventOrganizer_fr.sch
    
    Teste la conformité de l'entrée FR-Naissance (1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2) aux spécifications du CI-SIS
    
    Historique :
    03/07/2017 : Création E_birthEventOrganizer_fr.sch
    14/02/2024 : Suppression du contrôle sur sexe et date de naissance (qui ne sont pas obligatoires)
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_birthEventOrganizer_fr">
  
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2"]'>  

        <assert test="count(cda:id)=1">
            [E_birthEventOrganizer_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-Naissance, un seul élément "id" doit être présent
        </assert>
       
        <assert test="cda:code[@code='118215003' and @codeSystem='2.16.840.1.113883.6.96']">
            [E_birthEventOrganizer_fr] Erreur de conformité CI-SIS : Dans l'élément "FR-Naissance", le code doit avoir les attributs fixés à : @code='118215003' et @codeSystem ='2.16.840.1.113883.6.96'.
        </assert>
        
        <assert test="cda:statusCode[@code='completed']"> 
            [E_birthEventOrganizer_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-Naissance, l'élément statusCode doit êre fixé à la valeur code='completed'. 
        </assert>
        
        <assert test="count(cda:subject)=1">
            [E_birthEventOrganizer_fr] : L'entrée FR-Naissance ne doit contenir qu'un seul élément "subject" pour décrire le nouveau né
        </assert>
       
        <assert test="count(cda:subject/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.15.2'])=1">
            [E_birthEventOrganizer_fr] : Le templateId du sujet doit être '1.3.6.1.4.1.19376.1.5.3.1.4.15.2' et ne peut être présent qu'une seule fois
        </assert>
        
        <assert test="count(cda:subject/cda:relatedSubject/cda:code)=1">
            [E_birthEventOrganizer_fr] : L'élément relatedSubject du sujet doit obligatoirement contenir un code
        </assert>
        
        <assert test="cda:subject[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.15.2']/cda:relatedSubject/cda:code[@code='CHILD' and @codeSystem='2.16.840.1.113883.5.111']">
            [E_birthEventOrganizer_fr] : L'entrée FR-Naissance doit contenir un élément "subject" avec les attributs @code et @codeSystem qui sont fixés aux valeurs suivantes :
            - code="CHILD"
            - codeSystem="2.16.840.1.113883.5.111"
        </assert>
        
        <assert test="count(cda:subject/cda:relatedSubject/cda:subject)=1">
            [E_birthEventOrganizer_fr] : L'élément relatedSubject du sujet doit obligatoirement contenir un élément 'subject' qui groupera les caractéristiques du nouveau né
        </assert>

        <assert test="count(cda:subject/cda:relatedSubject/cda:subject/cda:administrativeGenderCode)=1">
            [E_birthEventOrganizer_fr] : Le sexe du nouveau né doit obligatoirement être présent
        </assert>
        
        <assert test="count(cda:subject/cda:relatedSubject/cda:subject/cda:birthTime)&lt;=1">
            [E_birthEventOrganizer_fr] : La date de naissance du nouveau né peut être présente maximum une fois [0..1].
        </assert>
                
    </rule>
</pattern>