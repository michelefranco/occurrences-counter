# Occurences Counter

This project consists of the development of counting the occurences of words from `The old man and the sea - Ernest Hemingway` textbook.
It will be analysed Pros and Cons of approaches applied to solve the problem by clarifying each one separately. But before to delve into solutions, let's see the process to make the whole application.

## Architecture

Nowadays, iOS developers has several ways to make an application. Among them, one the biggest choice for developers is a proper architecture to exploit for building a product. 

Specifically, the most famous architectural patterns are:

- MVC
- MVP
- MVVM
- VIPER

A deep analysis of each one is beyond the scope of this review, but how should developers choose the right archictecture for a specific problem?

#### Distribution of correct responsibilities among components. 

Every software engineer knows what SOLID principles are. The first letter stands for `Single responsibility principle` and it cannot just be a case if the detection of the correct responsibilities is at the top of the designing of an application.
It is a "weapon" to defeat and manage complexity of a product. 

#####Testability
Separation of concerns has the benefit of making implementations testable. The more data are isolated from the business logic and user interface the more unit tests are straightforward to write.

#### Ease of use
Architectures could be very complex in terms of effort and maintainance. Sometimes, making a product more robust than necessary for its intended use is the key for potential issues.


Therefore, patterns like VIPER and MVVM are the best for testability and leveraging single responsibities but the project could be overengineered.

Because of the simplicity of the system specifications, the application has been developed by adopting `MVC` as architectural pattern. 
This one is fully provided by Apple, and we'll achieve a tradeoff between testability and organization of the implementation through it.


