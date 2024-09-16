#include "lib.hpp"

auto main() -> int
{
  auto const lib = library {};

  return lib.name == "SdEngine" ? 0 : 1;
}
