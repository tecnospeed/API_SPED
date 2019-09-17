unit uSPED;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdHTTP, IdIOHandler, IdIOHandlerSocket, DateUtils, IdBaseComponent, IdComponent,
  IdTCPConnection, Vcl.StdCtrls, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, System.JSON,
  REST.Types, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    edtCNPJ_SH: TEdit;
    edtToken: TEdit;
    edtEmissor: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    memRetorno: TMemo;
    edtID: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label6: TLabel;
    Label7: TLabel;
    PageControl1: TPageControl;
    Iniciar: TTabSheet;
    Enviar: TTabSheet;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    MTx2envio: TMemo;
    Label3: TLabel;
    Mretornogerado: TMemo;
    Label8: TLabel;
    Label9: TLabel;
    Label5: TLabel;
    memoConsulta: TMemo;
    Label10: TLabel;
    memRetornoEnvio: TMemo;
    Retorno: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    fHTTPClient : TIdHTTP;
    fIOHandlerSocketOpenSSL : TIdSSLIOHandlerSocketOpenSSL;
    fParamList : TStringList;
    property HTTPClient : TIdHTTP read fHTTPClient write fHTTPClient;
    property ParamList : TStringList read fParamList write fParamList;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
/// Executando rota de iniciar apura��o
procedure TForm1.Button1Click(Sender: TObject);
var
  url : string;
  RequestBody: TStream;
  ResponseBody: string;
  body: string;
  JSonValue: TJSonValue;
begin
  memRetorno.Clear;
  ParamList.Clear;
  memRetorno.Text := 'Iniciando Apura��o';
  Application.ProcessMessages;
  url := 'https://api.tecnospeed.com.br/sped-fiscal/iniciar';
  HTTPClient.Request.Accept := '*/*';
  HTTPClient.Request.ContentType := 'application/json';
  HTTPClient.Request.CustomHeaders.Clear;
  HTTPClient.Request.CustomHeaders.AddValue('cnpj_sh', edtCNPJ_SH.Text);
  HTTPClient.Request.CustomHeaders.AddValue('token_sh', edtToken.Text);
  HTTPClient.Request.CustomHeaders.AddValue('Content-Type', 'application/json');
  HTTPClient.Request.CustomHeaders.AddValue('cnpj_emissor', edtEmissor.Text);

  body := '{"data_inicio":"01-01-2018","data_fim": "30-01-2018","cnpj_emissor":"10150150","cnpj_sh":"4545454554","arquivo":"SpedArquivo12345.txt"}';
  RequestBody := TStringStream.Create(body, TEncoding.UTF8);

  ResponseBody :=  fHTTPClient.Post(url, RequestBody);
  memRetorno.Text := ResponseBody;


  JSonValue := TJSonObject.ParseJSONValue(ResponseBody);
  edtID.Text := JsonValue.GetValue<string>('data._id');
end;

// Executar rota de envio de registros para o SPED
procedure TForm1.Button2Click(Sender: TObject);
var
  url : string;
  RequestBody: TStream;
  ResponseBody: string;
  body: string;
begin
  memRetorno.Clear;
  ParamList.Clear;
  Application.ProcessMessages;
  url := 'https://api.tecnospeed.com.br/sped-fiscal/registros/' + edtID.Text;
  HTTPClient.Request.Accept := '*/*';
  HTTPClient.Request.ContentType := 'application/json';
  HTTPClient.Request.CustomHeaders.Clear;
  HTTPClient.Request.CustomHeaders.AddValue('cnpj_sh', edtCNPJ_SH.Text);
  HTTPClient.Request.CustomHeaders.AddValue('token_sh', edtToken.Text);
  HTTPClient.Request.CustomHeaders.AddValue('Content-Type', 'application/json');
  HTTPClient.Request.CustomHeaders.AddValue('cnpj_emissor', edtEmissor.Text);

  body := StringReplace(MTx2envio.Text,#13#10,  '\r\n' , [rfReplaceAll, rfIgnoreCase]);
  body := '{"tx2":["' + body + '"]}';

  RequestBody := TStringStream.Create(body, TEncoding.UTF8);
  memRetornoEnvio.Text :=   fHTTPClient.Post(url, RequestBody);
end;

//Rota que gera o arquivo SPED
procedure TForm1.Button3Click(Sender: TObject);
var
  url : string;
  RequestBody: TStream;
  ResponseBody: string;
  body: string;
begin
  memRetorno.Clear;
  ParamList.Clear;
  memRetorno.Text := 'Iniciando Apura��o';
  Application.ProcessMessages;
  url := 'https://api.tecnospeed.com.br/sped-fiscal/gerar/' + edtID.Text;
  HTTPClient.Request.Accept := '*/*';
  HTTPClient.Request.ContentType := 'application/json';
  HTTPClient.Request.CustomHeaders.Clear;
  HTTPClient.Request.CustomHeaders.AddValue('cnpj_sh', edtCNPJ_SH.Text);
  HTTPClient.Request.CustomHeaders.AddValue('token_sh', edtToken.Text);
  HTTPClient.Request.CustomHeaders.AddValue('Content-Type', 'application/json');
  HTTPClient.Request.CustomHeaders.AddValue('cnpj_emissor', edtEmissor.Text);

  body := '';
  RequestBody := TStringStream.Create(body, TEncoding.UTF8);

  Mretornogerado.Text :=   fHTTPClient.Post(url, RequestBody);
end;

///Rota que realiza consulta do arquivo SPED
procedure TForm1.Button4Click(Sender: TObject);
var
  url : string;
  ResponseBody: string;
begin
  memRetorno.Clear;
  ParamList.Clear;
  memRetorno.Text := 'Iniciando Apura��o';
  Application.ProcessMessages;
  url := 'https://api.tecnospeed.com.br/sped-fiscal/protocolo/' + edtID.Text;
  HTTPClient.Request.Accept := '*/*';
  HTTPClient.Request.ContentType := 'application/json';
  HTTPClient.Request.CustomHeaders.Clear;
  HTTPClient.Request.CustomHeaders.AddValue('cnpj_sh', edtCNPJ_SH.Text);
  HTTPClient.Request.CustomHeaders.AddValue('token_sh', edtToken.Text);
  HTTPClient.Request.CustomHeaders.AddValue('Content-Type', 'application/json');
  HTTPClient.Request.CustomHeaders.AddValue('cnpj_emissor', edtEmissor.Text);

  memoConsulta.Text :=   fHTTPClient.get(url);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  fHTTPClient := TIdHTTP.Create(nil);
  fIOHandlerSocketOpenSSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  fParamList := TStringList.Create;
  fParamList.NameValueSeparator := '=';
  HTTPClient.ProtocolVersion := pv1_1;
  HTTPClient.Request.UserAgent := 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko';
  fHTTPClient.IOHandler := fIOHandlerSocketOpenSSL;
end;

end.
