if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Alimento') and o.name = 'FK_ALIMENTO_TIPOALIMENTO')
alter table Alimento
   drop constraint FK_ALIMENTO_TIPOALIMENTO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Alimento') and o.name = 'FK_ALIMENTO_USUARIO')
alter table Alimento
   drop constraint FK_ALIMENTO_USUARIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Alimento_Lista') and o.name = 'FK_ALIMENTOLISTA_ALIMENTO')
alter table Alimento_Lista
   drop constraint FK_ALIMENTOLISTA_ALIMENTO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Alimento_Lista') and o.name = 'FK_ALIMENTOLISTA_LISTA')
alter table Alimento_Lista
   drop constraint FK_ALIMENTOLISTA_LISTA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Alimento_PuntoVenta') and o.name = 'FK_ALIMENTOPUNTOVENTA_ALIMENTO')
alter table Alimento_PuntoVenta
   drop constraint FK_ALIMENTOPUNTOVENTA_ALIMENTO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Alimento_PuntoVenta') and o.name = 'FK_ALIMENTOPUNTOVENTA_PUNTOVENTA')
alter table Alimento_PuntoVenta
   drop constraint FK_ALIMENTOPUNTOVENTA_PUNTOVENTA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Alimento_Tag') and o.name = 'FK_ALIMENTOTAG_ALIMENTO')
alter table Alimento_Tag
   drop constraint FK_ALIMENTOTAG_ALIMENTO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Alimento_Tag') and o.name = 'FK_ALIMENTOTAG_TAG')
alter table Alimento_Tag
   drop constraint FK_ALIMENTOTAG_TAG
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Alimento_Valoracion') and o.name = 'FK_ALIMENTOVALORACION_ALIMENTO')
alter table Alimento_Valoracion
   drop constraint FK_ALIMENTOVALORACION_ALIMENTO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Alimento_Valoracion') and o.name = 'FK_ALIMENTOVALORACION_VALORACION')
alter table Alimento_Valoracion
   drop constraint FK_ALIMENTOVALORACION_VALORACION
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Contacto') and o.name = 'FK_CONTACTO_TIPOCONTACTO')
alter table Contacto
   drop constraint FK_CONTACTO_TIPOCONTACTO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Filtro') and o.name = 'FK_FILTRO_USUARIO')
alter table Filtro
   drop constraint FK_FILTRO_USUARIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Filtro_Tag') and o.name = 'FK_FILTROTAG_FILTRO')
alter table Filtro_Tag
   drop constraint FK_FILTROTAG_FILTRO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Filtro_Tag') and o.name = 'FK_FILTROTAG_TAG')
alter table Filtro_Tag
   drop constraint FK_FILTROTAG_TAG
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Horario_PuntoVenta') and o.name = 'FK_HORARIOPUNTOVENTA_HORARIO')
alter table Horario_PuntoVenta
   drop constraint FK_HORARIOPUNTOVENTA_HORARIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Horario_PuntoVenta') and o.name = 'FK_HORARIOPUNTOVENTA_PUNTOVENTA')
alter table Horario_PuntoVenta
   drop constraint FK_HORARIOPUNTOVENTA_PUNTOVENTA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Lista') and o.name = 'FK_LISTA_USUARIO')
alter table Lista
   drop constraint FK_LISTA_USUARIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PasoReceta') and o.name = 'FK_PASORECETA_ALIMENTO')
alter table PasoReceta
   drop constraint FK_PASORECETA_ALIMENTO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Producto') and o.name = 'FK_PRODUCTO_CATEGORIA')
alter table Producto
   drop constraint FK_PRODUCTO_CATEGORIA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ProductoAlimento') and o.name = 'FK_PRODUCTOALIMENTO_ALIMENTO')
alter table ProductoAlimento
   drop constraint FK_PRODUCTOALIMENTO_ALIMENTO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ProductoAlimento') and o.name = 'FK_PRODUCTOALIMENTO_PRODUCTO')
alter table ProductoAlimento
   drop constraint FK_PRODUCTOALIMENTO_PRODUCTO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ProductoPuntoventa') and o.name = 'FK_PRODUCTOPUNTOVENTA_PUNTOVENTA')
alter table ProductoPuntoventa
   drop constraint FK_PRODUCTOPUNTOVENTA_PUNTOVENTA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ProductoPuntoventa') and o.name = 'FK_PRODUCTOPUNTOVENTA_PRODUCTO')
