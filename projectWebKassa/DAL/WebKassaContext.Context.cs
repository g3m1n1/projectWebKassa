﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace projectWebKassa.DAL
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class WebKassaContextContainer : DbContext
    {
        public WebKassaContextContainer()
            : base("name=WebKassaContextContainer")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<personeel> personeelSet { get; set; }
        public virtual DbSet<levering> leveringSet { get; set; }
        public virtual DbSet<leveringRegels> leveringRegelsSet { get; set; }
        public virtual DbSet<status> statusSet { get; set; }
        public virtual DbSet<Filiaal> filiaal_codeSet { get; set; }
        public virtual DbSet<order> orderSet { get; set; }
        public virtual DbSet<betaling> betalingSet { get; set; }
        public virtual DbSet<order_regel> order_regelSet { get; set; }
        public virtual DbSet<abonnee_en_klant> abonnee_en_klantSet { get; set; }
        public virtual DbSet<prijs> prijsSet { get; set; }
        public virtual DbSet<product> productSet { get; set; }
        public virtual DbSet<categorie> categorieSet { get; set; }
        public virtual DbSet<Functie> FunctieSet { get; set; }
        public virtual DbSet<BetalingsWijze> BetalingsWijzes { get; set; }
        public virtual DbSet<Adres> Adres { get; set; }
    }
}