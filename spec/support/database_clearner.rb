RSpec.configure do |config|

  config.before(:suite) do
    DatabaseClearner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseClearner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseClearner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseClearner.start
  end

  config.after(:each) do
    DatabaseClearner.clean
  end

end
