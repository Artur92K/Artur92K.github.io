---
title: "Introducing JUnit 6: What’s New and How to Test Kotlin Suspend Functions"
date: 2025-10-03 15:00:00 +/-0200
description: An insightful article about testing Kotlin suspend functions in JUnit 6 and the essential role of the @TestInstance annotation in managing the test lifecycle.
categories: [Software, Kotlin ]
tags: [ jdk, junit, testing, kotlin, coroutines ] 
image: /assets/images/junit6-suspend-img.png
---

# Introduction

JUnit 6 was officially released on September 30, 2025, marking the next evolution of the popular Java testing framework.
Building on the robust foundation of JUnit 5, this release brings several important improvements
and some breaking changes aimed at modern JVM development, including enhanced Kotlin support.

## Key Changes from JUnit 5 to JUnit 6

- **Java 17 and Kotlin 2.2 baseline:** JUnit 6 requires Java 17 or higher and Kotlin 2.2 or higher, reflecting the
  current state of modern JVM ecosystems.
- **Support for Kotlin suspend functions as test methods:** You can now mark test and lifecycle methods with `suspend`
  directly, a major improvement for Kotlin developers.
- **Enhanced nested class ordering:** Deterministic ordering of `@Nested` test classes makes test execution more
  reliable.
- **Unified versioning:** Platform, Jupiter, and Vintage modules now share a single version number for easier
  management.
- **Use of JSpecify annotations:** Nullability annotations have been added to express contracts more clearly.
- **Removal of deprecated modules:** `junit-platform-runner` and `junit-platform-jfr` were removed to simplify the
  platform.
- **Migration to FastCSV:** Parameterized tests now rely on FastCSV, which provides better performance and clearer error
  handling.

