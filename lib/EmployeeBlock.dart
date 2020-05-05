//TODO: imports

//TODO: List of employees

//TODO: Stream controllers


//TODO:Stream Sink getter


//TODO: Constructor -add data; listen to changes


//TODO Core functions


//TODO:  Dispose


import 'dart:async';
import 'Employee.dart';

class EmployeeBloc {
  //sink to add in pipe
  //stream to get data from pipe
  //by pipe i mean data flow

  List<Employee> _employeeList = [

    Employee(1, "Employee One", 10000.0),
    Employee(2, "Employee Two", 20000.0),
    Employee(3, "Employee Three", 25000.0),
    Employee(4, "Employee Three", 30000.0),
    Employee(5, "Employee Three", 35000.0),

  ];

  final _employeeListController = StreamController<List<Employee>>();

  final _employeeSalaryIncStreamController = StreamController<Employee>();
  final _employeeSalaryDecStreamController = StreamController<Employee>();


  Stream<List<Employee>> get employeeListStream =>
      _employeeListController.stream;

  StreamSink<List<Employee>> get employeeListSink =>
      _employeeListController.sink;


StreamSink<Employee> get employeeSalaryInc=> _employeeSalaryIncStreamController.sink;
StreamSink<Employee> get employeeSararyDec =>_employeeSalaryDecStreamController.sink;

EmployeeBloc(){

  _employeeListController.add(_employeeList);
  _employeeSalaryIncStreamController.stream.listen(_incrementSalary);
  _employeeSalaryDecStreamController.stream.listen(_decrementSalary);

}



  _incrementSalary(Employee employee) {

    double salary = employee.salary;
    double incrementedSalary = salary * 20 /100;
    _employeeList[employee.id -1].salary=salary + incrementedSalary;
    employeeListSink.add(_employeeList);
  }

  _decrementSalary(Employee employee) {

    double salary = employee.salary;
    double decrementedSalary = salary * 20 /100;
    _employeeList[employee.id -1].salary=salary -decrementedSalary;
    employeeListSink.add(_employeeList);

  }
  void dispose(){
    _employeeListController.close();
    _employeeSalaryIncStreamController.close();
    _employeeSalaryDecStreamController.close();
  }


}

