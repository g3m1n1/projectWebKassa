USE [bart's webkassa's]
GO
ALTER TABLE categorieSet
ADD CONSTRAINT AK_Categorie UNIQUE (Naam);
GO
ALTER TABLE productSet
ADD CONSTRAINT AK_Naam UNIQUE (Naam);
GO
ALTER TABLE Adres
ADD CONSTRAINT AK_Straat UNIQUE (Straat, Land, Postcode);
GO
