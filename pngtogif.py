import os
import imageio

#store all png filenames to this list
filenames = sorted((fn for fn in os.listdir('C:/Users/gunne/Desktop/Github_Repos/DCGAN/output/images') if fn.endswith('.png')))

#get every nth iteration
filenames = filenames[0::10]
with imageio.get_writer('C:/Users/gunne/Desktop/Github_Repos/DCGAN/output/movie.gif', mode='I', duration=0.3) as writer:
    for filename in filenames:
        image = imageio.imread('C:/Users/gunne/Desktop/Github_Repos/DCGAN/output/images/'+filename)
        writer.append_data(image)
