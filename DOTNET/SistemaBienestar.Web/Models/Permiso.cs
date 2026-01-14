using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SistemaBienestar.Web.Models
{
    [Table("permiso")]
    public class Permiso
    {
        [Column("IDCARGO")]
        public int IdCargo { get; set; }

        [Column("IDMENU")]
        public int IdMenu { get; set; }

        [ForeignKey("IdCargo")]
        public Cargo Cargo { get; set; }

        [ForeignKey("IdMenu")]
        public Menu Menu { get; set; }
    }
}
