unit projetosimpleorm.model.service.impl.servicesimpleorm;

interface

uses
  projetosimpleorm.model.service.interfaces,
  Data.DB,
  SimpleInterface,
  SimpleDAO,
  SimpleQueryFireDAC,
  System.Generics.Collections,
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
  FireDAC.Comp.UI, projetosimpleorm.model.resources.interfaces;

type
  TServiceSimpleORM<T: Class, constructor> = class(TInterfacedObject, iService<T>)
    private
      FParent: T;
      FConexao: iConexao;
      FConn: iSimpleQuery;
      FDataSource: TDataSource;
      FDAO: iSimpleDAO<T>;
    public
      constructor Create(Parent: T);
      destructor Destroy; override;
      class function New(Parent: T): iService<T>;
      function ListarTodos: iService<T>;
      function ListarPorId(aId: Integer): iService<T>;
      function ListarPor(Field: String; value: Variant): iService<T>;
      function Inserir: iService<T>;
      function Atualizar: iService<T>;
      function Excluir: iService<T>; overload;
      function Excluir(Field, Value: String): iService<T>; overload;
      function DataSource(var aDataSource: TDataSource): iService<T>;
      function This: T;
  end;

implementation

uses
  projetosimpleorm.model.resources.impl.factory, System.SysUtils;

{ TServiceSimpleORM<T> }

function TServiceSimpleORM<T>.Atualizar: iService<T>;
begin
  Result := Self;
  FDAO.Update(FParent);
end;

constructor TServiceSimpleORM<T>.Create(Parent: T);
begin
  FParent := Parent;
  FDataSource := TDataSource.Create(nil);
  FConexao := TResource.New.Conexao;
  FConn := TSimpleQueryFireDAC.New(TFDConnection(FConexao.Connect));
  FDAO := TSimpleDAO<T>.New(FConn).DataSource(FDataSource);
end;

function TServiceSimpleORM<T>.DataSource(
  var aDataSource: TDataSource): iService<T>;
begin
  Result := Self;
  aDataSource := FDataSource;
end;

destructor TServiceSimpleORM<T>.Destroy;
begin
  FreeAndNil(FDataSource);
  inherited;
end;

function TServiceSimpleORM<T>.Excluir(Field, Value: String): iService<T>;
begin
  Result := Self;
  FDAO.Delete(Field, Value);
end;

function TServiceSimpleORM<T>.Excluir: iService<T>;
begin
  Result := Self;
  FDAO.Delete(FParent);
end;

function TServiceSimpleORM<T>.Inserir: iService<T>;
begin
  Result := Self;
  FDAO.Insert(FParent);
end;

function TServiceSimpleORM<T>.ListarPor(Field: String;
  value: Variant): iService<T>;
begin
  Result := Self;
  FDAO.Find(Field, Value);
end;

function TServiceSimpleORM<T>.ListarPorId(aId: Integer): iService<T>;
begin
  Result := Self;
  FParent := FDAO.Find(aId);
end;

function TServiceSimpleORM<T>.ListarTodos: iService<T>;
begin
  Result := Self;
  FDAO.Find(False);
end;

class function TServiceSimpleORM<T>.New(Parent: T): iService<T>;
begin
  Result := Self.Create(Parent);
end;

function TServiceSimpleORM<T>.This: T;
begin
  Result := FParent;
end;

end.
