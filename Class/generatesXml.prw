#INCLUDE "TOTVS.CH"
#INCLUDE "XMLXFUN.CH"

//GvImporataMFE.pqw

class generatesXml

  method new() constructor
  method readXml() 
  method includeXml()

endclass

method new(RECEBXML) class generatesXml

  If Empty(RECEBCML)
    MsgInfo('O parametro (1) RECEBXML deve ser informado na instancia��o da Classe!')
    Return
  EndIf

  //Ideia � receber e enviar para o metodo readXml

  self:jXml:=RECEBXML

return 

method readXml() class generatesXml
  
  //Ideia � ler o xml e tratar para incluir em um json ou array

  //Aqui eu tenho o xml em self:jXml

return

method includeXml(jXml) class generatesXml
  eMata140(jXml)
return
