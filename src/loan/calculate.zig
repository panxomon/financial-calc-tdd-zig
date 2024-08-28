const std = @import("std");
const Loan = @import("models.zig").Loan;
const CalculationResult = @import("models.zig").CalculationResult;
const services = @import("services.zig");

fn calcularCuotaMensual(monto: f64, tasaMensual: f64, numeroCuotas: u32) f64 {
    const r = tasaMensual / 100.0;
    const totalMonths = @as(f64, @floatFromInt(numeroCuotas));
    const factor = std.math.pow(f64, 1.0 + r, totalMonths);
    const cuotaMensual = monto * r * factor / (factor - 1.0);
    return std.math.round(cuotaMensual);
}

test "calcularCuotaMensual con tasa del 1.9% para 12 meses y monto de 5000" {
    const monto = 5000.0;
    const tasaMensual = 1.9;
    const numeroCuotas = 12;
    const esperado = 470.0; // Valor esperado aproximado
    const result = calcularCuotaMensual(monto, tasaMensual, numeroCuotas);

    try std.testing.expect(result == std.math.round(esperado));
}
