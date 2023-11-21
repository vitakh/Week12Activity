/**
 * @description Find tests that call a function called "pressActionKey" 
 * @kind problem
 * @id javascript/tests-with-pressActionKey
 * @problem.severity recommendation
 */
import javascript

predicate hasPressActionKey(Function f) {
  f.getName() = "pressActionKey";
}

from File file
where hasPressActionKey(file)
select file, "Tests contain function pressActionKey"