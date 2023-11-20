package com.expert.demo.controllers;

import com.expert.demo.repository.RepositoryDB;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.web.bind.annotation.*;
import com.expert.demo.model.*;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("/")
public class MainController {
    private RepositoryDB esDao;
    @Autowired
    public void setEsDao(RepositoryDB esDao) {
        this.esDao = esDao;
    }

    @RequestMapping("/")
    public ModelAndView index() {
        List<DiseaseType> diseaseTypes = esDao.getDiseaseTypes();
        ModelAndView model = new ModelAndView("index");
        model.addObject("diseaseTypes", diseaseTypes);
        return model;
    }

    @RequestMapping("/symptoms-by-disease-type-id")
    @ResponseBody
    public List<Symptom> symptomsByDiseaseTypeId(@RequestParam("typeId") long typeId) {
        return esDao.getSymptomsByDiseaseTypeId(typeId);
    }

    @RequestMapping("/diseases-by-symptoms-ids")
    @ResponseBody
    public List<Disease> diseasesBySymptomsIds(@RequestParam("ids") List<Long> trueSymptomIds,
                                               @RequestParam("typeId") long typeId) {
        return esDao.getProbableDiseasesBySymptomsIds(trueSymptomIds, typeId);
    }

}
