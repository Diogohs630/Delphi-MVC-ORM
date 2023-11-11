unit projetosimpleorm.model.entity.pedido;

interface

uses
  SimpleAttributes;

type
  TPedido = class
    private
      FId: Integer;
      FIdCliente: Integer;
      FDataEmissao: TDate;
      FValorTotal: Real;
    public
      [Campo('ID'), Pk, AutoInc]
      property Id: Integer read FId write FId;
      [Campo('ID_CLIENTE'), Fk]
      property IdCliente: Integer read FIdCliente write FIdCliente;
      [Campo('DATAEMISSAO')]
      property DataEmissao: TDate read FDataEmissao write FDataEmissao;
      [Campo('VALORTOTAL'), Format('#.##0,00')]
      property ValorTotal: Real read FValorTotal write FValorTotal;
  end;

implementation

end.
