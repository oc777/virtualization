desc "Create a first user for single tenant mode"
task :create_testuser => :environment do
  if Hours.single_tenant_mode?
    user = build_testuser
    if user.valid?
      user.save
      puts "The user is created"
    else 
      puts "This user is not valid"
    end
  else
    puts "You're not in single tenant mode. If you want to use the single tenant mode set: 'SINGLE_TENANT_MODE=true' in your environment variables"
  end
end

def build_testuser
  first_name = "Test" 
  last_name = "Test" 
  email = "test@yopmail.com"   
  password = "test1234"
  puts
  User.new(first_name: first_name,
           last_name: last_name,
           email: email,
           password: password,
           confirmed_at: Date.current)
end
  
