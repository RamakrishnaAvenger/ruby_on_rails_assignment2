class EmployeesController < ApplicationController
    def index
        @employees_data = Employee.all
        @employees=Hash new
        @employees_data.each do |employee_data|
            if @employees.has_key?(employee_data[:lead_name])
                @employees[employee_data[:lead_name]].push({"name":employee_data[:name],"skills":employee_data[:skills].split(',').length})
            else
                @employees[employee_data[:lead_name]]=[]
                @employees[employee_data[:lead_name]].push({"name":employee_data[:name],"skills":employee_data[:skills].split(',').length})
            end
        end
        @employees.each do |k,v| 
            puts k
            puts v
            @employees[k]=v.sort_by { |ob| ob[:skills] }.reverse
        end
        @lead_names=@employees.keys
        puts @employees

        
    end

    def show
        @employee = Employee.find(params[:id])
        puts @employee
    end
    
    def new
    end
    
    def create
        @employee = Employee.new(employee_params)
        @employee.save
        redirect_to @employee
    end
    
    private
        def employee_params
            params.require(:employee).permit(:name,:project_name,:lead_name,:skills)
        end

end
