# Mobile Developer Coding Challenge

Please read the instructions below carefully before starting the coding challenge. This coding challenge should take no longer than 3 hours to complete.

Once submitted, the mobile team will review your work and get back to you as soon as possible.

## The Goal

You will be building a simple two-screen podcasts app. Please follow the mockup below as closely as possible when building the UI.

[![](https://i.imgur.com/eyErQf4.png)](https://i.imgur.com/eyErQf4.png)

#### Screen 1

- [ ] Show a list of podcasts using the endpoint provided below.
- [ ] Each list item should show the podcast thumbnail, title, and publisher name.
- [ ] Leave some space for the "Favourited" label (refer to the second list item in the mockup above).
- [ ] Show the Favourited label only if the podcast has been favourited, otherwise hide the label.

#### Screen 2

- [ ] Tapping on a list item from Screen 1 should bring you to Screen 2.
- [ ] On Screen 2, show the podcast's title, publisher name, thumbnail, and description.
- [ ] Add a Favourite button.
- [ ] The Favourite button should have two states: Favourite and Favourited.
- [ ] When tapping the Favourite button, the label should change to Favourited, and vice-versa.

## Details

- [ ] Fork this repo and keep it public until we've been able to review it.
- [ ] Can be written in either Java or Kotlin. Preference towards Kotlin.
- [ ] For the API, use data provided by Listen Notes:
	 - [ ] Use the following endpoint to fetch podcast data: https://www.listennotes.com/api/docs/?lang=kotlin&test=1#get-api-v2-best_podcasts
	 - [ ] No API key required, you can simply use the mock server to fetch test data. [More information here](https://www.listennotes.help/article/48-how-to-test-the-podcast-api-without-an-api-key "More information here").
- [ ] Focus on implementing the app in portrait orientation only.
- [ ] The list should support pagination, loading 10 items at a time.
- [ ] When a user taps on a list item, a new page should be presented and the following details should be displayed:

## The Evaluation

Your code will be evaluated based on the following criteria:

- [ ] The code should compile.
- [ ] No crashes, bugs, or compiler warnings.
- [ ] App operates as outlined above.
- [ ] Conforms to SOLID principles.
- [ ] Code is easy to understand. Bonus points for documentation.
- [ ] Commit history is consistent, easy to follow and understand.
