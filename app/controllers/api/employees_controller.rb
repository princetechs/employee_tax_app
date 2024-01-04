module Api
    class EmployeesController < ApplicationController
      def create
        @employee = Employee.new(employee_params)
        phone_numbers =  params.dig(:employee, :phone_numbers) || []
  
        if @employee.save
          phone_numbers.each do |number|
            @employee.phone_numbers.create(number: number)
          end
          render json: @employee, status: :created
        else
          render json: { errors: @employee.errors.full_messages }, status: :unprocessable_entity
        end
      end
  
      private
  
      def employee_params
        params.require(:employee).permit(:employee_id, :first_name, :last_name, :email, :doj, :salary)
      end
    end
  end
  