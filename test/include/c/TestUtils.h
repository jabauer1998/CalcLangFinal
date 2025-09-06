#ifndef TEST_UTILS
#define TEST_UTILS

#include <stdio.h>
#include <string.h>

#define ASSERT_TRUE(test, str)			\
  if((test) == 1){				\
    perror((str));				\
    return 0;					\
  }

#define ASSERT_EQ(one, another, str) \
  if((one) != (another)){	     \
    perror((str));		     \
    return 0;			     \
  }

#define ASSERT_STR_EQ(one, another, str)	 \
  if(strcmp((one), (another)) != 0){		 \
    perror((str));				 \
    return 0;					 \
  }

#define RUN_TEST(test)				\
  if((test()) == 1){				\
    printf("Success: %s passed!!\n", #test);	\
  } else {					\
    printf("Error: %s failed!!\n", #test);	\
    return 1;					\
  }

#endif
