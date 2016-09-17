# This file is part of the Minnesota Population Center's refworks-api-ruby project.
# For copyright and licensing information, see the NOTICE and LICENSE files
# in this project's top-level directory, and also online at:
#   https://github.com/mnpopcenter/refworks-api-ruby

class ReferenceGetResponse < RetrieveResponse
  # Note the weirdness here, that ReferenceGetResponse is a child of RetrieveResponse (not ReferenceResponse).
  # That's because the get method returns one or more references, which is exactly what Retrieve class is designed
  # to do, whereas the rest of the Reference class has to do with -modifying- references.

  # In other words, there probably shouldn't be a get method in the Reference class, but that's how the API is done.
end