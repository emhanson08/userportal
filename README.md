# READ ME

Requires Ruby 2.5.0 and Rails 5.1.6
Requires PostgresQL 10.3

#To use:

- Open directory in console
- Run 'bundle install' to install all gem dependencies.
- Run 'rake db:create' followed by 'rake db:migrate'
- To seed the database (if not already seeded), run the following rake tasks:
	-'bundle exec rake import_data:clinicians'
	-'bundle exec rake import_data:patients'
	-'bundle exec rake import_data:appointments'

#To view:

- Run 'rails s' in console, and go to localhost:3000 in the browser.

#My Thought Process:

I wanted to build a simple and clean landing page with straightfoward navigation. At this point, the app only performs data retrieval, but is set up to include data submission for patients in the future. I wanted to focus on scalibility and user experience as main concerns.

#Tackling the main challenge:

I decided to display the average number of daily appointments for each clinician from the week prior to their most recent appointment (thus ensuring a complete workweek, regardless of how many days the clinician works). 

After retrieving the clinicians most recent appointment, I find the date of the previous Monday (start of the work week), and return an array containing the previous Monday and Friday. Next, each appointment record associated with the clinician, with a date_of_service between Monday and Friday, is pulled from the database. For each of these records, a counter increments by one. Once all records are found, the counter total is divided by the number of days the clinician is working during the week. This results in the clinicians' daily average number of appointments from that week. Using this information, I also indicated in the clinicians table whether each clinician met their target_patients_per_day goal during that week.

#Additional features:

Just for fun, I created a search function for the patients. I figure that this feature would be useful for clinicians needing to add notes, schedule appointments, or review patient information. This could also extend to administrative staff making appointments and updating information (contact info, etc.). Currently, the search function only searches first_name, last_name, and email, but this could easily be expanded by adjusting the search method in the patient model.


#Moving forward:

There's a lot that could be added to this app. I decided against creating a sign-up/log-in capability to make manual testing easier at this stage, but would like to add one for authentication purposes. I would want Clinician profiles, and add clinician access to view their own upcoming appointments. With an authetication system, I would remove the clinician table, and only allow each clinician to access their own profile information (including weekly averages and other data). The clinician link on the landing page would be converted to a link navigating to the clinicians profile.

I would also want to add a submission feature for adding new patients to the database, editing patient information, adding and editing appointments, etc. 

A feature I'd love to see in an app geared toward clinicians is a system for logging patient sessions, treatment goals, and possibly even a suggestion system for treatment options (i.e. pulling from a database of local support groups). Patients who have met treatment goals (i.e. "complete 6 sessions") could be flagged on the clinicians portal. This could be useful for determining when to terminate the patient-clinician relationship.

I would also want to add a DSM-V searchable database for clinicians to use for diagnosing, which could screen for input symptoms and return results of most common diagnoses.
