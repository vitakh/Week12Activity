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
    func.getNumLines() > 10
  )
}

from Function f
where isLongerThan10Lines(f)
select f, f.getName(), f.getNumLines(), "is longer than 10 lines"