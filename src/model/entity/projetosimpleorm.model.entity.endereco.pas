unit projetosimpleorm.model.entity.endereco;

interface

uses
  SimpleAttributes;

type
  TEndereco = class
    private
      FID: Integer;
      FIdPessoa: Integer;
      FLogradouro: String;
      FComplemento: String;
      FNumero: Integer;
      FBairro: String;
      FCidade: String;
      FTipo: String;
      FEstado: String;
    public
      [Campo('ID'), Pk, AutoInc]
      property Id: Integer read FID write FID;
      [Campo('ID_PESSOA'), Fk]
      property IdPessoa: Integer read FIdPessoa write FIdPessoa;
      [Campo('LOGRADOURO'), Pk]
      property Logradouro: String read FLogradouro write FLogradouro;
      [Campo('COMPLEMENTO')]
      property Complemento: String read FComplemento write FComplemento;
      [Campo('NUMERO')]
      property Numero: Integer read FNumero write FNumero;
      [Campo('BAIRRO')]
      property Bairro: String read FBairro write FBairro;
      [Campo('CIDADE')]
      property Cidade: String read FCidade write FCidade;
      [Campo('ESTADO')]
      property Estado: String read FEstado write FEstado;
      [Campo('TIPO')]
      property Tipo: String read FTipo write FTipo;
  end;

implementation

{ TEndereco }

end.
