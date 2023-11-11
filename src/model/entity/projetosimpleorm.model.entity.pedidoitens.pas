unit projetosimpleorm.model.entity.pedidoitens;

interface

uses
  SimpleAttributes;

type
  TPedidoItens = class
    private
    FId: Integer;
    FIdPedido: Integer;
    FIdProduto: Integer;
    FValorUnitario: Real;
    FValotTotal: Real;
    public
      [Campo('ID'), Pk, AutoInc]
      property Id: Integer read FId write FId;
      [Campo('ID_PEDIDO'), Fk]
      property IdPedido: Integer read FIdPedido write FIdPedido;
      [Campo('ID_PRODUTO'), Fk]
      property IdProduto: Integer read FIdProduto write FIdProduto;
      [Campo('VALORUNITARIO'), Format('#.##0,00')]
      property ValorUnitario: Real read FValorUnitario write FValorUnitario;
      [Campo('VALORTOTAL'), Format('#.##0,00')]
      property ValotTotal: Real read FValotTotal write FValotTotal;
  end;

implementation

end.
