object DM: TDM
  OnCreate = DataModuleCreate
  Height = 290
  Width = 450
  object FDConnection: TFDConnection
    LoginPrompt = False
    Left = 40
    Top = 24
  end
  object FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink
    Left = 160
    Top = 24
  end
  object qryVeiculos: TFDQuery
    Connection = FDConnection
    Left = 40
    Top = 96
  end
  object qryConfig: TFDQuery
    Connection = FDConnection
    Left = 160
    Top = 96
  end
  object qryRelatorio: TFDQuery
    Connection = FDConnection
    Left = 280
    Top = 96
  end
  object qryAux: TFDQuery
    Connection = FDConnection
    Left = 40
    Top = 176
  end
end
