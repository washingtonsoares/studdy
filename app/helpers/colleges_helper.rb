module CollegesHelper
  def get_college_from_request(request)
    referer = request.host_with_port

    @college = College.find_by_url(referer)
    redirect_to "/404.html" if @college.nil?
  end
end
