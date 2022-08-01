## What's a design pattern?
Design patterns are typical solutions to commonly occurring problems in software design. They are like pre-made blueprints that you can customize to solve a recurring design problem in your code.

You can’t just find a pattern and copy it into your program, the way you can with off-the-shelf functions or libraries. The pattern is not a specific piece of code, but a general concept for solving a particular problem. You can follow the pattern details and implement a solution that suits the realities of your own program.

Patterns are often confused with algorithms, because both concepts describe typical solutions to some known problems. While an algorithm always defines a clear set of actions that can achieve some goal, a pattern is a more high-level description of a solution. The code of the same pattern applied to two different programs may be different.

An analogy to an algorithm is a cooking recipe: both have clear steps to achieve a goal. On the other hand, a pattern is more like a blueprint: you can see what the result and its features are, but the exact order of implementation is up to you.

## What does the pattern consist of?
Most patterns are described very formally so people can reproduce them in many contexts. Here are the sections that are usually present in a pattern description:

**Intent** of the pattern briefly describes both the problem and the solution.

**Motivation** further explains the problem and the solution the pattern makes possible.

**Structure** of classes shows each part of the pattern and how they are related.

**Code example** in one of the popular programming languages makes it easier to grasp the idea behind the pattern.
Some pattern catalogs list other useful details, such as applicability of the pattern, implementation steps and relations with other patterns.

## Why should I learn patterns?
The truth is that you might manage to work as a programmer for many years without knowing about a single pattern. A lot of people do just that. Even in that case, though, you might be implementing some patterns without even knowing it. So why would you spend time learning them?

* Design patterns are a toolkit of tried and tested solutions to common problems in software design. Even if you never encounter these problems, knowing patterns is still useful because it teaches you how to solve all sorts of problems using principles of object-oriented design.

* Design patterns define a common language that you and your teammates can use to communicate more efficiently. You can say, “Oh, just use a Singleton for that,” and everyone will understand the idea behind your suggestion. No need to explain what a singleton is if you know the pattern and its name.

## Classification of patterns
- **Creational** patterns provide object creation mechanisms that increase flexibility and reuse of existing code.
  - **Build** a **Single** **Prototype** inside **Abstract** **Factory**
- **Structural** patterns explain how to assemble objects and classes into larger structures, while keeping these structures flexible and efficient.
  - A **Proxy** **Adapter** is **composed** and **decorated** in such a way that electricity can **flywithweight**  inside **bridge** to a **facade**
- **Behavioral** patterns take care of effective communication and the assignment of responsibilities between objects.
  - I **visited** your **command** unit and after **observing** your state I gave you a **chain of responsibility**  to store the **memento**, with help of a **mediator** **stratergy** you **iterated** to create a **template** and submitted to me.

