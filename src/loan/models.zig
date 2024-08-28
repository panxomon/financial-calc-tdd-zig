pub const Loan = struct {
    amount: f64,
    interestRate: f64,
    termInMonths: u32,
};

pub const CalculationResult = struct {
    monthlyPayment: f64,
    totalPayment: f64,
    totalInterest: f64,
    principal: f64,
    CAE: f64,
};
