
 Create table Categoria (
   CategoriaId int not null IDENTITY,
   Nombre  nvarchar(120) not null
  );
  
  Alter table Categoria
  Add Constraint Pk_Categoria PRIMARY KEY (CategoriaId);

Create table Libro (
    LibroId int not null IDENTITY,
	Titulo nvarchar(120) not null,
	Descripcion nvarchar(200) not null,
	Publicado datetime2 not null,
	Precio numeric(7,2) not null,
	ImagenUrl nvarchar(200),
    CategoriaId int not null	
  );
  
  Alter table Libro
  Add constraint Pk_Libro PRIMARY KEY (LibroId);
  
  ALTER Table Libro
  Add Constraint Fk_Libro_Categoria_CategoriaId FOREIGN KEY(CategoriaId)
  REFERENCES Categoria (CategoriaId) ON DELETE CASCADE;
  
  Alter Table Libro
  Add Constraint UC_Libro_Titulo Unique (Titulo);

 Insert into Categoria (nombre)
  values ('Cientificos');

  Insert into Categoria (nombre)
  values ('Didacticos');

  Insert into Categoria (nombre)
  values ('Tecnicos');

  Insert into Categoria (nombre)
  values ('Programacion');
  // Ejecutar
  select * from Categoria
  //
  
  Insert into Libro (Titulo,Descripcion,Publicado,Precio,CategoriaId)
  values ('El Origen de las Especies','Libro de la evolucion','07-31-1859',35,1);
  
  Insert into Libro (Titulo,Descripcion,Publicado,Precio,CategoriaId)
  values ('Breve Historia del Tiempo','Libro acerca del tiempo','07-31-1988',38,1);
  
  Insert into Libro (Titulo,Descripcion,Publicado,Precio,CategoriaId)
  values ('Clean Code','Buenas Practicas de Programacion','07-31-2005',40,4);

  Insert into Libro (Titulo,Descripcion,Publicado,Precio,CategoriaId)
  values ('El Programador Pragmatico','Buenas Practicas de Programacion','07-31-2015',43,4);

CREATE TABLE Review(
 ReviewId int NOT NULL IDENTITY,
 NombreVotante nvarchar(100) NOT NULL,
 NumeroEstrellas int NOT NULL,
 Comentario nvarchar(3000) NOT NULL,
 LibroId int NOT NULL
);

ALTER TABLE Review
ADD CONSTRAINT Pk_Review PRIMARY KEY (ReviewId);

ALTER TABLE Review
ADD CONSTRAINT Fk_Review_Libro_LibroId FOREIGN KEY (LibroId)
REFERENCES Libro (LibroId) ON DELETE CASCADE;

CREATE TABLE PrecioOferta (
 PrecioOfertaId int NOT NULL IDENTITY,
 NuevoPrecio numeric(7,2) NOT NULL,
 TextoPromocional nvarchar(120) NOT NULL,
 LibroId int NOT NULL
);

ALTER TABLE PrecioOferta
ADD CONSTRAINT Pk_PrecioOferta PRIMARY KEY (PrecioOfertaId);

ALTER TABLE PrecioOferta
ADD CONSTRAINT UC_PrecioOferta_LibroId UNIQUE (LibroId);

ALTER TABLE PrecioOferta
ADD CONSTRAINT FK_PrecioOferta_Libro_LibroId FOREIGN KEY (LibroId)
REFERENCES Libro (LibroId) ON DELETE CASCADE;

CREATE TABLE Autor(
 AutorId int NOT NULL IDENTITY,
 Nombre nvarchar(120) NOT NULL,
 WebUrl nvarchar(120) null
);

ALTER TABLE Autor
ADD CONSTRAINT Pk_Autor PRIMARY KEY (AutorId);

CREATE TABLE AutorLibro(
 AutorLibroId int NOT NULL IDENTITY,
 AutorId int NOT NULL,
 LibroId int NOT NULL,
 Orden int NOT NULL
);

ALTER TABLE AutorLibro
ADD CONSTRAINT Pk_AutorLibro PRIMARY KEY(AutorLibroID)

ALTER TABLE AutorLibro
ADD CONSTRAINT UC_AutorLibroAutorId_LibroId UNIQUE (AutorId,LibroId);

ALTER TABLE AutorLibro
ADD CONSTRAINT Fk_AutorLibro_Autor_AutorId FOREIGN KEY (AutorId)
REFERENCES Autor (AutorId) ON DELETE CASCADE;

ALTER TABLE AutorLibro
ADD CONSTRAINT FK_AutorLibro_Libro_LibroId FOREIGN KEY (LibroId)
REFERENCES Libro(LibroId) ON DELETE CASCADE;

SELECT * FROM Categoria C;

SELECT * FROM Libro L

SELECT L.Titulo, L.Descripcion, C.Nombre  Categoria FROM Categoria C
JOIN Libro L ON C.CategoriaId=L.CategoriaId

SELECT * FROM Categoria C
LEFT JOIN Libro L ON C.CategoriaId=L.CategoriaId

SELECT * FROM Libro L
WHERE l.Titulo LIKE 'pro%'

INSERT INTO Libro (Titulo,Descripcion,Publicado,Precio,CategoriaId)
values ('Introduccion a la Programacion', 'Un libro para introduccion a la programacion', '07-31-2015',40,4);

INSERT INTO Libro (Titulo,Descripcion,Publicado,Precio,CategoriaId)
values ('Programacion Estructurada', 'Un libro para introduccion a la programacion Estructurada', '08-31-2013',38,4);


SELECT * FROM Libro L
ORDER BY L.Titulo DESC, l.Descripcion



CREATE OR ALTER PROCEDURE LibrosPublicadosRango
	@rangoinicio int,
	@rangofin int
AS
select a.Name AS NombreAutor, b.Title AS TituloLibro, b.PublishedOn AS FechaPublicacion from BookAuthor ba
JOIN Author a ON ba.AuthorId = a.AuthorId
JOIN Book b ON ba.BookId = b.BookId
WHERE YEAR(b.PublishedOn)>=@rangoinicio AND YEAR(b.PublishedOn) <= @rangofin













