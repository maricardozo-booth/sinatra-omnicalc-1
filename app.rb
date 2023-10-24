require "sinatra"
require "sinatra/reloader"

get("/") do

  erb(:square)

end

get("/square/new") do

  erb(:square)

end

get("/square_root/new") do

  erb(:square_root)
end

get("/payment/new") do

  erb(:payment)

end

get("/random/new") do

  erb(:random)

end

get("/random/results") do

  @mininput = params.fetch("user_min").to_f
  @maxinput = params.fetch("user_max").to_f

  @result = rand(@mininput..@maxinput)

  erb(:random_results)

end

get("/payment/results") do

  @apr = params.fetch("user_apr").to_f
  @years = params.fetch("user_years").to_i
  @prin = params.fetch("user_prin").to_f

  @months = @years * 12
  @r = (@apr / 100) / 12

  @numerator = @r * @prin
  @denominator = 1 - (1 + @r) ** (-(@months))

  @formula = @numerator / @denominator
  
  @payment = @formula.to_fs(:currency)

  erb(:payment_results)

end

get("/square/results") do

@num_squa = params.fetch("user_square").to_f
@squa_result = @num_squa ** 2

  erb(:square_results)

end

get("/square_root/results") do

@num_root = params.fetch("user_root").to_f
@root_result = Math.sqrt(@num_root)

  erb(:square_root_results)

end
