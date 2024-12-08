using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Entites.Models;

public partial class EconnectContext : DbContext
{
    public EconnectContext()
    {
    }

    public EconnectContext(DbContextOptions<EconnectContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Company> Companies { get; set; }

    public virtual DbSet<GetLeadFields> GetLeadFields { get; set; }

    public virtual DbSet<LeadContactList> LeadContactList { get; set; }
    public virtual DbSet<AllLeadContactListByLeadId> GetAllLeadContactListByLeadId { get; set; }

    public virtual DbSet<LeadStatus> LeadStatuses { get; set; }

    public virtual DbSet<Login> Logins { get; set; }

    public DbSet<DecryptedPasswordDto> DecryptedPasswordDtos { get; set; }
    
    public virtual DbSet<ReferalSource> ReferalSources { get; set; }

    public DbSet<DynamicControls> DynamicControls { get; set; }

    public DbSet<DynamicControlValues> DynamicControlValues { get; set; }

    public DbSet<LinkLeadContacts> LinkLeadContacts { get; set; }
    public DbSet<LeadContactRelationship> LeadContactRelationships { get; set; }
    public DbSet<Campuses> Campuses { get; set; }
    public DbSet<Event> Event { get; set; }
    public DbSet<EventFull> EventFull { get; set; }
    public DbSet<EventTypes> EventTypes { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseSqlServer("Data Source=DESKTOP-GDN6AI3\\SQL2014;Initial Catalog=Econnect;TrustServerCertificate=true;persist security info=True; Integrated Security=SSPI;MultipleActiveResultSets=True;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Company>(entity =>
        {
            entity.HasKey(e => e.CompanyId).HasName("pk_Company_CompanyID");

            entity.ToTable("Company");

            entity.Property(e => e.CompanyFullName)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.CompanyShortName)
                .HasMaxLength(30)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn).HasColumnType("datetime");
            entity.Property(e => e.IsProcessed)
                .HasMaxLength(4)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.ModifiedOn).HasColumnType("datetime");
        });

        modelBuilder.Entity<LeadStatus>(entity =>
        {
            entity.HasKey(e => e.LeadStatusId).HasName("pk_LeadStatus_LeadStatusID");

            entity.ToTable("LeadStatus");

            entity.Property(e => e.LeadStatusId).HasColumnName("LeadStatusID");
            entity.Property(e => e.CreatedOn).HasColumnType("datetime");
            entity.Property(e => e.LeadStatus1)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("LeadStatus");
            entity.Property(e => e.ModifiedOn).HasColumnType("datetime");
        });

        modelBuilder.Entity<Login>(entity =>
        {
            entity.HasKey(e => new { e.LoginId, e.CompanyId }).HasName("PK_Login_LoginID_PropertID");

            entity.ToTable("Login");

            entity.Property(e => e.LoginId).ValueGeneratedOnAdd();
            entity.Property(e => e.CreatedOn).HasColumnType("datetime");
            entity.Property(e => e.EmailAddress).HasMaxLength(100);
            entity.Property(e => e.ExpiryDate).HasColumnType("smalldatetime");
            entity.Property(e => e.IsProcessed)
                .HasMaxLength(4)
                .IsUnicode(false)
                .HasDefaultValue("INC")
                .IsFixedLength();
            entity.Property(e => e.Login1)
                .HasMaxLength(255)
                .HasColumnName("Login");
            entity.Property(e => e.LoginType).HasMaxLength(50);
            entity.Property(e => e.NewProcess).HasMaxLength(500);
            entity.Property(e => e.Password).HasMaxLength(50);
            entity.Property(e => e.ShortName)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

            entity.HasOne(d => d.Company).WithMany(p => p.Logins)
                .HasForeignKey(d => d.CompanyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Login_Company");
        });



        modelBuilder.Entity<ReferalSource>(entity =>
        {
            entity.HasKey(e => e.ReferalSourceId).HasName("pk_ReferalSource_ID");

            entity.ToTable("ReferalSource");

            entity.Property(e => e.ReferalSourceId).HasColumnName("ReferalSourceID");
            entity.Property(e => e.CreatedOn).HasColumnType("datetime");
            entity.Property(e => e.ModifiedOn).HasColumnType("datetime");
            entity.Property(e => e.ReferalSource1)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("ReferalSource");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
