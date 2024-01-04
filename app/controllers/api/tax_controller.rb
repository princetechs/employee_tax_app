module Api
  class TaxController < ApplicationController
    
    def tax_deduction
      employees_tax_info = Employee.all.map do |employee|
            months_worked = calculate_months_worked(employee.doj)
            total_salary = calculate_total_salary(employee.salary, months_worked)
            tax = calculate_tax(total_salary)
            cess = calculate_cess(total_salary)

        {
          employee_code: employee.employee_id,
          first_name: employee.first_name,
          last_name: employee.last_name,
          yearly_salary: total_salary,
          tax_amount: tax,
          cess_amount: cess
        }
      end

        render json: employees_tax_info

    end

    private
  # tax calculator 

   def calculate_tax(salary)

      case salary
        when 0..250000
          0
        when 250001..500000
          (salary - 250000) * 0.05
        when 500001..1000000
          12500 + (salary - 500000) * 0.1
        else
          62500 + (salary - 1000000) * 0.2
       end

    end
# calculate_cess
    def calculate_cess(yearly_salary)
      return (yearly_salary > 2500000) ? (yearly_salary - 2500000) * 0.02 : 0
    end

# calculate moths worked for  Year
      def calculate_months_worked(date_of_joining)
        current_financial_year =Date.today.month >= 4 ? Date.today.year : Date.today.year - 1
        doj_year =  date_of_joining.year
        doj_month  = date_of_joining.month
         (doj_year == current_financial_year) ? 13 - doj_month : 12
    end

  def calculate_total_salary(salary, months_worked)
    salary * months_worked
  end
   end
end
