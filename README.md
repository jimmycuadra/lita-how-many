# lita-how-many

[![Build Status](https://travis-ci.org/jimmycuadra/lita-how-many.png?branch=master)](https://travis-ci.org/jimmycuadra/lita-how-many)
[![Coverage Status](https://coveralls.io/repos/jimmycuadra/lita-how-many/badge.png)](https://coveralls.io/r/jimmycuadra/lita-how-many)

**lita-how-many** is a handler plugin for [Lita](https://www.lita.io/) which lets Lita answer questions about quantity.

## Installation

Add lita-how-many to your Lita instance's Gemfile:

``` ruby
gem "lita-how-many"
```

## Configuration

* `lower_bound` (Integer) - The lower bound for the exclusive range `(x...y)` from which a random number will be selected. Default: `0`.
* `lower_bound` (Integer) - The upper bound for the exclusive range `(x...y)` from which a random number will be selected. Must be greater than the lower bound. Default: `10`.

## Usage

Ask Lita any question starting with "how many" and she will respond with a random amount.

```
 You: How many bugs will we ship to production this week?
Lita: 8
 You: Seems bad.
```

## License

[MIT](http://opensource.org/licenses/MIT)
