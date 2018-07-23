object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 302
  Width = 526
  object KinveyProvider1: TKinveyProvider
    ApiVersion = '3'
    AppKey = 'kid_Skqty_Phz'
    AppSecret = 'c39346783b214271bcca89f88496282e'
    MasterSecret = '30143a74170d45b5b918ac4699361209'
    UserName = 'tester'
    Password = 'tester04'
    Left = 79
    Top = 32
  end
  object BackendStorage1: TBackendStorage
    Provider = KinveyProvider1
    Left = 208
    Top = 32
  end
end
