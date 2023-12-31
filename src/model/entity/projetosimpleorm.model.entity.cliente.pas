unit projetosimpleorm.model.entity.cliente;

interface

uses
  System.SysUtils,
  System.Classes,
  SimpleAttributes;

type
  [Tabela('Cliente')]
  TCliente = class
    private
      FEmail: String;
      FCpfCnpj: String;
      FID: Integer;
      FFoto: TStream;
      FIdPessoa: Integer;
      FTipo: String;
      FTelefone: String;
    procedure SetFoto(const Value: TStream);
    public
      constructor Create;
      destructor Destroy; override;
      [Campo('ID'), Pk, AutoInc]
      property Id: Integer read FID write FID;
      [Campo('ID_PESSOA'), Pk]
      property IdPessoa: Integer read FIdPessoa write FIdPessoa;
      [Campo('TIPO')]
      property Tipo: String read FTipo write FTipo;
      [Campo('CPFCNPJ')]
      property CpfCnpj: String read FCpfCnpj write FCpfCnpj;
      [Campo('EMAIL')]
      property Email: String read FEmail write FEmail;
      [Campo('TELEFONE')]
      property Telefone: String read FTelefone write FTelefone;
      [Campo('FOTO')]
      property Foto: TStream read FFoto write SetFoto;
  end;

implementation

{ TCliente }

constructor TCliente.Create;
begin
  FFoto := TMemoryStream.Create;
end;

destructor TCliente.Destroy;
begin
  FreeAndNil(FFoto);
  inherited;
end;

procedure TCliente.SetFoto(const Value: TStream);
begin
  if not Assigned(FFoto) then
  begin
    TMemoryStream(FFoto).Clear;
    Exit;
  end;

  Value.Position := 0;
  TMemoryStream(FFoto).LoadFromStream(Value);
end;

end.
