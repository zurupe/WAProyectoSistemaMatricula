using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SistemaBienestar.Web.Models
{
    [Table("Empleado")]
    public class Empleado
    {
        [Key]
        [Column("IDEMPLEADO")]
        public int IdEmpleado { get; set; }

        [Column("IDENTIFICADOR")]
        [Required]
        [StringLength(20)]
        public string Identificador { get; set; }

        [Column("NOMBRE")]
        [Required]
        [StringLength(100)]
        public string Nombre { get; set; }

        [Column("APELLIDOS")]
        [Required]
        [StringLength(100)]
        public string Apellidos { get; set; }

        [Column("FOTO")]
        public string Foto { get; set; }

        [Column("CIUDAD")]
        public string Ciudad { get; set; }

        [Column("DIRECCION")]
        public string Direccion { get; set; }

        [Column("ESTADOCIVIL")]
        public string EstadoCivil { get; set; }

        [Column("TELEFONO")]
        public string Telefono { get; set; }

        [Column("CORREO")]
        public string Correo { get; set; }

        [Column("IDCARGO")]
        public int IdCargo { get; set; }

        [ForeignKey("IdCargo")]
        public Cargo Cargo { get; set; }
    }
}