alter table ProductoPuntoventa
   drop constraint FK_PRODUCTOPUNTOVENTA_PRODUCTO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PuntoVenta') and o.name = 'FK_PUNTOVENTA_TIPOPUNTOVENTA')
alter table PuntoVenta
   drop constraint FK_PUNTOVENTA_TIPOPUNTOVENTA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PuntoVenta_ServicioEntrega') and o.name = 'FK_PUNTOVENTASERVENTREGA_PUNTOVENTA')
alter table PuntoVenta_ServicioEntrega
   drop constraint FK_PUNTOVENTASERVENTREGA_PUNTOVENTA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PuntoVenta_ServicioEntrega') and o.name = 'FK_PUNTOVENTASERVENTREGA_SERVENTREGA')
alter table PuntoVenta_ServicioEntrega
   drop constraint FK_PUNTOVENTASERVENTREGA_SERVENTREGA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PuntoVenta_Tag') and o.name = 'FK_PUNTOVENTATAG_PUNTOVENTA')
alter table PuntoVenta_Tag
   drop constraint FK_PUNTOVENTATAG_PUNTOVENTA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PuntoVenta_Tag') and o.name = 'FK_PUNTOVENTATAG_TAG')
alter table PuntoVenta_Tag
   drop constraint FK_PUNTOVENTATAG_TAG
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Ubicacion') and o.name = 'FK_UBICACION_PUNTOVENTA')
alter table Ubicacion
   drop constraint FK_UBICACION_PUNTOVENTA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('UsuarioFiltro') and o.name = 'FK_USUARIOFILTRO_FILTRO')
alter table UsuarioFiltro
   drop constraint FK_USUARIOFILTRO_FILTRO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('UsuarioFiltro') and o.name = 'FK_USUARIOFILTRO_USUARIO')
alter table UsuarioFiltro
   drop constraint FK_USUARIOFILTRO_USUARIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('UsuarioLista') and o.name = 'FK_USUARIOLISTA_LISTA')
alter table UsuarioLista
   drop constraint FK_USUARIOLISTA_LISTA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('UsuarioLista') and o.name = 'FK_USUARIOLISTA_USUARIO')
alter table UsuarioLista
   drop constraint FK_USUARIOLISTA_USUARIO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Alimento')
            and   type = 'U')
   drop table Alimento
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Alimento_Lista')
            and   type = 'U')
   drop table Alimento_Lista
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Alimento_PuntoVenta')
            and   type = 'U')
   drop table Alimento_PuntoVenta
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Alimento_Tag')
            and   type = 'U')
   drop table Alimento_Tag
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Alimento_Valoracion')
            and   type = 'U')
   drop table Alimento_Valoracion
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Categoria')
            and   type = 'U')
   drop table Categoria
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Contacto')
            and   type = 'U')
   drop table Contacto
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Filtro')
            and   type = 'U')
   drop table Filtro
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Filtro_Tag')
            and   type = 'U')
   drop table Filtro_Tag
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Horario')
            and   type = 'U')
   drop table Horario
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Horario_PuntoVenta')
            and   type = 'U')
   drop table Horario_PuntoVenta
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Lista')
            and   type = 'U')
   drop table Lista
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PasoReceta')
            and   type = 'U')
   drop table PasoReceta
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Producto')
            and   type = 'U')
   drop table Producto
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ProductoAlimento')
            and   type = 'U')
   drop table ProductoAlimento
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ProductoPuntoventa')
            and   type = 'U')
   drop table ProductoPuntoventa
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PuntoVenta')
            and   type = 'U')
   drop table PuntoVenta
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PuntoVenta_ServicioEntrega')
            and   type = 'U')
   drop table PuntoVenta_ServicioEntrega
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PuntoVenta_Tag')
            and   type = 'U')
   drop table PuntoVenta_Tag
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Rango')
            and   type = 'U')
   drop table Rango
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ServicioEntrega')
            and   type = 'U')
   drop table ServicioEntrega
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Tag')
            and   type = 'U')
   drop table Tag
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TipoAlimento')
            and   type = 'U')
   drop table TipoAlimento
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TipoContacto')
            and   type = 'U')
   drop table TipoContacto
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TipoPuntoVenta')
            and   type = 'U')
   drop table TipoPuntoVenta
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Ubicacion')
            and   type = 'U')
   drop table Ubicacion
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Usuario')
            and   type = 'U')
   drop table Usuario
