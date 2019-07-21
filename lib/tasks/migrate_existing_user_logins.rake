# Run once in production with `be rake migrate_existing_user_logins`
# Delete in the next branch so it's never run again!
desc 'Move existing login info from users table to app_auths table'
task migrate_existing_user_logins: :environment do
  User.all.each do |user|
    begin
      AppAuth.create!(
        user: user,
        username: user.username,
        password_digest: user.password_digest, 
        created_at: user.created_at,
        updated_at: user.updated_at
      )
      user.update!(display_name: user.username)
      user.update!(username: nil, password_digest: nil)
      puts "User #{user.id} successfully migrated".green
    rescue Exception => e
      puts "User #{user.id} failed to migrate! Here is the stack trace:".red
      e.backtrace.each { |line| puts line }
    end
  end
end
