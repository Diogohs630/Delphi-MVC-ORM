unit projetosimpleorm.controller.dto.interfaces;

interface

uses
  System.Classes, projetosimpleorm.model.service.interfaces,
  projetosimpleorm.model.entity.cliente, projetosimpleorm.model.entity.pessoa,
  projetosimpleorm.model.entity.endereco,
  projetosimpleorm.model.entity.produto, projetosimpleorm.model.entity.pedido,
  projetosimpleorm.model.entity.pedidoitens;

type
  iCliente = interface
    function Id(Value: Integer): iCliente; overload;
    function Id: Integer; overload;
    function IdPessoa(Value: Integer): iCliente; overload;
    function IdPessoa: Integer; overload;
    function Tipo(Value: String): iCliente; overload;
    function Tipo: String; overload;
    function CpfCnpj(Value: String): iCliente; overload;
    function CpfCnpj: String; overload;
    function Email(Value: String): iCliente; overload;
    function Email: String; overload;
    function Telefone(Value: String): iCliente; overload;
    function Telefone: String; overload;
    function Foto(Value: TStream): iCliente; overload;
    function Foto: TStream; overload;
    function Build: iService<TCliente>;
  end;

  iPessoa = interface
    function Id(Value: Integer): iPessoa; overload;
    function Id: Integer; overload;
    function Nome(Value: String): iPessoa; overload;
    function Nome: String; overload;
    function DataNascReg(Value: String): iPessoa; overload;
    function DataNascReg(Value: String): iPessoa; overload;
    function Build: iService<TPessoa>;
  end;

  iEndereco = interface
    function Id(Value: Integer): iEndereco; overload;
    function Id: Integer; overload;
    function IdPessoa(Value: Integer): iEndereco; overload;
    function IdPessoa: Integer; overload;
    function Logradouro(Value: String): iEndereco; overload;
    function Logradouro: String; overload;
    function Numero(Value: Integer): iEndereco; overload;
    function Numero: Integer; overload;
    function Complemento(Value: String): iEndereco; overload;
    function Complemento: String; overload;
    function Cidade(Value: String): iEndereco; overload;
    function Cidade: String; overload;
    function Bairro(Value: String): iEndereco; overload;
    function Bairro: String; overload;
    function Tipo(Value: String): iEndereco; overload;
    function Tipo: String; overload;
    function Estado(Value: String): iEndereco; overload;
    function Estado: String; overload;
    function Build: iService<TEndereco>;
  end;

  iProduto = interface
    function Id(Value: Integer): iProduto; overload;
    function Id: Integer; overload;
    function Descricao(Value: String): iProduto; overload;
    function Descricao: String; overload;
    function PrecoVenda(Value: Real): iProduto; overload;
    function PrecoVenda: Real; overload;
    function Foto(Value: TStream): iProduto; overload;
    function Foto: TStream; overload;
    function Build: iService<TProduto>;
  end;

  iPedido = interface
    function Id(Value: Integer): iPedido; overload;
    function Id: Integer; overload;
    function IdCliente(Value: Integer): iPedido; overload;
    function IdCliente: Integer; overload;
    function DataEmissao(Value: TDate): iPedido; overload;
    function DataEmissao: TDate; overload;
    function ValorTotal(Value: Real): iPedido; overload;
    function ValorTotal: Real; overload;
    function Build: iService<TPedido>;
  end;

  iPedidoItens = interface
    function Id(Value: Integer): iPedidoItens; overload;
    function Id: Integer; overload;
    function IdPedido(Value: Integer): iPedidoItens; overload;
    function IdPedido: Integer; overload;
    function IdProduto(Value: Integer): iPedidoItens; overload;
    function IdProduto: Integer; overload;
    function Quantidade(Value: Integer): iPedidoItens; overload;
    function Quantidade: Integer; overload;
    function ValorUnitario(Value: Real): iPedidoItens; overload;
    function ValorUnitario: Real; overload;
    function ValorTotal(Value: Real): iPedidoItens; overload;
    function ValorTotal: Real; overload;
    function Build: iService<TPedidoItens>;
  end;

implementation

end.
