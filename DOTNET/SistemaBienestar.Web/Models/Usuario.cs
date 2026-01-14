using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SistemaBienestar.Web.Models
{
    [Table("Usuario")]
    public class Usuario
    {
        [Key]
        [Column("IDUSUARIO")]
        public int IdUsuario { get; set; }

        [Column("NOMBREUSUARIO")]
        [Required]
        [StringLength(100)]
        public string NombreUsuario { get; set; }

        [Column("CLAVE")]
        [Required]
        [StringLength(100)]
        public string Clave { get; set; }

        [Column("ESTADO")]
        public bool Estado { get; set; }

        [Column("IDCARGO")]
        public int? IdCargo { get; set; }

        [ForeignKey("IdCargo")]
        public Cargo Cargo { get; set; }
    }
}
