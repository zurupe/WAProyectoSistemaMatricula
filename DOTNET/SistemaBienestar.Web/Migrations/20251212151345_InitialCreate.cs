using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace SistemaBienestar.Web.Migrations
{
    /// <inheritdoc />
    public partial class InitialCreate : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "cargo",
                columns: table => new
                {
                    IDCARGO = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    NOMBRECARGO = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    ESTADO = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_cargo", x => x.IDCARGO);
                });

            migrationBuilder.CreateTable(
                name: "empleado",
                columns: table => new
                {
                    IDEMPLEADO = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    IDENTIFICADOR = table.Column<string>(type: "nvarchar(20)", maxLength: 20, nullable: false),
                    NOMBRE = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    APELLIDOS = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    FOTO = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CIUDAD = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    DIRECCION = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    ESTADOCIVIL = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    TELEFONO = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CORREO = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    IDCARGO = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_empleado", x => x.IDEMPLEADO);
                    table.ForeignKey(
                        name: "FK_empleado_cargo_IDCARGO",
                        column: x => x.IDCARGO,
                        principalTable: "cargo",
                        principalColumn: "IDCARGO",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "usuario",
                columns: table => new
                {
                    IDUSUARIO = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    NOMBREUSUARIO = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    CLAVE = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    ESTADO = table.Column<bool>(type: "bit", nullable: false),
                    IDCARGO = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_usuario", x => x.IDUSUARIO);
                    table.ForeignKey(
                        name: "FK_usuario_cargo_IDCARGO",
                        column: x => x.IDCARGO,
                        principalTable: "cargo",
                        principalColumn: "IDCARGO",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_empleado_IDCARGO",
                table: "empleado",
                column: "IDCARGO");

            migrationBuilder.CreateIndex(
                name: "IX_usuario_IDCARGO",
                table: "usuario",
                column: "IDCARGO");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "empleado");

            migrationBuilder.DropTable(
                name: "usuario");

            migrationBuilder.DropTable(
                name: "cargo");
        }
    }
}