go

if exists (select 1
            from  sysobjects
           where  id = object_id('UsuarioFiltro')
            and   type = 'U')
   drop table UsuarioFiltro
go

if exists (select 1
            from  sysobjects
           where  id = object_id('UsuarioLista')
            and   type = 'U')
   drop table UsuarioLista
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Valoracion')
            and   type = 'U')
   drop table Valoracion
go

/*==============================================================*/
/* Table: Alimento                                              */
/*==============================================================*/
create table Alimento (
   ID                   bigint               identity not null,
   Nombre               varchar(50)          null,
   Tipo                 smallint             null,
   Precio               decimal(6,2)         null,
   Porciones            smallint             null,
   Espera               smallint             null,
   Descripcion          varchar(256)         null,
   Receta               bit                 not null,
   UsuarioID            bigint               null,
   constraint PK_ALIMENTO primary key (ID)
)
go

/*==============================================================*/
/* Table: Alimento_Lista                                        */
/*==============================================================*/
create table Alimento_Lista (
   ID                   bigint               identity not null,
   ListaID              bigint               not null,
   AlimentoID           bigint               not null,
   constraint PK_ALIMENTO_LISTA primary key (ID)
)
go

/*==============================================================*/
/* Table: Alimento_PuntoVenta                                   */
/*==============================================================*/
create table Alimento_PuntoVenta (
   ID                   bigint               identity not null,
   AlimentoID           bigint               not null,
   PuntoVentaID         bigint               not null,
   constraint PK_ALIMENTO_PUNTOVENTA primary key (ID)
)
go

/*==============================================================*/
/* Table: Alimento_Tag                                          */
/*==============================================================*/
create table Alimento_Tag (
   ID                   bigint               identity not null,
   AlimentoID           bigint               not null,
   TagID                bigint               not null,
   constraint PK_ALIMENTO_TAG primary key (ID)
)
go

/*==============================================================*/
/* Table: Alimento_Valoracion                                   */
/*==============================================================*/
create table Alimento_Valoracion (
   ID                   bigint               identity not null,
   AlimentoID           bigint               not null,
   ValoracionID         bigint               not null,
   constraint PK_ALIMENTO_VALORACION primary key (ID)
)
go

/*==============================================================*/
/* Table: Categoria                                             */
/*==============================================================*/
create table Categoria (
   ID                   int                  identity not null,
   Nombre               varchar(20)          not null,
   Descripcion          varchar(128)         null,
   constraint PK_CATEGORIA primary key (ID)
)
go

/*==============================================================*/
/* Table: Contacto                                              */
/*==============================================================*/
create table Contacto (
   ID                   bigint               identity not null,
   PuntoVentaID         bigint               not null,
   TipoContacto         varchar(15)          not null,
   Dato                 varchar(25)          not null,
   constraint PK_CONTACTO primary key (ID)
)
go

/*==============================================================*/
/* Table: Filtro                                                */
/*==============================================================*/
create table Filtro (
   ID                   bigint               identity not null,
   Nombre               varchar(50)          not null,
   Descripcion          varchar(256)         null,
   UsuarioID            bigint               not null,
   CalidadMin           decimal(2,1)         null,
   CalidadMax           decimal(2,1)         null,
   SaborMin             decimal(2,1)         null,
   SaborMax             decimal(2,1)         null,
   PrecioMin            decimal(6,2)         null,
   PrecioMax            decimal(6,2)         null,
   CalifMin             decimal(2,1)         null,
   CalifMax             decimal(2,1)         null,
   CostoBenMin          decimal(2,1)         null,
   CostoBenMax          decimal(2,1)         null,
   EsperaMin            smallint             null,
   EsperaMax            smallint             null,
   Latitud              decimal(10,6)        null,
   Longitud             decimal(10,6)        null,
   DistanciaMax         int                  null,
   Receta               bit                 null,
   ProcionesMin         smallint             null,
   ProcionesMax         smallint             null,
   Dias                 tinyint              null,
   HoraInicio           int                  null,
   HoraFin              int                  null,
   Criterio             varchar(128)         null,
   constraint PK_FILTRO primary key (ID)
)
go

