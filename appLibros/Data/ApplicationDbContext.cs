﻿using Microsoft.EntityFrameworkCore;
using Models.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions options) : base(options)
        {
        }

        public DbSet<Categoria> Categorias { get; set; }
        public DbSet<Libro> Libros { get; set; }

        public DbSet<Autor> Autores { get; set; }

        public DbSet<Review> Reviews { get; set; }

        public DbSet<PrecioOferta> PrecioOfertas { get; set; }

        public DbSet<AutorLibro> AutoresLibros { get; set; }
    }
}
