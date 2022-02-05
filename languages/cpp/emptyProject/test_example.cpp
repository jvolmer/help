#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE test_example

#include "example.hpp"
#include <boost/test/unit_test.hpp>
#include <turtle/mock.hpp>

BOOST_AUTO_TEST_SUITE (initialize_example)

BOOST_AUTO_TEST_CASE( initialization_with_name )
{
    Example example = Example();
    BOOST_TEST( 1 == 1 );
}

BOOST_AUTO_TEST_SUITE_END()
