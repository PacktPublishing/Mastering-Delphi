object ClientModule1: TClientModule1
  OldCreateOrder = False
  Height = 271
  Width = 415
  object SQLConnection1: TSQLConnection
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'Port=8080'
      'HostName=127.0.0.1'
      'CommunicationProtocol=http'
      'DatasnapContext=datasnap/')
    Left = 48
    Top = 40
  end
end