/*==============================================================*/
/* Table: Filtro_Tag                                            */
/*==============================================================*/
create table Filtro_Tag (
   ID                   bigint               identity not null,
   FiltroID             bigint               not null,
   TagID                bigint               not null,
   constraint PK_FILTRO_TAG primary key (ID)
)
go

/*==============================================================*/
/* Table: Horario                                               */
/*==============================================================*/
create table Horario (
   ID                   bigint               identity not null,
   Dias                 tinyint              not null,
   Inicio               int                  not null,
   Fin                  int                  not null,
   constraint PK_HORARIO primary key (ID)
)
go

/*==============================================================*/
/* Table: Horario_PuntoVenta                                    */
/*==============================================================*/
create table Horario_PuntoVenta (
   ID                   bigint               identity not null,
   HorarioID            bigint               not null,
   PuntoVentaID         bigint               not null,
   constraint PK_HORARIO_PUNTOVENTA primary key (ID)
)
go

/*==============================================================*/
/* Table: Lista                                                 */
/*==============================================================*/
create table Lista (
   ID                   bigint               identity not null,
   UsuarioID            bigint               not null,
   Nombre               varchar(50)          not null,
   Descripcion          varchar(512)         null,
   Privada              bit                 not null,
   constraint PK_LISTA primary key (ID)
)
go

/*==============================================================*/
/* Table: PasoReceta                                            */
/*==============================================================*/
create table PasoReceta (
   ID                   bigint               identity not null,
   AlimentoID           bigint               not null,
   Numero               smallint             not null,
   Indicacion           varchar(256)         not null,
   constraint PK_PASORECETA primary key (ID)
)
go

/*==============================================================*/
/* Table: Producto                                              */
/*==============================================================*/
create table Producto (
   ID                   bigint               identity not null,
   Nombre               varchar(50)          not null,
   Descripcion          varchar(256)         null,
   Categoria            int                  null,
   constraint PK_PRODUCTO primary key (ID)
)
go

/*==============================================================*/
/* Table: ProductoAlimento                                      */
/*==============================================================*/
create table ProductoAlimento (
   ID                   bigint               identity not null,
   AlimentoID           bigint               not null,
   ProductoID           bigint               not null,
   constraint PK_PRODUCTOALIMENTO primary key (ID)
)
go

/*==============================================================*/
/* Table: ProductoPuntoventa                                    */
/*==============================================================*/
create table ProductoPuntoventa (
   ID                   bigint               identity not null,
   PuntoVentaID         bigint               not null,
   ProductoID           bigint               not null,
   Precio               decimal(6,2)         null,
   Detalles             varchar(128)         null,
   constraint PK_PRODUCTOPUNTOVENTA primary key (ID)
)
go

/*==============================================================*/
/* Table: PuntoVenta                                            */
/*==============================================================*/
create table PuntoVenta (
   ID                   bigint               identity not null,
   Nombre               varchar(50)          not null,
   TipoPuntoVenta       varchar(30)          null,
   constraint PK_PUNTOVENTA primary key (ID)
)
go

/*==============================================================*/
/* Table: PuntoVenta_ServicioEntrega                            */
/*==============================================================*/
create table PuntoVenta_ServicioEntrega (
   ID                   bigint               identity not null,
   ServicioEntregaID    int                  not null,
   PuntoVentaID         bigint               not null,
   constraint PK_PUNTOVENTA_SERVICIOENTREGA primary key (ID)
)
go

/*==============================================================*/
/* Table: PuntoVenta_Tag                                        */
/*==============================================================*/
create table PuntoVenta_Tag (
   PuntoVentaID         bigint               not null,
   TagID                bigint               not null,
   constraint PK_PUNTOVENTA_TAG primary key (PuntoVentaID, TagID)
)
go

/*==============================================================*/
/* Table: Rango                                                 */
/*==============================================================*/
create table Rango (
   ID                   smallint             identity not null,
   Nombre               varchar(20)          not null,
   Descripcion          varchar(128)         not null,
   Puntos               int                  not null,
   constraint PK_RANGO primary key (ID)
)
go

/*==============================================================*/
/* Table: ServicioEntrega                                       */
/*==============================================================*/
create table ServicioEntrega (
   ID                   int                  identity not null,
   Nombre               varchar(20)          not null,
   Descripcion          varchar(128)         null,
   constraint PK_SERVICIOENTREGA primary key (ID)
)
go

