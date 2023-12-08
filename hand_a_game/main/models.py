from django.db import models
from django.utils import timezone

# Create your models here.
import datetime
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin

class MyUserManager(BaseUserManager):
  def create_user(self, email, username, password=None, city=None, phone=None, **extra_fields):
    if not email:
      raise ValueError('O endereço de e-mail deve ser fornecido')
    email = self.normalize_email(email)
    user = self.model(email=email, username=username, city=city, phone=phone, **extra_fields)
    user.set_password(password)
    user.save(using=self._db)
    return user

  def create_superuser(self, email, username, password=None, **extra_fields):
    extra_fields.setdefault('is_staff', True)
    extra_fields.setdefault('is_superuser', True)
    return self.create_user(email, username, password, **extra_fields)

class User(AbstractBaseUser, PermissionsMixin, models.Model):
  username = models.CharField(max_length=200)
  email = models.EmailField(unique=True)
  city = models.CharField(max_length=200, blank=True, null=True)
  phone = models.CharField(max_length=200, blank=True, null=True)
  password = models.CharField(max_length=200)

  is_staff = models.BooleanField(default=False)

  objects = MyUserManager()

  USERNAME_FIELD = 'email'
  REQUIRED_FIELDS = ['username']

  def __str__(self):
    return self.email

class Platform(models.Model):
  platformName = models.CharField(max_length=200)
  logo = models.ImageField(upload_to='images/platforms/')
  
  def __str__(self):
    return self.platformName

class Game(models.Model):
  title = models.CharField(max_length=200)
  isRented = models.BooleanField()
  isPhysical = models.BooleanField()
  cover =  models.ImageField(upload_to='images/games/')
  rentalDuration = models.IntegerField()
  price = models.DecimalField(default=0.0, decimal_places=2, max_digits=5)
  isAvailableToRent = models.BooleanField()

  platform = models.ForeignKey(Platform, on_delete=models.CASCADE)
  user = models.ForeignKey(User, on_delete=models.CASCADE)

  genres = models.ManyToManyField('Genre')
  
  def add_game(self, 
    title, isPhysical, cover, rentalDuration, 
    price, isAvailable, platform, genres, user
  ):
    game = Game()
    game.title = title
    game.isRented = False
    game.isPhysical = isPhysical
    game.cover = cover
    game.rentalDuration = rentalDuration
    game.price = price
    game.isAvailableToRent = isAvailable
    game.platform = platform
    game.user = user
    game.save()

    game.genres.set(genres)

  def edit_game(self,
    title, isPhysical, cover, rentalDuration, 
    price, isAvailable, platform, genres, user
  ):
    self.title = title
    self.isPhysical = isPhysical
    self.cover = cover
    self.rentalDuration = rentalDuration
    self.price = price
    self.isAvailableToRent = isAvailable
    self.platform = platform
    self.save()
    
    self.genres.set(genres)

  
  def __str__(self):
    return f"{self.id}: {self.title}"

class Genre(models.Model):
  genreName = models.CharField(max_length=200)
  
  def __str__(self):
    return self.genreName

class RentalManager(models.Model):
  initialDate = models.DateField()

  user = models.ForeignKey(User, on_delete=models.CASCADE)
  game = models.ForeignKey(Game, on_delete=models.CASCADE)

  def __str__(self):
    return f"Jogo {self.game} alugado por {self.user} em {self.initialDate}"
  
class Notification(models.Model):
  content = models.CharField(max_length=4999)
  date = models.DateField()

  user = models.ForeignKey(User, on_delete=models.CASCADE)

  def __str__(self):
    return f"{self.content}"