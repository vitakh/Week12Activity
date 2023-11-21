/**
 * @description Find functions that are longer than 10 lines
 * @kind problem
 * @id javascript/functions-longer-than-10-lines
 * @problem.severity recommendation
 */
import javascript

/**
 * Holds if a function is longer than 10 lines.
 */
predicate isLongerThan10Lines(Function func) {
    exists(MethodBody md | md.getBody() = func) and
    func.getNumLines() > 10;
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

from Function f, Function callee
where isLongerThan10Lines(f) and
      calls+(test, callee)
select callee, "is longer than 10 lines"