/*==============================================================*/
/* Table: Tag                                                   */
/*==============================================================*/
create table Tag (
   ID                   bigint               identity not null,
   Etiqueta             varchar(50)          not null,
   constraint PK_TAG primary key (ID)
)
go

/*==============================================================*/
/* Table: TipoAlimento                                          */
/*==============================================================*/
create table TipoAlimento (
   ID                   smallint             identity not null,
   Nombre               varchar(20)          not null,
   Descripcion          varchar(128)         null,
   constraint PK_TIPOALIMENTO primary key (ID)
)
go

/*==============================================================*/
/* Table: TipoContacto                                          */
/*==============================================================*/
create table TipoContacto (
   TipoContacto         varchar(15)          not null,
   constraint PK_TIPOCONTACTO primary key (TipoContacto)
)
go

/*==============================================================*/
/* Table: TipoPuntoVenta                                        */
/*==============================================================*/
create table TipoPuntoVenta (
   TipoPuntoVenta       varchar(30)          not null,
   constraint PK_TIPOPUNTOVENTA primary key (TipoPuntoVenta)
)
go

/*==============================================================*/
/* Table: Ubicacion                                             */
/*==============================================================*/
create table Ubicacion (
   ID                   bigint               identity not null,
   PuntoVentaID         bigint               not null,
   Pais                 varchar(20)          null,
   Estado               varchar(30)          null,
   Municipio            varchar(30)          null,
   Colonia              varchar(30)          null,
   Calle                varchar(30)          null,
   Numero               varchar(30)          null,
   CodigoPostal         varchar(7)           null,
   Latitud              decimal(10,6)        null,
   Longitud             decimal(10,6)        null,
   Descripcion          varchar(256)          null,
   constraint PK_UBICACION primary key (ID)
)
go

/*==============================================================*/
/* Table: Usuario                                               */
/*==============================================================*/
create table Usuario (
   ID                   bigint               identity not null,
   Username             varchar(20)          null,
   Nombre               varchar(100)         null,
   Correo               varchar(50)          not null,
   Password             varchar(50)          not null,
   Foto                 varchar(256)         null,
   UltimaActividad      datetime             not null,
   Puntuacion           int                  null,
   constraint PK_USUARIO primary key (ID)
)
go

/*==============================================================*/
/* Table: UsuarioFiltro                                         */
/*==============================================================*/
create table UsuarioFiltro (
   ID                   bigint               identity not null,
   UsuarioID            bigint               not null,
   FiltroID             bigint               not null,
   constraint PK_USUARIOFILTRO primary key (ID)
)
go

/*==============================================================*/
/* Table: UsuarioLista                                          */
/*==============================================================*/
create table UsuarioLista (
   ID                   bigint               identity not null,
   UsuarioID            bigint               not null,
   ListaID              bigint               not null,
   constraint PK_USUARIOLISTA primary key (ID)
)
go

/*==============================================================*/
/* Table: Valoracion                                            */
/*==============================================================*/
create table Valoracion (
   ID                   bigint               identity not null,
   AlimentoID           bigint               null,
   ProductoPuntoventaid bigint               null,
   UsuarioID            bigint               not null,
   Calidad              decimal(2,1)         null,
   CostoBeneficio       decimal(2,1)         null,
   Sabor                decimal(2,1)         null,
   Comentario           varchar(512)         null,
   constraint PK_VALORACION primary key (ID)
)
go

alter table Alimento
   add constraint FK_ALIMENTO_TIPOALIMENTO foreign key (Tipo)
      references TipoAlimento (ID)
go

alter table Alimento
   add constraint FK_ALIMENTO_USUARIO foreign key (UsuarioID)
      references Usuario (ID)
go

alter table Alimento_Lista
   add constraint FK_ALIMENTOLISTA_ALIMENTO foreign key (AlimentoID)
      references Alimento (ID)
go

alter table Alimento_Lista
   add constraint FK_ALIMENTOLISTA_LISTA foreign key (ListaID)
      references Lista (ID)
go

alter table Alimento_PuntoVenta
   add constraint FK_ALIMENTOPUNTOVENTA_ALIMENTO foreign key (AlimentoID)
      references Alimento (ID)
go

alter table Alimento_PuntoVenta
   add constraint FK_ALIMENTOPUNTOVENTA_PUNTOVENTA foreign key (PuntoVentaID)
      references PuntoVenta (ID)
go

alter table Alimento_Tag
   add constraint FK_ALIMENTOTAG_ALIMENTO foreign key (AlimentoID)
      references Alimento (ID)