For a complete list of changes, the official JUnit 6 [release notes](https://docs.junit.org/6.0.0/release-notes/)
provide extensive details.

## Kotlin suspend functions in JUnit 6

One of the most exciting features for Kotlin developers is the native support for `suspend` functions as test and
lifecycle methods.
Previously, testing suspend functions required the use of coroutine test utilities like `runTest`,
but JUnit 6 now lets you mark test functions directly as `suspend`.

### Comparison of the previous and new approaches to testing suspend functions

| Previous approach (with `runTest`)             | New approach (native suspend test)                     |
|------------------------------------------------|--------------------------------------------------------|
| `fun testMethod() = runTest { suspendCall() }` | `suspend fun testMethod() { suspendCall() }`           |
| Explicit coroutine test scope needed           | Tested directly by JUnit with native coroutine support |
| Slightly more verbose, requires `runTest`      | Cleaner and more idiomatic Kotlin `suspend` functions  |
| Requires coroutine test dependency             | Fully integrated, better IDE recognition               |

### Practical example

### Setup pom.xml

Let's define the necessary dependencies in your `pom.xml` for a Maven project:

```xml

<dependencies>
  <dependency>
    <groupId>org.jetbrains.kotlin</groupId>
    <artifactId>kotlin-reflect</artifactId>
    <version>2.2.20</version>
  </dependency>
  <dependency>
    <groupId>org.junit.jupiter</groupId>
    <artifactId>junit-jupiter</artifactId>
    <version>6.0.0</version>
    <scope>test</scope>
  </dependency>
  <dependency>
    <groupId>org.jetbrains.kotlinx</groupId>
    <artifactId>kotlinx-coroutines-core</artifactId>
    <version>1.10.2</version>
  </dependency>
  <!--NOT NEEDED ANYMORE, REQUIRED BY EXAMPLES:-->
  <dependency>
    <groupId>org.jetbrains.kotlinx</groupId>
    <artifactId>kotlinx-coroutines-test</artifactId>
    <version>1.10.2</version>
    <scope>test</scope>
  </dependency>
</dependencies>
```

### Simple suspend function to test

```kotlin
class MyService {
  suspend fun greeting(): String = "Hello, JUnit 6!"
}
```

### Writing tests with JUnit 6

Previously, developers had to use `runTest` from `kotlinx-coroutines-test`:

```kotlin
@Test
fun `test suspend function with explicit runTest usage`() = runTest {
    val result = MyService().greeting()
    assertEquals("Hello, JUnit 6!", result)
  }
```

No longer needed! Now you can simply write:

```kotlin
@Test
suspend fun `test suspend function without runTest`() {
  val result = MyService().greeting()
  assertEquals("Hello, JUnit 6!", result)
}
```

{% include warn.html content="IntelliJ still shows warning above test method name, but it’s only a matter of time before
it is supported" %}

<br>
As you can see, `runTest` is no longer needed—JUnit 6 handles coroutine context and execution for you. 

However, adopting native suspend test support introduces an important nuance: when using suspend functions,
especially within nested test classes, you often need to adjust the test instance lifecycle to ensure all tests run
reliably.

This is where `@TestInstance` and `@Nested` become essential tools for stable and predictable coroutine-based testing.

## Understanding `@TestInstance` and `@Nested` in JUnit 6

### What is `@TestInstance`?

JUnit creates test class instances to run test methods. By default, it uses the **`PER_METHOD`** lifecycle, meaning a 
**new instance is created for every test method**. This ensures test isolation but can cause problems when:

- You want to share state between test methods.
- You are writing Kotlin suspend functions, especially inside nested test classes, which require a stable instance for
  coroutine continuations to work properly.

Annotating a test class with `@TestInstance(TestInstance.Lifecycle.PER_CLASS)` changes the lifecycle so that a
***single test class instance*** is created and shared across all test methods. This enables:

- **Stable execution of suspend functions** in tests.
- Ability to write non-static lifecycle methods such as `@BeforeAll` and `@AfterAll`.
- Proper discovery and execution of nested tests that use suspend functions.

---

### What is `@Nested`?

`@Nested` allows you to group tests in inner classes to better organize and structure tests. Nested classes behave like
separate test containers inside the outer class.

When you combine `@Nested` with suspend test functions, lifecycle management becomes important, because each nested test
class can have its own lifecycle and instance creation policy.

---

### Why use `@TestInstance(PER_CLASS)` with `@Nested` and suspend?

- Kotlin suspend functions create continuations that require a stable, single test instance.
- Without `PER_CLASS`, creating a new instance per test method can break coroutine continuations.
- In nested test classes, `PER_CLASS` enables sharing the class instance so suspend tests run correctly.
- It allows non-static lifecycle methods on nested classes, improving ease of setup/cleanup.

---

### Example Usage

```kotlin
class MyServiceTest {

  @Nested
  @TestInstance(TestInstance.Lifecycle.PER_CLASS)
  inner class NewWay {
    @Test
    suspend fun `test suspend function without runTest`() {
      val result = MyService().greeting()
      assertEquals("Hello, JUnit 6!", result)
    }
  }

  @Nested
  @TestInstance(TestInstance.Lifecycle.PER_CLASS)
  inner class PreviousWay {
    @Test
    fun `test suspend function with explicit runTest usage`() = runTest {
      val result = MyService().greeting()
      assertEquals("Hello, JUnit 6!", result)
    }
  }
}

```

### Summary

- `@TestInstance` controls whether a new test instance is created per test method (`PER_METHOD` default) or per test
  class (`PER_CLASS`).
- `PER_CLASS` is essential for Kotlin suspend functions to work properly in JUnit 6, especially inside nested test
  classes.
- `@Nested` helps organize tests but requires careful lifecycle management when combined with suspend tests.
- Use `@TestInstance(TestInstance.Lifecycle.PER_CLASS)` on nested classes with suspend functions to ensure stable test
  execution.

This combination gives you clean, organized, and coroutine-friendly tests in JUnit 6 with Kotlin. Here are the results:

![JUnit 6 Test Results](/assets/images/junit6-suspend-nested.png)

---

## Conclusion

JUnit 6 represents a powerful step forward, especially for Kotlin developers embracing coroutines. Its improved
coroutine support greatly simplifies unit testing asynchronous code and brings a more idiomatic Kotlin experience right
into the testing framework.

Happy testing in JUnit 6!

---

*References:*

- [JUnit 6 Release Notes](https://docs.junit.org/6.0.0/release-notes/)
- [JUnit User Guide](https://docs.junit.org/6.0.0/user-guide/)
