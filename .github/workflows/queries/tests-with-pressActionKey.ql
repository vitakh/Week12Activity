/**
 * @description Find tests that call a function called "pressActionKey" 
 * @kind problem
 * @id javascript/tests-with-pressActionKey
 * @problem.severity recommendation
 */
import javascript

predicate hasPressActionKey(Function f) {
  f.getACallee().getName() = "pressActionKey"
}

/**
 * Holds if a function is a test.
 */
predicate isTest(Function test) {
  exists(CallExpr describe, CallExpr it |
    describe.getCalleeName() = "describe" and
    it.getCalleeName() = "it" and
    it.getParent*() = describe and
    test = it.getArgument(1)
  )
}

from Function test, Function callee
where isTest(test) and
      hasPressActionKey(test)
select test, "contains function pressActionKey"