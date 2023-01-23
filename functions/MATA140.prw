#INCLUDE "RWMAKE.CH"
#INCLUDE "TBICONN.CH"
 
User Function eMata140()
 
Local nOpc := 3
 
    Private aCabec      := {}
    Private aItens      := {}
    Private aLinha      := {}
    Private lMsErroAuto := .F.
 
    PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "COM" TABLES "SF1","SD1","SA1","SA2","SB1","SB2","SF4"
     
    aAdd(aCabec,{'F1_TIPO','N',NIL})
    aAdd(aCabec,{'F1_FORMUL','N',NIL})
    aAdd(aCabec,{'F1_DOC','000005',NIL})
    aAdd(aCabec,{"F1_SERIE","01",NIL})
    aAdd(aCabec,{"F1_EMISSAO",dDataBase,NIL})
    aAdd(aCabec,{'F1_FORNECE','000001',NIL})
    aAdd(aCabec,{'F1_LOJA','01',NIL})
    aAdd(aCabec,{"F1_ESPECIE","NF",NIL})
    aAdd(aCabec,{"F1_COND",'001',NIL})
    aAdd(aCabec,{"F1_STATUS",'',NIL})
      
    aAdd(aItens,{'D1_ITEM',StrZero(1,4),NIL})
    aAdd(aItens,{'D1_COD',"01",NIL})
    aAdd(aItens,{"D1_QUANT",1,Nil})
    aAdd(aItens,{"D1_VUNIT",1,Nil})
    aAdd(aItens,{"D1_TOTAL",1,Nil})
    aAdd(aItens,{"D1_TES",'',NIL})
      
    aAdd(aLinha,aItens)
      
    MSExecAuto({|x,y,z,a,b| MATA140(x,y,z,a,b)}, aCabec, aLinha, nOpc,,)
      
    If lMsErroAuto
        mostraerro()
    Else
        Alert("Execauto MATA140 executado com sucesso!")
    EndIf
     
    RESET ENVIRONMENT
  
Return
