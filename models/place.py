#!/usr/bin/python3
""" Place Module for HBNB project """
from models.base_model import BaseModel, Base
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Table, String, Integer, Float, ForeignKey
from sqlalchemy.orm import relationship
from os import getenv
import models

place_amenity = Table("place_amenity", Base.metadata,
                     Column("place_id",
                            ForeignKey("places.id"),
                            primary_key=True,
                            nullable=False),
                     Column("amenity_id",
                            ForeignKey("amenities.id"),
                            primary_key=True, nullable=False),
                      mysql_collate='latin1_swedish_ci')


class Place(BaseModel, Base):
    """Class Place"""
    __tablename__ = "places"
    city_id = Column(String(60), ForeignKey("cities.id"), nullable=False)
    user_id = Column(String(60), ForeignKey("users.id"), nullable=False)
    name = Column(String(128), nullable=False)
    description = Column(String(1024), nullable=True)
    number_rooms = Column(Integer, nullable=False, default=0)
    number_bathrooms = Column(Integer, nullable=False, default=0)
    max_guest = Column(Integer, nullable=False, default=0)
    price_by_night = Column(Integer, nullable=False, default=0)
    latitude = Column(Float, nullable=True)
    longitude = Column(Float, nullable=True)
    amenity_ids = []


    if getenv("HBNB_TYPE_STORAGE") == "db":
        reviews = relationship("Review", cascade='all, delete, delete-orphan',
                              backref="place")

        amenities = relationship("Amenity", secondary="place_amenity",
                                viewonly=False,
                                back_populates="place_amenities")
    else:
        @property
        def reviews(self):
            """list of reviews.id"""
            var = models.storage.all()
            lista = []
            result = []
            for key in var:
                review = key.replace('.', ' ')
                review = shlex.split(review)
                if (review[0] == 'Review'):
                    lista.append(var[key])
                for elem in lista:
                    if (elem.place_id == self.id):
                        result.append(elem)
                        return (result)

        @property
        def amenities(self):
            """returns list of amenity id"""
            return self.amenity_ids

        @amenities.setter
        def amenities(self, obj=None):
            """sets amenities id to attribute"""
            if type(obj) is Amenity and obj.id not in self.amenity_ids:
                self.amenity_ids.append(obj.id)
