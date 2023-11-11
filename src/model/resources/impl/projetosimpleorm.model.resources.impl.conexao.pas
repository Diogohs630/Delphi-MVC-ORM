unit projetosimpleorm.model.resources.impl.conexao;

interface

uses
  projetosimpleorm.model.resources.interfaces,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.DApt,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef,
  FireDAC.Stan.ExprFuncs,
  //FireDAC.Phys.MSSQLWrapper.Stat,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI;

type
  TConexao = class(TInterfacedObject, iConexao)
    private
      FConfiguracao: iConfiguracao;
      FConn: TFDConnection;
    public
      constructor Create(Configuracao: iConfiguracao);
      destructor Destroy; override;
      class function New(Configuracao: iConfiguracao): iConexao;
      function Connect: TCustomConnection;
  end;

implementation

uses
  System.SysUtils;

{ TConexao }

{ TConexao }

function TConexao.Connect: TCustomConnection;
begin
  try
    FConn.Params.DriverID := FConfiguracao.DriverID();
    FConn.Params.Database := FConfiguracao.DriverID();
    FConn.Params.UserName := FConfiguracao.DriverID();
    FConn.Params.Password := FConfiguracao.DriverID();
    FConn.Params.Add('Port=' + FConfiguracao.Port());
    FConn.Params.Add('Server=' + FConfiguracao.Server());

    if not FConfiguracao.Schema.IsEmpty then
    begin
      FConn.Params.Add('MetaCurSchema='+FConfiguracao.Schema());
      FConn.Params.Add('MetaDefSchema='+FConfiguracao.Schema());
    end;

    if not FConfiguracao.Locking.IsEmpty then
      FConn.Params.Add('LockingMode='+FConfiguracao.Locking());

    FConn.Connected := True;
    Result := FConn;
  except
    raise Exception.Create('Não foi possível realizar a conexão');
  end;
end;

constructor TConexao.Create(Configuracao: iConfiguracao);
begin
  FConn := TFDConnection.Create(nil);
  FConfiguracao := Configuracao;
end;

destructor TConexao.Destroy;
begin
  FreeAndNil(FConn);
  inherited;
end;

class function TConexao.New(Configuracao: iConfiguracao): iConexao;
begin
  Result := Self.Create(Configuracao);
end;

end.
