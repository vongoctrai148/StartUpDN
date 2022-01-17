package com.doanTN.startupDN.services;

import com.doanTN.startupDN.daos.EventsReferencesDAO;
import com.doanTN.startupDN.entities.EventsReferences;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class EventsReferencesServices {
    @Autowired
    private EventsReferencesDAO eventsReferencesDAO;

    @Transactional
    public List<EventsReferences> getALlEventsReferences(){
        return eventsReferencesDAO.findAll();
    }

    @Transactional
    public EventsReferences getEventsReferencesById (Long id){
        return eventsReferencesDAO.findById(id).get();
    }
}
