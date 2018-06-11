CREATE TABLE CPostal (
  CPID         int IDENTITY NOT NULL, 
  Localidade   char(255) NOT NULL, 
  CodigoPostal char(255) NOT NULL, 
  PRIMARY KEY (CPID));
CREATE TABLE Cargo (
  CID       int IDENTITY NOT NULL, 
  DescCargo char(255) NOT NULL, 
  PRIMARY KEY (CID));
CREATE TABLE Mesa (
  MID            int IDENTITY NOT NULL, 
  NumLugares     int NOT NULL, 
  FuncionarioFID int NOT NULL, 
  PRIMARY KEY (MID));
CREATE TABLE Pedido (
  PID            int IDENTITY NOT NULL, 
  MesaMID        int NOT NULL, 
  FuncionarioFID int NOT NULL, 
  PRIMARY KEY (PID));
CREATE TABLE PedidoArtigo (
  ArtigoArtID int NOT NULL, 
  PedidoPID   int NOT NULL, 
  Quantidade  int NOT NULL, 
  PRIMARY KEY (ArtigoArtID, 
  PedidoPID));
CREATE TABLE Artigo (
  ArtID          int IDENTITY NOT NULL, 
  ValorUnidade   float(10) NOT NULL, 
  DescArt        char(255) NOT NULL, 
  NomeArt        char(255) NOT NULL, 
  TipoArtigoTAID int NOT NULL, 
  PRIMARY KEY (ArtID));
CREATE TABLE TipoArtigo (
  TAID           int IDENTITY NOT NULL, 
  DescTipoArtigo char(255) NOT NULL, 
  PRIMARY KEY (TAID));
CREATE TABLE Fornecedor (
  ForID          int IDENTITY NOT NULL, 
  NomeFornecedor char(255) NOT NULL, 
  Morada         char(255) NOT NULL, 
  CPostalCPID    int NOT NULL, 
  PRIMARY KEY (ForID));
CREATE TABLE ContactoForn (
  TipoContactoTCID int NOT NULL, 
  FornecedorForID  int NOT NULL, 
  FornContacto     char(255) NOT NULL, 
  PRIMARY KEY (TipoContactoTCID, 
  FornecedorForID));
CREATE TABLE Encomenda (
  EncID           int IDENTITY NOT NULL, 
  DescEncomenda   char(255) NOT NULL, 
  QuantidadeEnc   float(10) NOT NULL, 
  PrecoEnc        float(10) NOT NULL, 
  FornecedorForID int NOT NULL, 
  PRIMARY KEY (EncID));
CREATE TABLE FuncEnc (
  DataRecepcao   datetime NOT NULL, 
  EncomendaEncID int NOT NULL, 
  FuncionarioFID int NOT NULL, 
  PRIMARY KEY (DataRecepcao, 
  EncomendaEncID, 
  FuncionarioFID));
CREATE TABLE ArtigoEncomenda (
  QuantidadeArt  float(10) NOT NULL, 
  ArtigoArtID    int NOT NULL, 
  EncomendaEncID int NOT NULL);
CREATE TABLE Funcionario (
  FID            int IDENTITY NOT NULL, 
  Nome           char(255) NOT NULL, 
  DataNascimento datetime NOT NULL, 
  DataAdmicao    datetime NOT NULL, 
  Morada         char(255) NOT NULL, 
  CPostalCPID    int NOT NULL, 
  CargoCID       int NOT NULL, 
  PRIMARY KEY (FID));
CREATE TABLE TipoContacto (
  TCID             int IDENTITY NOT NULL, 
  DescTipoContacto char(255) NOT NULL, 
  PRIMARY KEY (TCID));
CREATE TABLE ContactoFun (
  FuncionarioFID   int NOT NULL, 
  TipoContactoTCID int NOT NULL, 
  FuncContacto     char(255) NOT NULL, 
  PRIMARY KEY (FuncionarioFID, 
  TipoContactoTCID));
CREATE TABLE Cliente (
  CLID        int IDENTITY NOT NULL, 
  Nome        char(255) NOT NULL, 
  Morada      char(255) NOT NULL, 
  DataVisita  datetime NOT NULL, 
  CPostalCPID int NOT NULL, 
  PRIMARY KEY (CLID));
CREATE TABLE ValeEstacionamento (
  EstID       int IDENTITY NOT NULL, 
  HoraEntrada datetime NOT NULL, 
  HoraSaida   datetime NOT NULL, 
  ClienteCLID int NOT NULL, 
  PRIMARY KEY (EstID));
CREATE TABLE Reserva (
  ResID       int IDENTITY NOT NULL, 
  DataReserva datetime NOT NULL, 
  ClienteCLID int NOT NULL, 
  PRIMARY KEY (ResID));
CREATE TABLE MesaReserva (
  ReservaResID int NOT NULL, 
  MesaMID      int NOT NULL);
CREATE TABLE Fatura (
  FatID       int IDENTITY NOT NULL, 
  DataFatura  datetime NOT NULL, 
  ClienteCLID int NOT NULL, 
  MesaMID     int NOT NULL, 
  PRIMARY KEY (FatID));
CREATE TABLE LinhaFatura (
  FaturaFatID             int NOT NULL, 
  PedidoArtigoArtigoArtID int NOT NULL, 
  PedidoArtigoPedidoPID   int NOT NULL);
