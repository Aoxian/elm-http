# Elm Http

Explorations in testing an httpRequestBuilder in Elm 0.19. Uses the elm-lang [Book example][1] as a building block for a simple `GET` request.

## Running Tests and the Error produced

This code is compiling, both `Main.elm` as well as `Tests.elm`.

The Tests do not pass, and I am conviced testing the building of a request is fruitless. Though the hepler function that builds the request is priceless.

The reason for the failure has to do with the implementation of Equality or the (==) operator.

The error message displayed is:

"This test failed because it threw an exception: "Error: Trying to use `(==)` on functions.
There is no way to know if functions are "the same" in the Elm sense.
Read more about this at https://package.elm-lang.org/packages/elm/core/latest/Basics#==
which describes why it is this way and what the better version will look like."

[1]: https://elm-lang.org/examples/book
