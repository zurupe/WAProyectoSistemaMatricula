using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SistemaBienestar.Web.Models
{
    [Table("Cargo")]
    public class Cargo
    {
        [Key]
        [Column("IDCARGO")]
        public int IdCargo { get; set; }

        [Column("NOMBRECARGO")]
        [StringLength(100)] 
        public string NombreCargo { get; set; }

        [Column("ESTADO")]
        public bool Estado { get; set; }
    }
}
