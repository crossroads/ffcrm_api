# FfcrmApi

This is a plugin for Fat Free CRM that provides an API to access data using REST principles and serialized as json.

*IMPORTANT NOTE:* Do NOT consider this production ready code. There are still plenty of security concerns to address!

## Features

Provides index and show actions for all entities (and tasks and users) via json.

E.g. for accounts

 * GET    /api/v1/accounts.json?single_access_token=XYZQWERT1231!#@   (index)
 * GET    /api/v1/accounts/1.json?single_access_token=XYZQWERT1231!#@ (show)
 * PUT    /api/v1/accounts/1.json?single_access_token=XYZQWERT1231!#@ (update)
 * DELETE /api/v1/accounts/1.json?single_access_token=XYZQWERT1231!#@ (destroy)

Substitute 'accounts' above for contacts, campaigns, opportunities, leads, tasks and users.

Note: to get the single_access_token for the currently logged in user, go to the 'profile' section in Fat Free CRM.

## EXAMPLE RESPONSES

GET /api/v1/contacts/47.json

    {
      contact: {
        id: 47,
        first_name: "Cary",
        last_name: "Wiza",
        user_id: 5,
        opportunity_ids: [
          43
        ]
      }
    }


## TODO

* Expand on list of model attributes that are serialized.
* Search for multiple ids e.g. contacts.json?ids=1,2,3,4
* Pagination of objects server-side (currently everything is returned)
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
