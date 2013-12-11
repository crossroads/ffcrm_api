# FfcrmApi

This is a plugin for Fat Free CRM that provides an API to access data using REST principles and serialized as json.

The use case currently driving development of the API is to connect with Ember.js applications.

*IMPORTANT NOTE:* Whilst we are developing this plugin, this will be unstable code. Do NOT consider this production ready code. There are still plenty of security concerns to address!

When the API reaches a stable version 1.0 we will mostly likely incorporate it into the Fat Free CRM and release it.

## Features

Provides index and show actions for all entities (and tasks and users) via json.

E.g. for accounts

 * GET    /api/v1/accounts.json   (index)
 * GET    /api/v1/accounts/1.json (show)
 * PUT    /api/v1/accounts/1.json (update)
 * DELETE /api/v1/accounts/1.json (destroy)

Substitute 'accounts' above for contacts, campaigns, opportunities, leads, tasks and users.

## TODO

* Expand on list of model attributes that are serialized.
* Search for multiple ids (as specified by Ember)
* Pagination of objects server-side
* Custom ordering of objects server-side
* Authorization (via CanCan) to ensure user only see/acts on objects they are allowed
* Entity specific API actions E.g. tasks overdue
* Address mass-assignment issues - currently it is bypassed so it is possible for admin flag on User to be changed.

## Tests

* Inside the ffcrm_api folder, run ```rake```

## Contributions

Fat Free CRM developers who have an interest in pushing towards a stable API are welcome to submit pull-requests, but I'd rather just add you as a collaborator to the github project.
Contact me on the Fat Free CRM users list: https://groups.google.com/forum/?fromgroups#!forum/fat-free-crm-users

Thanks to the following developers:

* SoonKhen OwYong and Brendan Neal (Single access token work)

## LICENSE

MIT (see MIT-LICENSE)

## Credits

* Steve Kenworthy (steveyken)

## Reading List / Useful articles / Thanks

* http://railsware.com/blog/2013/04/08/api-with-ruby-on-rails-useful-tricks/
