# READ ME

Requires Ruby 2.5.0 and Rails 5.1.6
Requires PostgresQL 10.3

To use:

- Open directory in console
- Run 'bundle install' to install all dependencies
- Run 'rake db:create' followed by 'rake db:migrate'
- To seed the database, run the following rake tasks:
	-'bundle exec rake import_data:clinicians'
	-'bundle exec rake import_data:patients'
	-'bundle exec rake import_data:appointments'

To view:

- Run 'rails s' in console, and go to localhost:3000 in the browser.

My Thought Process:

I wanted to build a simple and clean landing page with straightfoward navigation. Once on the clinicians index page, I 


Moving forward:

- Login capability. Administrative staff may view all Clinician profiles, Clinicians may view their own. Clinicians may build their own profiles, submit specialties, target # of patients, and clinic assignment. Possibly build out feature that allows only members of patients care team to view patient profile.

-Flag each patient that has reached a milestone in their treatment (length of treatment, treatment goal, etc.). Use this to track termination timing.
