unit projetosimpleorm.model.entity.pessoa;

interface

uses
  SimpleAttributes;

type
  TPessoa = class
    private
      FId: Integer;
      FNome: String;
      FDataRegNasc: TDate;
    public
      [Campo('ID'), Pk, AutoInc]
      property Id: Integer read FId write FId;
      [Campo('NOME')]
      property Nome: String read FNome write FNome;
      [Campo('DATAREGNASC')]
      property DataRegNasc: TDate read FDataRegNasc write FDataRegNasc;
  end;
implementation

end.
