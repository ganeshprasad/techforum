# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_techforum_session',
  :secret      => '2e6c03ea21cf67274b929823b4dc92d3f040d7c4487d71558f3d78c2638c4045c6837f920d52cb10e9980478ca25a63840f0ddb968fcadc92268cac8ce9052b4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
