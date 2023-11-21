/**
 * @description Find tests that call a function called "pressActionKey" 
 * @kind problem
 * @id javascript/tests-with-pressActionKey
 * @problem.severity recommendation
 */
import javascript

/**
 * Holds if a function has "pressActionKey"
 */
predicate hasPressActionKey(Function f) {
  f.getName() = "pressActionKey"
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

/**
* Holds if `caller` contains a call to `callee`.
*/
predicate calls(Function caller, Function callee) {
  exists(DataFlow::CallNode call |
    call.getEnclosingFunction() = caller and
    call.getACallee() = callee
  )
}

from Function test, Function callee
where isTest(test) and
      hasPressActionKey(callee)
      and calls(test, callee)
select test, "contains function pressActionKey"