go

alter table Alimento_Tag
   add constraint FK_ALIMENTOTAG_TAG foreign key (TagID)
      references Tag (ID)
go

alter table Alimento_Valoracion
   add constraint FK_ALIMENTOVALORACION_ALIMENTO foreign key (AlimentoID)
      references Alimento (ID)
go

alter table Alimento_Valoracion
   add constraint FK_ALIMENTOVALORACION_VALORACION foreign key (ValoracionID)
      references Valoracion (ID)
go

alter table Contacto
   add constraint FK_CONTACTO_TIPOCONTACTO foreign key (TipoContacto)
      references TipoContacto (TipoContacto)
go

alter table Filtro
   add constraint FK_FILTRO_USUARIO foreign key (UsuarioID)
      references Usuario (ID)
go

alter table Filtro_Tag
   add constraint FK_FILTROTAG_FILTRO foreign key (FiltroID)
      references Filtro (ID)
go

alter table Filtro_Tag
   add constraint FK_FILTROTAG_TAG foreign key (TagID)
      references Tag (ID)
go

alter table Horario_PuntoVenta
   add constraint FK_HORARIOPUNTOVENTA_HORARIO foreign key (HorarioID)
      references Horario (ID)
go

alter table Horario_PuntoVenta
   add constraint FK_HORARIOPUNTOVENTA_PUNTOVENTA foreign key (PuntoVentaID)
      references PuntoVenta (ID)
go

alter table Lista
   add constraint FK_LISTA_USUARIO foreign key (UsuarioID)
      references Usuario (ID)
go

alter table PasoReceta
   add constraint FK_PASORECETA_ALIMENTO foreign key (AlimentoID)
      references Alimento (ID)
go

alter table Producto
   add constraint FK_PRODUCTO_CATEGORIA foreign key (Categoria)
      references Categoria (ID)
go

alter table ProductoAlimento
   add constraint FK_PRODUCTOALIMENTO_ALIMENTO foreign key (AlimentoID)
      references Alimento (ID)
go

alter table ProductoAlimento
   add constraint FK_PRODUCTOALIMENTO_PRODUCTO foreign key (ProductoID)
      references Producto (ID)
go

alter table ProductoPuntoventa
   add constraint FK_PRODUCTOPUNTOVENTA_PUNTOVENTA foreign key (PuntoVentaID)
      references PuntoVenta (ID)
go

alter table ProductoPuntoventa
   add constraint FK_PRODUCTOPUNTOVENTA_PRODUCTO foreign key (ProductoID)
      references Producto (ID)
go

alter table PuntoVenta
   add constraint FK_PUNTOVENTA_TIPOPUNTOVENTA foreign key (TipoPuntoVenta)
      references TipoPuntoVenta (TipoPuntoVenta)
go

alter table PuntoVenta_ServicioEntrega
   add constraint FK_PUNTOVENTASERVENTREGA_PUNTOVENTA foreign key (PuntoVentaID)
      references PuntoVenta (ID)
go

alter table PuntoVenta_ServicioEntrega
   add constraint FK_PUNTOVENTASERVENTREGA_SERVENTREGA foreign key (ServicioEntregaID)
      references ServicioEntrega (ID)
go

alter table PuntoVenta_Tag
   add constraint FK_PUNTOVENTATAG_PUNTOVENTA foreign key (PuntoVentaID)
      references PuntoVenta (ID)
go

alter table PuntoVenta_Tag
   add constraint FK_PUNTOVENTATAG_TAG foreign key (TagID)
      references Tag (ID)
go

alter table Ubicacion
   add constraint FK_UBICACION_PUNTOVENTA foreign key (PuntoVentaID)
      references PuntoVenta (ID)
go

alter table UsuarioFiltro
   add constraint FK_USUARIOFILTRO_FILTRO foreign key (FiltroID)
      references Filtro (ID)
go

alter table UsuarioFiltro
   add constraint FK_USUARIOFILTRO_USUARIO foreign key (UsuarioID)
      references Usuario (ID)
go

alter table UsuarioLista
   add constraint FK_USUARIOLISTA_LISTA foreign key (ListaID)
      references Lista (ID)
go

alter table UsuarioLista
   add constraint FK_USUARIOLISTA_USUARIO foreign key (UsuarioID)
      references Usuario (ID)
go
