package se.BTH.ITProjectManagement.controllers;

import org.apache.log4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import se.BTH.ITProjectManagement.models.SubTask;
import se.BTH.ITProjectManagement.models.Task;
import se.BTH.ITProjectManagement.repositories.SubTaskRepository;


import javax.validation.Valid;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Collection;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/api/subtask")
public class SubTaskController {
    private static org.apache.log4j.Logger log = Logger.getLogger(SubTaskController.class);

    @Autowired
    private SubTaskRepository repository;

    public SubTaskController(SubTaskRepository repository) {
        this.repository = repository;
    }

    // Displaying the initial subtask list
    @RequestMapping(value = "/subtasks", method = RequestMethod.GET)
    public String getSubtasks(Model model){
        log.debug("Request to fetch all subtasks from the mongo database");
        List<SubTask> subtask_list= repository.findAll();
        model.addAttribute("subtasks", subtask_list);
        return "subtask";
    }
    // Opening the add new task form page.
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addSubtask(Model model) {
        log.debug("Request to open the new sub task form page");
        SubTask subTask=SubTask.builder().Estimate(0).build();
        repository.save(subTask);
        model.addAttribute("subtaskAttr", subTask);
        return "subtaskform";
    }
    // opening the edit task form page.
    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String editSubtask(@RequestParam(value = "id", required = true) String id, Model model){
        log.debug("Request to open the edit subtask form page ");
        model.addAttribute("subtaskAttr", repository.findById(id));
        return "subtaskform";
    }
    // Deleting the specified subtask.
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String deleteSubtask(@RequestParam(value = "id", required = true) String id, Model model){
        repository.deleteById(id);
        return "redirect:subtasks";
    }
    // Adding a new subtask or uppdating an existing subtask.
    @RequestMapping(value = "save",method = RequestMethod.GET)
    public String saveSubtask(@ModelAttribute("subtaskAttr") SubTask subTask){
        repository.save(subTask);
        return "redirect:subtask";
    }




    /*@GetMapping("/subtasks")
    Collection<SubTask> subtasks() {
        return repository.findAll();
    }

    @GetMapping("/subtask/{id}")
    ResponseEntity<?> getSubTask(@PathVariable String id) {
        Optional<SubTask> subtask = repository.findById(id);
        return subtask.map(response -> ResponseEntity.ok().body(response))
                .orElse(new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    @PostMapping(value = "/subtask", consumes = MediaType.APPLICATION_JSON_VALUE)
    ResponseEntity<SubTask> createSubTask(@Valid @RequestBody SubTask subtask) throws URISyntaxException {
        log.info("Request to create subtask: {}", subtask);
        SubTask result = repository.save(subtask);
        return ResponseEntity.created(new URI("/api/subtask/" + result.getId())).body(result);
    }

    @PutMapping("/Subtask")
    ResponseEntity<SubTask> updateTask(@Valid @RequestBody SubTask subtask) {
        log.info("Request to update subtask: {}", subtask);
        SubTask result = repository.save(subtask);
        return ResponseEntity.ok().body(result);
    }

    @DeleteMapping("/subtask/{id}")
    public ResponseEntity<?> deleteSubTask(@PathVariable String id) {
        log.info("Request to delete subtask: {}", id);
        repository.deleteById(id);
        return ResponseEntity.ok().build();
    }*/
}
