unit projetosimpleorm.model.resources.interfaces;

interface

uses
  Data.DB;

type
  iConexao = interface
    function Connect: TCustomConnection;
  end;

  iConfiguracao = interface
    function DriverID(Value: String): iConfiguracao; overload;
    function DriverID: String; overload;
    function database(Value: String): iConfiguracao; overload;
    function database: String; overload;
    function UserName(Value: String): iConfiguracao; overload;
    function UserName: String; overload;
    function Password(Value: String): iConfiguracao; overload;
    function Password: String; overload;
    function Port(Value: String): iConfiguracao; overload;
    function Port: String; overload;
    function Server(Value: String): iConfiguracao; overload;
    function Server: String; overload;
    function Schema(Value: String): iConfiguracao; overload;
    function Schema: String; overload;
    function Locking(Value: String): iConfiguracao; overload;
    function Locking: STring; overload;
  end;

  iResource = interface
    function Conexao: iConexao;
    function Configuracao: iConfiguracao;
  end;
implementation

end.
