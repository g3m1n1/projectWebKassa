
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/24/2015 13:49:02
-- Generated from EDMX file: C:\Users\g3mini\Desktop\projectWebKassa\projectWebKassa\DAL\WebKassaContext.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [webshop];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_personeellevering]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[leveringSet] DROP CONSTRAINT [FK_personeellevering];
GO
IF OBJECT_ID(N'[dbo].[FK_leveringRegelslevering]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[leveringSet] DROP CONSTRAINT [FK_leveringRegelslevering];
GO
IF OBJECT_ID(N'[dbo].[FK_filiaalCodepersoneel]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[personeelSet] DROP CONSTRAINT [FK_filiaalCodepersoneel];
GO
IF OBJECT_ID(N'[dbo].[FK_orderbetaling]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[betalingSet] DROP CONSTRAINT [FK_orderbetaling];
GO
IF OBJECT_ID(N'[dbo].[FK_orderorder_regel]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[order_regelSet] DROP CONSTRAINT [FK_orderorder_regel];
GO
IF OBJECT_ID(N'[dbo].[FK_abonne_en_klantorder_regel]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[order_regelSet] DROP CONSTRAINT [FK_abonne_en_klantorder_regel];
GO
IF OBJECT_ID(N'[dbo].[FK_productprijs]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[prijsSet] DROP CONSTRAINT [FK_productprijs];
GO
IF OBJECT_ID(N'[dbo].[FK_categorieproduct]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[productSet] DROP CONSTRAINT [FK_categorieproduct];
GO
IF OBJECT_ID(N'[dbo].[FK_productleveringRegels]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[leveringRegelsSet] DROP CONSTRAINT [FK_productleveringRegels];
GO
IF OBJECT_ID(N'[dbo].[FK_Functiepersoneel]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[personeelSet] DROP CONSTRAINT [FK_Functiepersoneel];
GO
IF OBJECT_ID(N'[dbo].[FK_statuslevering]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[leveringSet] DROP CONSTRAINT [FK_statuslevering];
GO
IF OBJECT_ID(N'[dbo].[FK_BetalingsWijzebetaling]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[betalingSet] DROP CONSTRAINT [FK_BetalingsWijzebetaling];
GO
IF OBJECT_ID(N'[dbo].[FK_AdresFiliaal]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[filiaal_codeSet] DROP CONSTRAINT [FK_AdresFiliaal];
GO
IF OBJECT_ID(N'[dbo].[FK_orderpersoneel]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[orderSet] DROP CONSTRAINT [FK_orderpersoneel];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[personeelSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[personeelSet];
GO
IF OBJECT_ID(N'[dbo].[leveringSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[leveringSet];
GO
IF OBJECT_ID(N'[dbo].[leveringRegelsSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[leveringRegelsSet];
GO
IF OBJECT_ID(N'[dbo].[statusSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[statusSet];
GO
IF OBJECT_ID(N'[dbo].[filiaal_codeSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[filiaal_codeSet];
GO
IF OBJECT_ID(N'[dbo].[orderSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[orderSet];
GO
IF OBJECT_ID(N'[dbo].[betalingSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[betalingSet];
GO
IF OBJECT_ID(N'[dbo].[order_regelSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[order_regelSet];
GO
IF OBJECT_ID(N'[dbo].[abonnee_en_klantSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[abonnee_en_klantSet];
GO
IF OBJECT_ID(N'[dbo].[prijsSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[prijsSet];
GO
IF OBJECT_ID(N'[dbo].[productSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[productSet];
GO
IF OBJECT_ID(N'[dbo].[categorieSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[categorieSet];
GO
IF OBJECT_ID(N'[dbo].[FunctieSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FunctieSet];
GO
IF OBJECT_ID(N'[dbo].[BetalingsWijzes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BetalingsWijzes];
GO
IF OBJECT_ID(N'[dbo].[Adres]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Adres];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'personeelSet'
CREATE TABLE [dbo].[personeelSet] (
    [PersoneelId] int IDENTITY(1,1) NOT NULL,
    [filiaal_codeId] int  NOT NULL,
    [FunctieId] int  NOT NULL,
    [Voornaam] nvarchar(max)  NOT NULL,
    [Tussenvoegsel] nvarchar(max)  NOT NULL,
    [Achternaam] nvarchar(max)  NOT NULL,
    [PostCode] nvarchar(max)  NOT NULL,
    [Adres] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'leveringSet'
CREATE TABLE [dbo].[leveringSet] (
    [LeveringId] int IDENTITY(1,1) NOT NULL,
    [personeelId] int  NOT NULL,
    [leveringRegelsId] int  NOT NULL,
    [statusId] int  NOT NULL,
    [LeveringsCode] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'leveringRegelsSet'
CREATE TABLE [dbo].[leveringRegelsSet] (
    [LeveringRegelsId] int IDENTITY(1,1) NOT NULL,
    [productId] int  NOT NULL
);
GO

-- Creating table 'statusSet'
CREATE TABLE [dbo].[statusSet] (
    [StatusId] int IDENTITY(1,1) NOT NULL,
    [True] nvarchar(max)  NOT NULL,
    [False] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'filiaal_codeSet'
CREATE TABLE [dbo].[filiaal_codeSet] (
    [FiliaalCodeId] int IDENTITY(1,1) NOT NULL,
    [Naam] nvarchar(max)  NOT NULL,
    [AdresAdresId] int  NOT NULL
);
GO

-- Creating table 'orderSet'
CREATE TABLE [dbo].[orderSet] (
    [orderId] int IDENTITY(1,1) NOT NULL,
    [personeelId] int  NOT NULL,
    [OrderDatum] nvarchar(max)  NOT NULL,
    [LeveringsDatum] nvarchar(max)  NOT NULL,
    [personeel_PersoneelId] int  NOT NULL
);
GO

-- Creating table 'betalingSet'
CREATE TABLE [dbo].[betalingSet] (
    [BetalingId] int IDENTITY(1,1) NOT NULL,
    [orderId] int  NOT NULL,
    [BetalingsWijze_betalingsWijzeId] int  NOT NULL
);
GO

-- Creating table 'order_regelSet'
CREATE TABLE [dbo].[order_regelSet] (
    [OrderRegelId] int IDENTITY(1,1) NOT NULL,
    [orderId] int  NOT NULL,
    [abonne_en_klantId] int  NOT NULL
);
GO

-- Creating table 'abonnee_en_klantSet'
CREATE TABLE [dbo].[abonnee_en_klantSet] (
    [AbonneeEnKlantId] int IDENTITY(1,1) NOT NULL,
    [Voornaam] nvarchar(max)  NOT NULL,
    [Achternaam] nvarchar(max)  NOT NULL,
    [Adres] nvarchar(max)  NOT NULL,
    [Postcode] nvarchar(max)  NOT NULL,
    [Telefoon_Nummer] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'prijsSet'
CREATE TABLE [dbo].[prijsSet] (
    [PrijsId] int IDENTITY(1,1) NOT NULL,
    [productId] int  NOT NULL,
    [Prijs] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'productSet'
CREATE TABLE [dbo].[productSet] (
    [ProductId] int IDENTITY(1,1) NOT NULL,
    [categorieId] int  NOT NULL,
    [Naam] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'categorieSet'
CREATE TABLE [dbo].[categorieSet] (
    [categorieId] int IDENTITY(1,1) NOT NULL,
    [Naam] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'FunctieSet'
CREATE TABLE [dbo].[FunctieSet] (
    [FunctieId] int IDENTITY(1,1) NOT NULL,
    [Naam] nvarchar(21)  NOT NULL,
    [Beginschaal] nvarchar(max)  NOT NULL,
    [Eindschaal] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'BetalingsWijzes'
CREATE TABLE [dbo].[BetalingsWijzes] (
    [betalingsWijzeId] int IDENTITY(1,1) NOT NULL,
    [PayPal] nvarchar(max)  NOT NULL,
    [IDeal] nvarchar(max)  NOT NULL,
    [Contant] nvarchar(max)  NOT NULL,
    [CreditCard] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Adres'
CREATE TABLE [dbo].[Adres] (
    [AdresId] int IDENTITY(1,1) NOT NULL,
    [Straat] nvarchar(max)  NOT NULL,
    [PostCode] nvarchar(max)  NOT NULL,
    [Land] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [PersoneelId] in table 'personeelSet'
ALTER TABLE [dbo].[personeelSet]
ADD CONSTRAINT [PK_personeelSet]
    PRIMARY KEY CLUSTERED ([PersoneelId] ASC);
GO

-- Creating primary key on [LeveringId] in table 'leveringSet'
ALTER TABLE [dbo].[leveringSet]
ADD CONSTRAINT [PK_leveringSet]
    PRIMARY KEY CLUSTERED ([LeveringId] ASC);
GO

-- Creating primary key on [LeveringRegelsId] in table 'leveringRegelsSet'
ALTER TABLE [dbo].[leveringRegelsSet]
ADD CONSTRAINT [PK_leveringRegelsSet]
    PRIMARY KEY CLUSTERED ([LeveringRegelsId] ASC);
GO

-- Creating primary key on [StatusId] in table 'statusSet'
ALTER TABLE [dbo].[statusSet]
ADD CONSTRAINT [PK_statusSet]
    PRIMARY KEY CLUSTERED ([StatusId] ASC);
GO

-- Creating primary key on [FiliaalCodeId] in table 'filiaal_codeSet'
ALTER TABLE [dbo].[filiaal_codeSet]
ADD CONSTRAINT [PK_filiaal_codeSet]
    PRIMARY KEY CLUSTERED ([FiliaalCodeId] ASC);
GO

-- Creating primary key on [orderId] in table 'orderSet'
ALTER TABLE [dbo].[orderSet]
ADD CONSTRAINT [PK_orderSet]
    PRIMARY KEY CLUSTERED ([orderId] ASC);
GO

-- Creating primary key on [BetalingId] in table 'betalingSet'
ALTER TABLE [dbo].[betalingSet]
ADD CONSTRAINT [PK_betalingSet]
    PRIMARY KEY CLUSTERED ([BetalingId] ASC);
GO

-- Creating primary key on [OrderRegelId] in table 'order_regelSet'
ALTER TABLE [dbo].[order_regelSet]
ADD CONSTRAINT [PK_order_regelSet]
    PRIMARY KEY CLUSTERED ([OrderRegelId] ASC);
GO

-- Creating primary key on [AbonneeEnKlantId] in table 'abonnee_en_klantSet'
ALTER TABLE [dbo].[abonnee_en_klantSet]
ADD CONSTRAINT [PK_abonnee_en_klantSet]
    PRIMARY KEY CLUSTERED ([AbonneeEnKlantId] ASC);
GO

-- Creating primary key on [PrijsId] in table 'prijsSet'
ALTER TABLE [dbo].[prijsSet]
ADD CONSTRAINT [PK_prijsSet]
    PRIMARY KEY CLUSTERED ([PrijsId] ASC);
GO

-- Creating primary key on [ProductId] in table 'productSet'
ALTER TABLE [dbo].[productSet]
ADD CONSTRAINT [PK_productSet]
    PRIMARY KEY CLUSTERED ([ProductId] ASC);
GO

-- Creating primary key on [categorieId] in table 'categorieSet'
ALTER TABLE [dbo].[categorieSet]
ADD CONSTRAINT [PK_categorieSet]
    PRIMARY KEY CLUSTERED ([categorieId] ASC);
GO

-- Creating primary key on [FunctieId] in table 'FunctieSet'
ALTER TABLE [dbo].[FunctieSet]
ADD CONSTRAINT [PK_FunctieSet]
    PRIMARY KEY CLUSTERED ([FunctieId] ASC);
GO

-- Creating primary key on [betalingsWijzeId] in table 'BetalingsWijzes'
ALTER TABLE [dbo].[BetalingsWijzes]
ADD CONSTRAINT [PK_BetalingsWijzes]
    PRIMARY KEY CLUSTERED ([betalingsWijzeId] ASC);
GO

-- Creating primary key on [AdresId] in table 'Adres'
ALTER TABLE [dbo].[Adres]
ADD CONSTRAINT [PK_Adres]
    PRIMARY KEY CLUSTERED ([AdresId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [personeelId] in table 'leveringSet'
ALTER TABLE [dbo].[leveringSet]
ADD CONSTRAINT [FK_personeellevering]
    FOREIGN KEY ([personeelId])
    REFERENCES [dbo].[personeelSet]
        ([PersoneelId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_personeellevering'
CREATE INDEX [IX_FK_personeellevering]
ON [dbo].[leveringSet]
    ([personeelId]);
GO

-- Creating foreign key on [leveringRegelsId] in table 'leveringSet'
ALTER TABLE [dbo].[leveringSet]
ADD CONSTRAINT [FK_leveringRegelslevering]
    FOREIGN KEY ([leveringRegelsId])
    REFERENCES [dbo].[leveringRegelsSet]
        ([LeveringRegelsId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_leveringRegelslevering'
CREATE INDEX [IX_FK_leveringRegelslevering]
ON [dbo].[leveringSet]
    ([leveringRegelsId]);
GO

-- Creating foreign key on [filiaal_codeId] in table 'personeelSet'
ALTER TABLE [dbo].[personeelSet]
ADD CONSTRAINT [FK_filiaalCodepersoneel]
    FOREIGN KEY ([filiaal_codeId])
    REFERENCES [dbo].[filiaal_codeSet]
        ([FiliaalCodeId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_filiaalCodepersoneel'
CREATE INDEX [IX_FK_filiaalCodepersoneel]
ON [dbo].[personeelSet]
    ([filiaal_codeId]);
GO

-- Creating foreign key on [orderId] in table 'betalingSet'
ALTER TABLE [dbo].[betalingSet]
ADD CONSTRAINT [FK_orderbetaling]
    FOREIGN KEY ([orderId])
    REFERENCES [dbo].[orderSet]
        ([orderId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_orderbetaling'
CREATE INDEX [IX_FK_orderbetaling]
ON [dbo].[betalingSet]
    ([orderId]);
GO

-- Creating foreign key on [orderId] in table 'order_regelSet'
ALTER TABLE [dbo].[order_regelSet]
ADD CONSTRAINT [FK_orderorder_regel]
    FOREIGN KEY ([orderId])
    REFERENCES [dbo].[orderSet]
        ([orderId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_orderorder_regel'
CREATE INDEX [IX_FK_orderorder_regel]
ON [dbo].[order_regelSet]
    ([orderId]);
GO

-- Creating foreign key on [abonne_en_klantId] in table 'order_regelSet'
ALTER TABLE [dbo].[order_regelSet]
ADD CONSTRAINT [FK_abonne_en_klantorder_regel]
    FOREIGN KEY ([abonne_en_klantId])
    REFERENCES [dbo].[abonnee_en_klantSet]
        ([AbonneeEnKlantId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_abonne_en_klantorder_regel'
CREATE INDEX [IX_FK_abonne_en_klantorder_regel]
ON [dbo].[order_regelSet]
    ([abonne_en_klantId]);
GO

-- Creating foreign key on [productId] in table 'prijsSet'
ALTER TABLE [dbo].[prijsSet]
ADD CONSTRAINT [FK_productprijs]
    FOREIGN KEY ([productId])
    REFERENCES [dbo].[productSet]
        ([ProductId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_productprijs'
CREATE INDEX [IX_FK_productprijs]
ON [dbo].[prijsSet]
    ([productId]);
GO

-- Creating foreign key on [categorieId] in table 'productSet'
ALTER TABLE [dbo].[productSet]
ADD CONSTRAINT [FK_categorieproduct]
    FOREIGN KEY ([categorieId])
    REFERENCES [dbo].[categorieSet]
        ([categorieId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_categorieproduct'
CREATE INDEX [IX_FK_categorieproduct]
ON [dbo].[productSet]
    ([categorieId]);
GO

-- Creating foreign key on [productId] in table 'leveringRegelsSet'
ALTER TABLE [dbo].[leveringRegelsSet]
ADD CONSTRAINT [FK_productleveringRegels]
    FOREIGN KEY ([productId])
    REFERENCES [dbo].[productSet]
        ([ProductId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_productleveringRegels'
CREATE INDEX [IX_FK_productleveringRegels]
ON [dbo].[leveringRegelsSet]
    ([productId]);
GO

-- Creating foreign key on [FunctieId] in table 'personeelSet'
ALTER TABLE [dbo].[personeelSet]
ADD CONSTRAINT [FK_Functiepersoneel]
    FOREIGN KEY ([FunctieId])
    REFERENCES [dbo].[FunctieSet]
        ([FunctieId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Functiepersoneel'
CREATE INDEX [IX_FK_Functiepersoneel]
ON [dbo].[personeelSet]
    ([FunctieId]);
GO

-- Creating foreign key on [statusId] in table 'leveringSet'
ALTER TABLE [dbo].[leveringSet]
ADD CONSTRAINT [FK_statuslevering]
    FOREIGN KEY ([statusId])
    REFERENCES [dbo].[statusSet]
        ([StatusId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_statuslevering'
CREATE INDEX [IX_FK_statuslevering]
ON [dbo].[leveringSet]
    ([statusId]);
GO

-- Creating foreign key on [BetalingsWijze_betalingsWijzeId] in table 'betalingSet'
ALTER TABLE [dbo].[betalingSet]
ADD CONSTRAINT [FK_BetalingsWijzebetaling]
    FOREIGN KEY ([BetalingsWijze_betalingsWijzeId])
    REFERENCES [dbo].[BetalingsWijzes]
        ([betalingsWijzeId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BetalingsWijzebetaling'
CREATE INDEX [IX_FK_BetalingsWijzebetaling]
ON [dbo].[betalingSet]
    ([BetalingsWijze_betalingsWijzeId]);
GO

-- Creating foreign key on [AdresAdresId] in table 'filiaal_codeSet'
ALTER TABLE [dbo].[filiaal_codeSet]
ADD CONSTRAINT [FK_AdresFiliaal]
    FOREIGN KEY ([AdresAdresId])
    REFERENCES [dbo].[Adres]
        ([AdresId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AdresFiliaal'
CREATE INDEX [IX_FK_AdresFiliaal]
ON [dbo].[filiaal_codeSet]
    ([AdresAdresId]);
GO

-- Creating foreign key on [personeel_PersoneelId] in table 'orderSet'
ALTER TABLE [dbo].[orderSet]
ADD CONSTRAINT [FK_orderpersoneel]
    FOREIGN KEY ([personeel_PersoneelId])
    REFERENCES [dbo].[personeelSet]
        ([PersoneelId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_orderpersoneel'
CREATE INDEX [IX_FK_orderpersoneel]
ON [dbo].[orderSet]
    ([personeel_PersoneelId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------