CREATE TABLE ContactoCli (
  ClienteCLID      int NOT NULL, 
  TipoContactoTCID int NOT NULL, 
  CliContacto      char(255) NOT NULL);
ALTER TABLE Funcionario ADD CONSTRAINT FKFuncionari906622 FOREIGN KEY (CPostalCPID) REFERENCES CPostal (CPID);
ALTER TABLE Funcionario ADD CONSTRAINT FKFuncionari836684 FOREIGN KEY (CargoCID) REFERENCES Cargo (CID);
ALTER TABLE Mesa ADD CONSTRAINT FKMesa764026 FOREIGN KEY (FuncionarioFID) REFERENCES Funcionario (FID);
ALTER TABLE Pedido ADD CONSTRAINT FKPedido217214 FOREIGN KEY (MesaMID) REFERENCES Mesa (MID);
ALTER TABLE Pedido ADD CONSTRAINT FKPedido908892 FOREIGN KEY (FuncionarioFID) REFERENCES Funcionario (FID);
ALTER TABLE PedidoArtigo ADD CONSTRAINT FKPedidoArti317950 FOREIGN KEY (ArtigoArtID) REFERENCES Artigo (ArtID);
ALTER TABLE PedidoArtigo ADD CONSTRAINT FKPedidoArti274723 FOREIGN KEY (PedidoPID) REFERENCES Pedido (PID);
ALTER TABLE Artigo ADD CONSTRAINT FKArtigo800024 FOREIGN KEY (TipoArtigoTAID) REFERENCES TipoArtigo (TAID);
ALTER TABLE Fornecedor ADD CONSTRAINT FKFornecedor754154 FOREIGN KEY (CPostalCPID) REFERENCES CPostal (CPID);
ALTER TABLE ContactoForn ADD CONSTRAINT FKContactoFo459335 FOREIGN KEY (TipoContactoTCID) REFERENCES TipoContacto (TCID);
ALTER TABLE ContactoForn ADD CONSTRAINT FKContactoFo936178 FOREIGN KEY (FornecedorForID) REFERENCES Fornecedor (ForID);
ALTER TABLE Encomenda ADD CONSTRAINT FKEncomenda245593 FOREIGN KEY (FornecedorForID) REFERENCES Fornecedor (ForID);
ALTER TABLE FuncEnc ADD CONSTRAINT FKFuncEnc664303 FOREIGN KEY (EncomendaEncID) REFERENCES Encomenda (EncID);
ALTER TABLE FuncEnc ADD CONSTRAINT FKFuncEnc635707 FOREIGN KEY (FuncionarioFID) REFERENCES Funcionario (FID);
ALTER TABLE ArtigoEncomenda ADD CONSTRAINT FKArtigoEnco159510 FOREIGN KEY (ArtigoArtID) REFERENCES Artigo (ArtID);
ALTER TABLE ArtigoEncomenda ADD CONSTRAINT FKArtigoEnco862723 FOREIGN KEY (EncomendaEncID) REFERENCES Encomenda (EncID);
ALTER TABLE ContactoFun ADD CONSTRAINT FKContactoFu75863 FOREIGN KEY (FuncionarioFID) REFERENCES Funcionario (FID);
ALTER TABLE ContactoFun ADD CONSTRAINT FKContactoFu333953 FOREIGN KEY (TipoContactoTCID) REFERENCES TipoContacto (TCID);
ALTER TABLE Cliente ADD CONSTRAINT FKCliente100939 FOREIGN KEY (CPostalCPID) REFERENCES CPostal (CPID);
ALTER TABLE ValeEstacionamento ADD CONSTRAINT FKValeEstaci533384 FOREIGN KEY (ClienteCLID) REFERENCES Cliente (CLID);
ALTER TABLE Reserva ADD CONSTRAINT FKReserva661174 FOREIGN KEY (ClienteCLID) REFERENCES Cliente (CLID);
ALTER TABLE MesaReserva ADD CONSTRAINT FKMesaReserv967763 FOREIGN KEY (ReservaResID) REFERENCES Reserva (ResID);
ALTER TABLE MesaReserva ADD CONSTRAINT FKMesaReserv972616 FOREIGN KEY (MesaMID) REFERENCES Mesa (MID);
ALTER TABLE Fatura ADD CONSTRAINT FKFatura774506 FOREIGN KEY (ClienteCLID) REFERENCES Cliente (CLID);
ALTER TABLE Fatura ADD CONSTRAINT FKFatura719938 FOREIGN KEY (MesaMID) REFERENCES Mesa (MID);
ALTER TABLE LinhaFatura ADD CONSTRAINT FKLinhaFatur729496 FOREIGN KEY (FaturaFatID) REFERENCES Fatura (FatID);
ALTER TABLE LinhaFatura ADD CONSTRAINT FKLinhaFatur585898 FOREIGN KEY (PedidoArtigoArtigoArtID, PedidoArtigoPedidoPID) REFERENCES PedidoArtigo (ArtigoArtID, PedidoPID);
ALTER TABLE ContactoCli ADD CONSTRAINT FKContactoCl101645 FOREIGN KEY (ClienteCLID) REFERENCES Cliente (CLID);
ALTER TABLE ContactoCli ADD CONSTRAINT FKContactoCl330786 FOREIGN KEY (TipoContactoTCID) REFERENCES TipoContacto (TCID);
