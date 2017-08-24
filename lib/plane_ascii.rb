module Plane
  def self.plane
    plane_ascii = Array.new(20, " "*121)

    plane_ascii[3]  = "                                                                                11                                       "
    plane_ascii[4]  = "                                                                                 111                                     "
    plane_ascii[5]  = "                                                                                  11111                                  "
    plane_ascii[6]  = "                                                                                   1111111                               "
    plane_ascii[7]  = "                                                                1                   111111111                            "
    plane_ascii[8]  = " 1111  111111  111111   11111  11    11  11111  11     11       11                   1111111111                          "
    plane_ascii[9]  = " 11    11  11  11  11   11     11 11 11  11     11     11       111                   11111111111                        "
    plane_ascii[10] = " 1111  111111  11111    11111  11 11 11  11111  11     11       1111111111111111111111111111111111111111111111111111     "
    plane_ascii[11] = " 11    11  11  11   11  11     11 11 11  11     11     11       1111111111111111  11111  11111  11111  11111  111111111  "
    plane_ascii[12] = " 11    11  11  11   11  11111  11111111  11111  11111  11111    1111111111111111111111111111111111111111111111111111     "
    plane_ascii[13] = "                                                                111                   11111111111                        "
    plane_ascii[14] = "                                                                11                   1111111111                          "
    plane_ascii[15] = "                                                                1                   111111111                            "
    plane_ascii[16] = "                                                                                   1111111                               "
    plane_ascii[17] = "                                                                                  11111                                  "
    plane_ascii[18] = "                                                                                 111                                     "
    plane_ascii[19] = "                                                                                11                                       "

    for i in 0..6
      system "clear"
      plane_ascii.each do |line|
        puts ColorizedString[line[60 - (10 * i), 60]].magenta
      end
      sleep(0.5)
    end
  end
end
