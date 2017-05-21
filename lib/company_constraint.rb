class CompanyConstraint
  def matches? request
    debugger
    !!request.env["warden"].user(:company)
  end
end
