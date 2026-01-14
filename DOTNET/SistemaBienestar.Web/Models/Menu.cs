using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SistemaBienestar.Web.Models
{
    [Table("menu")]
    public class Menu
    {
        [Key]
        [Column("IDMENU")]
        public int IdMenu { get; set; }

        [Column("NOMBRE")]
        [StringLength(50)]
        public string Nombre { get; set; }

        [Column("URL")]
        [StringLength(100)]
        public string Url { get; set; }

        [Column("ICONO")]
        [StringLength(50)]
        public string Icono { get; set; }
    }
}
