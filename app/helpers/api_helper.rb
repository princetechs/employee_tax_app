module ApiHelper
    def calculate_tax(salary)
      case salary
      when 0..250_000
        0
      when 250_001..500_000
        (salary - 250_000) * 0.05
      when 500_001..1_000_000
        12_500 + (salary - 500_000) * 0.1
      else
        62_500 + (salary - 1_000_000) * 0.2
      end
    end
  
    def calculate_cess(yearly_salary)
      return (yearly_salary > 2_500_000) ? (yearly_salary - 2_500_000) * 0.02 : 0
    end
  end
  